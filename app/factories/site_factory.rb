# frozen_string_literal: true

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
        begin
          response = http_client.get link

          push_in_site_collect(response, link)
        rescue => exception
          logger.error(exception)
        end
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
          begin
            response = http_client.get link

            push_in_site_collect(response, link)
          rescue => exception
            logger.error(exception)
          end
        end
      end.each(&:join)
    end
  end
end
