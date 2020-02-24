module LinkParser
  class Content
    include Singleton

    attr_reader :content

    def initialize
      @content = YAML.load(File.read(
          LinkParser.root.join('config', 'locales', 'errors.yml')))
    end
  end
end
