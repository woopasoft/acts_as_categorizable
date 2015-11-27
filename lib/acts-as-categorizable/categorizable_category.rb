module ActsAsCategorizable
  class CategorizableCategory < ::ActiveRecord::Base
    self.table_name = 'aac_categorizable_category'

    belongs_to :category
    belongs_to :categorizable, polymorphic: true
  end
end
