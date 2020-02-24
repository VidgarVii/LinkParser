# frozen_string_literal: true

def locale
  LinkParser::Content.instance.content
end

def http_client
  LinkParser::Adapters::HTTPClient.instance
end
