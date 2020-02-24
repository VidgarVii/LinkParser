module LinkParser
  class SitesController < AbstractController

    def create
      if define_links?
        site_collect = LinkParser::SiteFactory.new(links.uniq).async_create

        render :json, site_collect
      else
        render :json, { error: locale['errors']['sites']['link_undefined'] }
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
