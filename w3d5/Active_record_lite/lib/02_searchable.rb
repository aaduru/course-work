require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    where_condtion = params.keys
      .map { |col_name| "#{col_name} = ? " }.join(" AND ")
    output = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_condtion}
    SQL

    parse_all(output)
  end

end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
