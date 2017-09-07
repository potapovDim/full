require 'yaml'
require 'rspec'
require 'watir-webdriver'
require 'yaml'
require 'browserstack/local'
#landing 
require_relative '../po/landing-page/index'
require_relative '../po/landing-page/plan'
require_relative '../po/landing-page/pricing'
require_relative '../po/landing-page/login'
require_relative '../po/landing-page/sign-up'
require_relative '../po/landing-page/plan'
require_relative '../po/landing-page/footer'
require_relative '../po/landing-page/concepts'
require_relative '../po/landing-page/magic-start'
#account 
require_relative '../po/account/index'
require_relative '../po/account/my-profile'
require_relative '../po/account/my-websites'
require_relative '../po/account/website-settings'
#editor 
require_relative '../po/editor/index'
require_relative "../po/editor/top-nav/index"
require_relative "../po/editor/top-nav/new-tab"
require_relative "../po/editor/context-panel/context-panel"
#editor parts
#block
require_relative '../po/editor/block/index'
#elements
require_relative '../po/editor/elements/index'
#apps
require_relative '../po/editor/apps/index'
#left nav
require_relative '../po/editor/left-nav/index'
require_relative "../po/editor/left-nav/add/index"
require_relative "../po/editor/left-nav/pages/index"
require_relative "../po/editor/left-nav/pages/create-new-page"
require_relative '../po/editor/row/index'
#helpers
require_relative '../helpers/index'