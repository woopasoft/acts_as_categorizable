class CreateAacCategorizableCategoryTable < ActiveRecord::Migration
  def self.up
    create_table :aac_categorizable_category do |t|
      t.references :categorizable, polymorphic: true
      t.references :category
    end

    add_index :aac_categorizable_category, [:categorizable_id, :category_id], name: 'aac_ref_ids'
  end

  def self.down
    drop_table :aac_categorizable_category
  end
end
