'use strict';

var _ = require('lodash');
var List = require('./list.model');

// Get list of lists
exports.index = function(req, res) {
  List.find(function (err, lists) {
    if(err) { return handleError(res, err); }
    return res.json(200, lists);
  });
};

// Get a single list
exports.show = function(req, res) {
  var list = List.findById(req.params.id);
  if(req.query.names)
    list.select('names');
  list.exec(function (err, list) {
    if(err) { return handleError(res, err); }
    if(!list) { return res.send(404); }
    return res.json(list);
  });
};

// Creates a new list in the DB.
exports.create = function(req, res) {
  List.create(req.body, function(err, list) {
    if(err) { return handleError(res, err); }
    return res.json(201, list);
  });
};

// Updates an existing list in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  List.findById(req.params.id, function (err, list) {
    if (err) { return handleError(res, err); }
    if(!list) { return res.send(404); }
    var updated = _.merge(list, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.json(200, list);
    });
  });
};

// Deletes a list from the DB.
exports.destroy = function(req, res) {
  List.findById(req.params.id, function (err, list) {
    if(err) { return handleError(res, err); }
    if(!list) { return res.send(404); }
    list.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};


exports.setGender = function(req, res) {
  List.findById(req.params.id).select('names').exec(function (err, list) {
    if(err) { return handleError(res, err); }
    if(!list) { return res.send(404); }
    var nameToChange = list.names.filter(function (name) {
      return name.name === req.body.name;
    })[0];
    if (nameToChange) {
      nameToChange.gender = req.body.gender;
      list.save(function (err) {
        if(err) { return handleError(res, err); }
        return res.json({success: true});
      });
    } else {
      return res.send(404);
    }
  });
};

exports.setEnabled = function(req, res) {
  List.findById(req.params.id).select('names').exec(function (err, list) {
    if(err) { return handleError(res, err); }
    if(!list) { return res.send(404); }
    var nameToChange = list.names.filter(function (name) {
      return name.name === req.body.name;
    })[0];
    if (nameToChange) {
      nameToChange.enabled = req.body.enabled;
      list.save(function (err) {
        if(err) { return handleError(res, err); }
        return res.json({success: true});
      });
    } else {
      return res.send(404);
    }
  });
}

exports.getNames = function(req, res) {
  List.findById(req.params.id).select('names').exec(function (err, list) {
    if(err) { return handleError(res, err); }
    if(!list) { return res.send(404); }
    var from = req.query.from;
    var to = req.query.to;
    return res.json(list.names.slice(from, to));
  });
};

function handleError(res, err) {
  return res.send(500, err);
}
