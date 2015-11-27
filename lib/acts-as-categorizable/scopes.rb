require 'active_support/concern'

module ActsAsCategorizable
  module Scopes
    extend ActiveSupport::Concern

    included do
      initialize_scopes
    end

     module ClassMethods
      def initialize_scopes
        scope :by_slug, -> (slug) { where(slug: slug) }
        scope :search, -> (term) { where('title like :term', term: term) }
        scope :active, -> { where(active: true) }
      end
    end
  end
end
