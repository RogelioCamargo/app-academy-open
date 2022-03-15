require 'sqlite3'
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
	attr_accessor :id, :name, :birth_year

	def self.all
		data = PlayDBConnection.instance.execute(<<-SQL)
			SELECT * 
			FROM playwrights
		SQL
		data.map { |datum| PlayWright.new(datum) }
	end

	def self.find_by_name(playwright_name)
		playwright = PlayDBConnection.instance.execute(<<-SQL, playwright_name)
			SELECT * 
			FROM playwrights 
			WHERE name = ?
		SQL
		return nil if playwright.length == 0

		Playwright.new(playwright.first)
	end

	def initialize(options)
		@id = options['id']
		@title = options['name']
		@birth_year = options['birth_year']
	end

	def create
		raise "#{self} already in database" if self.id
		PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
			INSERT INTO 
				plays (name, birth_year)
			VALUES
				(?, ?)
		SQL
		self.id = PlayDBConnection.instance.last_insert_row_id
	end

	def update
		raise "#{self} not in database" unless self.id
		PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year self.id)
      UPDATE
        playwrights
      SET
        title = ?, birth_year = ?
      WHERE
        id = ?
    SQL
	end

	def get_plays
		raise "#{self} not in database" unless self.id
		plays = PlayDBConnection.instance.execute(<<-SQL, self.id)
			SELECT * 
			FROM plays 
			WHERE playwright_id = ?
		SQL

		plays.map { |play| Play.new(play) }
	end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

	def self.find_by_title(play_title)
		play = PlayDBConnection.instance.execute(<<-SQL, play_title)
			SELECT *
			FROM plays
			WHERE name = ?
		SQL
		return nil if play.length == 0

		Play.new(play.first)
	end

	def self.find_by_playwright(playwright_name)
		playwright = PlayWright.find_by_name(playwright_name)
		raise "#{name} not found in DB" unless playwright

		plays = PlayDBConnection.instance.execute(<<-SQL, playwright_id)
			SELECT *
			FROM plays
			WHERE playwright_id = ?
		SQL

		plays.map { |play| Play.new(play) }
	end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end
