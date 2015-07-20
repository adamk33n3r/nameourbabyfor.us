path = require 'path'
fs = require 'q-io/fs'
glob = require 'glob'
csv = require 'csv-parse'

process.env.NODE_ENV = process.env.NODE_ENV || 'development'

config = require '../config/environment'
mongoose = require 'mongoose'
List = require('../api/list/list.model');

mongoose.connect config.mongo.uri, config.mongo.options

glob 'server/data/top/yob*.txt', (err, files) ->
  if files.length is 0
    mongoose.disconnect()
    return
  listsCreated = 0
  files.forEach (filePath) ->
    fs.read(filePath).then (fileData) ->
      csv fileData, (err, csvData) ->
        names = []
        boysNames = csvData.filter (entry) ->
          entry[1] == 'M'
        .slice 0, 100
        girlsNames = csvData.filter (entry) ->
          entry[1] == 'F'
        .slice 0, 100
        boysNames.concat(girlsNames).forEach (nameData, rank) ->
          if nameData[1] == 'M'
            gender = 'male'
          else
            gender = 'female'
          names.push
            name: nameData[0]
            gender: gender
            count: nameData[2]
            rank: rank + 1
        year = path.basename(filePath).match(/yob(\d{4})\.txt/)[1]
        console.log "Loading year", year
        listsCreated++
        List.create
          name: year
          group: 'Top Names'
          names: names
        , (err) ->
          console.log err if not err
          console.log 'finished building list', year
          if listsCreated == files.length
            console.log ("disconnecting")
            mongoose.disconnect()
