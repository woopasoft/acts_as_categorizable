require 'friendly_id'

module ActsAsCategorizable
  class Category < ::ActiveRecord::Base
    # Includes
    include ActsAsCategorizable::Scopes
    include ActsAsCategorizable::Finders

    # Extends
    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged, :finders]

    # Associations
    has_many :categorizable_category
    has_many :categorizables,
             through: :categorizable_category,
             source: :items

    # Validations
    validates :title, presence: true
    validates :slug, uniqueness: true

    # Callbacks
    before_validation :ensure_title

    def self.[](title)
      where(title: title.to_s.camelize).first_or_create!
    end

    private

    def slug_candidates
      [
        :title,
        [:title, :id]
      ]
    end

    def should_generate_new_friendly_id?
      title_changed? && !slug_changed? # User can set slug
    end

    def ensure_title
      self.title = slug.presence.try(:capitalize) if title.blank?
    end
  end
end
