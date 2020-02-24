# frozen_string_literal: true

module LinkParser
  class Site < ActiveRecord::Base
    validates_presence_of :status
    validates_presence_of :url
  end
end
