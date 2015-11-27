class CreateAacCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.string :title
      t.string :slug

      t.references :categorizables, polymorphic: true, index: true
      t.boolean :active, default: true
      t.string :ancestry

      t.timestamps null: false

      # ancestry
      t.string :ancestry, index: true
    end
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
