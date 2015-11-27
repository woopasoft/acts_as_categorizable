require 'active_record/railtie'
require 'active_support/core_ext'

module ActsAsCategorizable
  class Railtie < Rails::Railtie
    if defined?(ActiveRecord::Base)
      ActiveRecord::Base.send :include, ActsAsCategorizable::Model
    end
  end
end