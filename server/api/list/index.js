'use strict';

var express = require('express');
var controller = require('./list.controller');

var router = express.Router();

router.get('/', controller.index);
router.get('/:id', controller.show);
router.post('/', controller.create);

router.get('/:id/get-names', controller.getNames);
router.post('/:id/set-gender', controller.setGender);

router.put('/:id', controller.update);
router.patch('/:id', controller.update);
router.delete('/:id', controller.destroy);

module.exports = router;
