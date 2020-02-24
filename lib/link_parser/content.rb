# frozen_string_literal: true

module LinkParser
  class Content
    include Singleton

    attr_reader :content

    def initialize
      @content = YAML.safe_load(File.read(
                                  LinkParser.root.join('config', 'locales', 'errors.yml')
                                ))
    end
  end
end
