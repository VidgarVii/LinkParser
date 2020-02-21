require_relative '../lib/link_parser'

Bundler.require :default, LinkParser.env
Dir[LinkParser.root.join('config', '**', '*.rb')].each { |f| require f }

LinkParser.application.bootstrap!
