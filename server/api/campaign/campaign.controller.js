'use strict';

var _ = require('lodash');
var Campaign = require('./campaign.model');
var List = require('../list/list.model');

// Get list of campaigns
exports.index = function (req, res) {
  if (req.user === undefined)
    return res.json(404, 'No user provided');
  Campaign.find({ owned_by: req.user._id })
    .populate('list owned_by')
    .exec(function (err, campaigns) {
      if(err) { return handleError(res, err); }
      return res.json(200, campaigns);
  });
};

// Get a single campaign
exports.show = function(req, res) {
  Campaign.findById(req.params.id).populate('list owned_by').exec(function (err, campaign) {
    if(err) { return handleError(res, err); }
    if(!campaign) { return res.send(404); }
    return res.json(campaign);
  });
};

// Creates a new campaign in the DB.
exports.create = function (req, res) {
  Campaign.create(req.body, function (err, campaign) {
    if(err) { return handleError(res, err); }
    return res.json(201, campaign);
  });
};

// Updates an existing campaign in the DB.
exports.update = function (req, res) {
  if(req.body._id) { delete req.body._id; }
  Campaign.findById(req.params.id, function (err, campaign) {
    if (err) { return handleError(res, err); }
    if(!campaign) { return res.send(404); }
    var updated = _.merge(campaign, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.json(200, campaign);
    });
  });
};

// Deletes a campaign from the DB.
exports.destroy = function (req, res) {
  Campaign.findById(req.params.id, function (err, campaign) {
    if(err) { return handleError(res, err); }
    if(!campaign) { return res.send(404); }
    campaign.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};

function handleError (res, err) {
  return res.send(500, err);
}

// Custom
exports.getNamesToVote = function (req, res) {
  Campaign.findById(req.params.id, function (err, campaign) {
    if(err) { return handleError(res, err); }
    if(!campaign) { return res.send(404); }
    List.findById(campaign.list).select('names').exec(function (err, list) {
      if(err) { return handleError(res, err); }
      if(!list) { return res.send(404); }
      var names = list.getTwoRandomNames(campaign.gender);
      return res.json({
        name1: names[0].name,
        name2: names[1].name
      });
    });
  });
}

exports.vote = function (req, res) {
  var campaignID = req.params.id;
  var name = req.body.name;
  Campaign.findById(campaignID, function (err, campaign) {
    if(err) { return handleError(res, err); }
    if(!campaign) { return res.send(404); }
    var nameToVote = campaign.votes.filter(function (vote) {
      return vote.name === name;
    })[0];
    if(nameToVote) {
      nameToVote.count++
    } else {
      campaign.votes.push({
        name: name,
        count: 1
      });
    }
    campaign.save(function (err) {
      if(err) { return handleError(res, err); }
      return res.json({success: true});
    });
  });
};

exports.setState = function(req, res) {
  var campaignID = req.params.id;
  var name = req.body.name;
  var state = req.body.state;
  Campaign.findById(campaignID, function (err, campaign) {
    if(err) { return handleError(res, err); }
    if(!campaign) { return res.send(404); }
    var nameToSet = campaign.votes.filter(function (vote) {
      return vote.name === name;
    })[0];
    if (nameToSet) {
      nameToSet.state = state;
    } else {
      return res.send(404);
    }
    campaign.save(function(err){
      if(err) { return handleError(res, err); }
      return res.json({success: true});
    });
  });
};
