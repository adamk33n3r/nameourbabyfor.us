'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;
var ForeignKey = Schema.Types.ObjectId;

var CampaignSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  list: {
    type: ForeignKey,
    ref: 'List',
    required: true
  },
  gender: {
    type: String,
    enum: ['male', 'female']
  },
  owned_by: [{
    type: ForeignKey,
    ref: 'User',
    required: true
  }],
  created_at: {
    type: Date,
    default: Date.now
  },
  active: {
    type: Boolean,
    default: true
  },
  votes: [{
    _id: false,
    name: String,
    count: Number,
    state: String
  }]
});

module.exports = mongoose.model('Campaign', CampaignSchema);
