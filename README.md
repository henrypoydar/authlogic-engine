# Authlogic Engine

A simple engines-based wrapper for [Authlogic](http://github.com/binarylogic/authlogic). Provides basic models, controllers, routing and specs for RESTfully-accessed User and UserSession objects.

## Requirements

* Rails 2.3+
* [authlogic](http://github.com/binarylogic/authlogic) gem/plugin 
* [engines-helper](http://github.com/hpoydar/engines-helper) plugin
* Haml (optional, but if you don't want to use it, you'll have to override the views)

## Installation

As a submodule:
    
    git submodule add git://github.com/hpoydar/authlogic-engine.git vendor/plugins/authlogic-engine
  
Direct installation:

    script/plugin install git://github.com/hpoydar/authlogic-engine.git

### Run the migrations after the code is installed

    rake engines:sync:migrations

## Usage

The plugin provides the following, all of which can be overidden and/or extended (along with the authlogic functionality):

* `/signup`, which uses UsersController#new
* `/profile`, which uses UsersController#show, #edit and #update
* `/login` and `/logout`, which use UserSessions#new, #destroy
* A `current_user` helper method for use across controllers and views in your app

## License

Authlogic is copyright (c) Ben Johnson of Binary Logic, released under the MIT license

Copyright (c) Henry Poydar, released under the MIT license
