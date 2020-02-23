module LinkParser
  class SiteFactory

    def initialize(links)
      @links = links
    end

    def async_create
      site_collect = extract_data
      LinkParser::Site.import(site_collect.to_a, validate: true)
      site_collect
    end

    private

    def extract_data
      site_collect = []

      @links.map do |link|
        Thread.new do
          response = http_client.get link

          site_collect << {
              status: response.status,
              url: link,
              title: Nokogiri::HTML(response.env.response_body).title
          }
        end
      end.each(&:join)

      site_collect
    end

    def http_client
      LinkParser::Adapters::HTTPClient.instance
    end
  end
end
