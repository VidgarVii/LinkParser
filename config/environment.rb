require_relative '../lib/link_parser'

Bundler.require :default, LinkParser.env

LinkParser.application.bootstrap!
