fs = require 'q-io/fs'
glob = require 'glob'
csv = require 'csv-parse'

glob '../data/yob2014.txt', (err, files) ->
  for file in files
    fs.read(file).then (fileData) ->
      csv fileData, (err, csvData) ->
        console.log csvData.sort()[67]
