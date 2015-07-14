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
    name: String,
    count: Number
  }]
});

module.exports = mongoose.model('Campaign', CampaignSchema);