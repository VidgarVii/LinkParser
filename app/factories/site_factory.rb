module LinkParser
  class SiteFactory

    def initialize(links)
      @links        = links
      @site_collect = []
    end

    def async_create
      extract_data
      LinkParser::Site.import(@site_collect, validate: true)
      @site_collect
    end

    def create
      @links.each do |link|
        response = http_client.get link

        push_in_site_collect(response, link)
      end
      LinkParser::Site.import(@site_collect, validate: true)
      @site_collect
    end

    private

    def push_in_site_collect(response, link)
      @site_collect << {
        status: response.status,
        url:    link,
        title:  Nokogiri::HTML(response.env.response_body).title
      }
    end

    def extract_data
      @links.map do |link|
        Thread.new do
          response = http_client.get link

          push_in_site_collect(response, link)
        end
      end.each(&:join)
    end
  end
end
