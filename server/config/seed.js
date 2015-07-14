/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var Thing = require('../api/thing/thing.model');
var User = require('../api/user/user.model');
var List = require('../api/list/list.model');
var Campaign = require('../api/campaign/campaign.model');

Thing.find({}).remove(function() {
  Thing.create({
    name : 'Development Tools',
    info : 'Integration with popular tools such as Bower, Grunt, Karma, Mocha, JSHint, Node Inspector, Livereload, Protractor, Jade, Stylus, Sass, CoffeeScript, and Less.'
  }, {
    name : 'Server and Client integration',
    info : 'Built with a powerful and fun stack: MongoDB, Express, AngularJS, and Node.'
  }, {
    name : 'Smart Build System',
    info : 'Build system ignores `spec` files, allowing you to keep tests alongside code. Automatic injection of scripts and styles into your index.html'
  },  {
    name : 'Modular Structure',
    info : 'Best practice client and server structures allow for more code reusability and maximum scalability'
  },  {
    name : 'Optimized Build',
    info : 'Build process packs up your templates as a single JavaScript payload, minifies your scripts/css/images, and rewrites asset names for caching.'
  },{
    name : 'Deployment Ready',
    info : 'Easily deploy your app to Heroku or Openshift with the heroku and openshift subgenerators'
  });
});

var userCreatePromise = User.remove().exec().then(function() {
  return User.create({
    provider: 'local',
    name: 'Test User',
    email: 'test@test.com',
    password: 'test'
  }, {
    provider: 'local',
    role: 'admin',
    name: 'Admin',
    email: 'admin@admin.com',
    password: 'admin'
  }, function() {
      console.log('finished populating users');
    }
  );
});


var listCreatePromise = List.remove().exec().then(function() {
  return List.create({
    name: '2015',
    group: 'Top Names',
    names: [{
      name: 'Adam',
      gender: 'male'
    }, {
      name: 'Leah',
      gender: 'female'
    }, {
      name: 'David',
      gender: 'male'
    }]
  }, function() {
    console.log('finished building lists');
  });
});

Promise.all([userCreatePromise, listCreatePromise]).then(function() {
  console.log("Users and Lists have been built...now creating Campaigns");
  var listPromise = List.findOne({ name: '2015', group: 'Top Names' }).exec();
  var userPromise = User.findOne({ name: 'Test User' }).exec();
  var userPromise2 = User.findOne({ name: 'Admin' }).exec();
  Promise.all([listPromise, userPromise, userPromise2]).then(function(data) {
    var list = data[0];
    var user = data[1];
    var user2 = data[2];
    Campaign.find({}).remove(function() {
      Campaign.create({
        name: "Test Campaign",
        list: list._id,
        owned_by: [user._id, user2._id]
      }, function() {
        console.log('finished building campaigns');
      })
    });
  });
});
