# frozen_string_literal: true

module LinkParser
  class SitesController < AbstractController
    def create
      if define_links?
        site_factory = LinkParser::SiteFactory.new(links.uniq)
        site_collect = async_off? ? site_factory.create : site_factory.async_create
        logger.info("Fail sites: #{site_collect[:errors]}") if site_collect[:errors].present?

        render :json, site_collect[:success]
      else
        render :json, { error: locale['errors']['sites']['link_undefined'] }
      end
    end

    private

    def define_links?
      params.has_key?('links')
    end

    def links
      params['links']
    end

    def async_off?
      params.has_key?('async_off')
    end
  end
end
