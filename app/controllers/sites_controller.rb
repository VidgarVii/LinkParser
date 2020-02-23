module LinkParser
  class SitesController < ApplicationController

    def create
      if define_links?
        collect = Set.new
        threads = []

        links.each do |link|
          threads << Thread.new(link) do |url|
            response = Faraday.get url
            collect << {
                status: response.status,
                url: url,
                title: Nokogiri::HTML(response.env.response_body).title
            }
          end
        end
        threads.each(&:join)

        sites = LinkParser::Site.import(collect.to_a)

        response.write('Data write successfully')
      end
    end

    private

    def define_links?
      params.include?('links')
    end

    def links
      params['links']
    end
  end
end
