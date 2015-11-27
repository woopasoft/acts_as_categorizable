require 'rails/generators/migration'
require 'rails/generators/active_record'

module ActsAsCategorizable
  class MigrationGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    namespace "acts-as-categorizable:migration"

    source_root File.join(File.dirname(__FILE__), 'templates')
    argument :table_name, type: :string, default: 'aac_categories'

    def self.next_migration_number(dirname)
      ActiveRecord::Generators::Base.next_migration_number(dirname)
    end

    def create_migration_file
      migration_template 'migration.rb',
                         'db/migrate/create_aac_categories_table.rb'
      rescue nil
      migration_template 'relation_migration.rb',
                         'db/migrate/create_aac_categorizable_category_table.rb'
      rescue nil
    end
  end
end
