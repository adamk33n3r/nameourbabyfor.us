path = require 'path'
fs = require 'q-io/fs'
glob = require 'glob'
csv = require 'csv-parse'

process.env.NODE_ENV = process.env.NODE_ENV || 'development'

config = require '../config/environment'
mongoose = require 'mongoose'
List = require('../api/list/list.model');

mongoose.connect config.mongo.uri, config.mongo.options

fs.read('server/data/bible_names.txt').then (fileData) ->
  names = fileData.split("\n")
  names = ({name: name} for name in names.slice(0, names.length - 1))
  List.create
    group: 'Not Ready'
    name: 'Biblical'
    names: names
  , ->
    mongoose.disconnect()
