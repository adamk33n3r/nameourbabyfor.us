'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var ListSchema = new Schema({
  name: String,
  group: String,
  names: [{
    _id: false,
    name: String,
    gender: {
      type: String,
      enum: ['male', 'female']
    }
  }]
});

module.exports = mongoose.model('List', ListSchema);
