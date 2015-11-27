class CreateAacCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.string :title, index: true
      t.string :slug

      t.references :categorizables, polymorphic: true
      t.boolean :active, default: true

      # ancestry
      t.string :ancestry, index: true

      t.timestamps null: false
    end

    add_index :<%= table_name %>,
              [:categorizables_id, :categorizables_type],
              name: 'aac_categorizable_id'
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
