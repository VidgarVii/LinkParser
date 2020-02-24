require_relative '../lib/link_parser'

Bundler.require :default, LinkParser.env
Dir[LinkParser.root.join('lib', 'link_parser', '*.rb')].each { |f| require f }
Dir[LinkParser.root.join('config', '**', '*.rb')].each { |f| require f }
Dir[LinkParser.root.join('lib', 'adapters', '*.rb')].each { |f| require f }
Dir[LinkParser.root.join('app', 'models', '*.rb')].each { |f| require f }
Dir[LinkParser.root.join('app', 'controllers', '*.rb')].each { |f| require f }
Dir[LinkParser.root.join('app', 'factories', '*.rb')].each { |f| require f }
