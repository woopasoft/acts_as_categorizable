$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'active_record/railtie'
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = 3

require 'bundler/setup'
Bundler.require(:default)

require 'acts-as-categorizable'
require 'database_cleaner'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

ActiveRecord::Migration.verbose = false

RSpec.configure do |config|
  config.before(:all) do
    # Initialize global sample data
    @home_page = Page.create(title: 'Home Page')
    @child_page = Page.create(title: 'Child Page')
    @about_us_page = Page.create(title: 'About Us')
  end

  # Database cleaner and stuff
  config.before(:suite) do
    ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
    create_database

    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def create_database
  ActiveRecord::Schema.define(version: 1) do
    create_table :aac_categorizable_category do |t|
      t.references :categorizable, polymorphic: true
      t.references :category
    end

    create_table :aac_categories do |t|
      t.string :title
      t.string :slug

      t.boolean :active, default: true
      t.string :ancestry

      t.timestamps null: false
    end

    create_table :custom_categories do |t|
      t.string :title
      t.string :slug

      t.boolean :active, default: true
      t.string :ancestry

      t.timestamps null: false
    end

    create_table :pages do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end

def drop_database
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end