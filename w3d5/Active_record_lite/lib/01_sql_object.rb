require_relative 'db_connection'
require 'active_support/inflector'

# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    if @columns.nil?
      new_array = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
        SQL
      @columns = new_array.first.map(&:to_sym)
    end
    @columns
  end

  def self.finalize!
    self.columns.each do |name|
      define_method("#{name}") do
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name || self.name.tableize
  end

  def self.all
    # ...
    values = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      SQL

      self.parse_all(values)
  end


  def self.parse_all(results)
    # ...
    new_objects = results.map{|each_row| self.new(each_row)}
  end

  def self.find(id)
    # ...
    output = DBConnection.execute(<<-SQL, id)
       SELECT
         *
       FROM
         #{self.table_name}
       WHERE
         #{self.table_name}.id = ?
     SQL
      self.new(output.first) unless output.empty?
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name,value|

      if self.class.columns.include?(attr_name.to_sym)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end

    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    # ...
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ''...
    col_names = self.class.columns
        .map { |col_name| "#{col_name} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    # ...
    id.nil? ? insert : update
  end
end
