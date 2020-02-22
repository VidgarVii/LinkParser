module LinkParser
  class SitesController < ApplicationController

  def create

      response.write("\nSites created")
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
