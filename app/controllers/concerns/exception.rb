require 'active_support/concern'

module Exception
  extend ActiveSupport:: Concern 
  included do
    rescue_from ActiveRecord::RecordNotFound do |exceptio
  end
end