'use strict';

var express = require('express');
var controller = require('./campaign.controller');
var auth = require('../../auth/auth.service');

var router = express.Router();

router.get('/', auth.isAuthenticated(), controller.index);
router.get('/:id', auth.isAuthenticated(), controller.show);

// Voting
router.get('/:id/get-names', auth.isAuthenticated(), controller.getNamesToVote);
router.post('/', auth.isAuthenticated(), controller.create);
router.put('/:id/vote', auth.isAuthenticated(), controller.vote);
router.put('/:id/set-state', auth.isAuthenticated(), controller.setState);

router.put('/:id', auth.isAuthenticated(), controller.update);
router.patch('/:id', auth.isAuthenticated(), controller.update);
router.delete('/:id', auth.isAuthenticated(), controller.destroy);

module.exports = router;
