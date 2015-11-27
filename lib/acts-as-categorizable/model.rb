require 'ancestry'

module ActsAsCategorizable
  module Model

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      mattr_accessor :categories_class_name, :categories_category_class_name

      # Makes ActiveRecord::Base object categorizable
      def acts_as_categorizable(options = {})
        default_options = {
          table_name: 'aac_categories',
          class_name: 'ActsAsCategorizable::Category',
          dependent: :nullify
        }
        options = default_options.merge(options)

        has_one :categorizable_category,
                class_name: 'ActsAsCategorizable::CategorizableCategory',
                as: :categorizable
        has_one :category,
                through: :categorizable_category,
                as: :categorizable,
                class_name: options[:class_name],
                dependent: options[:dependent]

        self.categories_class_name = options[:class_name].constantize
        self.categories_category_class_name =
          'ActsAsCategorizable::CategorizableCategory'.constantize

        # Make categories behave like a tree
        self.categories_class_name.has_ancestry orphan_strategy: :adopt
        self.categories_class_name.table_name = options[:table_name]
        self.categories_class_name.initialize_scopes

        # Scopes
        scope :in_category, (-> (category) do
          joins(:categorizable_category)
            .where("#{self.categories_category_class_name.table_name}.category_id = ?",
                   category.try(:id))
        end)

        include ActsAsCategorizable::Model::InstanceMethods
      end
    end

    module InstanceMethods
    end
  end
end