require 'acts-as-categorizable/version'

module ActsAsCategorizable
  autoload :Model, 'acts-as-categorizable/model'
  autoload :Scopes, 'acts-as-categorizable/scopes'
  autoload :Finders, 'acts-as-categorizable/finders'
  autoload :Category, 'acts-as-categorizable/category'
  autoload :CategorizableCategory, 'acts-as-categorizable/categorizable_category'
end

require 'acts-as-categorizable/railtie'
