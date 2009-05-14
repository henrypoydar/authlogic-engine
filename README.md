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

The plugin provides the following paths and controller methods, all of which can be overridden and/or extended (along with the authlogic functionality):

* `/signup`, which uses UsersController#new
* `/profile`, which uses UsersController#show, #edit and #update
* `/login` and `/logout`, which use UserSessions#new, #destroy
* A `current_user` helper method for use across controllers and views in your app

A controller helper method for use with a before_filter throughout your application is also provided:

    require_logged_in_user

To quickly override the successful login, logout or signup redirect destination, add the following to an environment or initializer: (Defaults to '/')

    AuthlogicEngine.login_destination = your_custom_path
    AuthlogicEngine.logout_destination = your_custom_path
    AuthlogicEngine.signup_destination = your_custom_path

## License

Authlogic is copyright (c) Ben Johnson of Binary Logic, released under the MIT license

Copyright (c) Henry Poydar, released under the MIT license