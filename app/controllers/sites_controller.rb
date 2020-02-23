module LinkParser
  class SitesController < AbstractController

    def create
      if define_links?
        site_collect = Set.new
        threads = []

        links.each do |link|
          threads << Thread.new(link) do |url|
            response = Faraday.get url
            site_collect << {
                status: response.status,
                url: url,
                title: Nokogiri::HTML(response.env.response_body).title
            }
          end
        end
        threads.each(&:join)

        LinkParser::Site.import(site_collect.to_a, validate: true)

        render :json, site_collect
      else
        render :json, { error: 'links undefined' }
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
