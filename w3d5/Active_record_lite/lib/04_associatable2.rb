require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    # ...

    define_method(name) do
      through_options = self.class.assoc_options[through_name]

      source_options =
        through_options.model_class.assoc_options[source_name]
      parse.all(source_options)

      send_fk = self.send(through_fk)

      output = DBConnection.execute(<<-SQL, key_val)
        SELECT
          *
        FROM
          #{through_options.table_name}

        JOIN
          #{source_options.table_name}
          on #{through_options.table_name}.#{through_options.foreign_key} =
            #{source_options.table_name}.#{source_options.primary_key}
        WHERE
          #{through_options.table_name}.#{through_options.primary_key} = ?
      SQL

      self.parse.all(output).first

    end
  end
end
