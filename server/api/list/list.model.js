'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var ListSchema = new Schema({
  name: String,
  group: String,
  names: { // TODO: These should probably be another model. Then I can just query two random ones instead of loading all of them
    index: true,
    type: [{
      _id: false,
      name: String,
      count: Number,
      rank: Number,
      enabled: Boolean,
      gender: {
        type: String,
        enum: ['male', 'female']
      }
    }],
    select: false
  }
});

ListSchema.methods = {
  getTwoRandomNames: function(gender) {
    if (!this.names) { return false; }
    var names = this.names.filter(function(name) {
      return name.enabled && name.gender === gender;
    });
    var name1idx = Math.floor(Math.random() * names.length);
    var name2idx = Math.floor(Math.random() * names.length);
    while (name2idx === name1idx) { // Ensures different names
      name2idx = Math.floor(Math.random() * names.length);
    }
    return [
      names[name1idx],
      names[name2idx]
    ]
  }
}

module.exports = mongoose.model('List', ListSchema);
