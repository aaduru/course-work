require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    class_name.constantize
  end

  def table_name
    # ...
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    # ...
  @primary_key = options[:primary_key] || :id
  @foreign_key = options[:foreign_key] || ((name.to_s.underscore)+ "_id").to_sym
  @class_name = options[:class_name] || name.to_s.camelcase

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    # ...
    @primary_key = options[:primary_key] || :id
    @foreign_key = options[:foreign_key] || ((self_class_name.to_s.underscore)+ "_id").to_sym
    @class_name = options[:class_name] || name.to_s.singularize.camelcase

  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
    options = BelongsToOptions.new(name,options)


    define_method(name) do
      @assoc_options = options
      fk_value = self.send(@assoc_options.foreign_key)

      options
      .model_class
      .where(@assoc_options.primary_key => fk_value)
      .first
    end

  end


  def has_many(name, options = {})

    options = HasManyOptions.new(name.to_s,self.name.to_s,options)

    define_method(name) do

      pk_value = self.send(options.primary_key)

      options
        .model_class
        .where(options.foreign_key => pk_value)

    end

  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
    @assoc_options
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
