require 'authlogic_engine'
require 'authlogic_engine/filters'
require 'authlogic_engine/helper'

ActionController::Base.send :include, AuthlogicEngine::Filters
ActionController::Base.send :include, AuthlogicEngine::Helper
ActionView::Base.send :include, AuthlogicEngine::Helper

config.gem 'authlogic'