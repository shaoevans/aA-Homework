require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class PlayWright
    attr_accessor :name, :birth_year

    def find_by_name(name)
        PlayDBConnection.instance.execute(<<-SQL, name)
            SELECT
                title
            FROM
                playwrights
            JOIN plays
                ON playwrights.id = plays.playwright_id
            WHERE
                playwrights.name = ?
        SQL
    end

    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map {|datum| PlayWrightl.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @name = options['name']
        @birth_year = options['birth year']
    end

    def create
        raise "#{self} is already in database" if @id
        PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
            INSERT INTO
                playwrights (name, birth_year)
            VALUES
                (?, ?)
        SQL
        self.id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not found in database" unless @id
        PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
            UPDATE
                playwrights
            SET
                name = ?, birth_year = ?
            WHERE
                id = ?
        SQL

    def get_plays
        PlayDBConnection.instance.execute(<<-SQL, self.id)
            SELECT
                title
            FROM
                playwrights
            JOIN plays
                ON playwrights.id = plays.play_wright_id
            WHERE
                playwrights.id = ?
        SQL
    end


end