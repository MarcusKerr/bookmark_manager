require 'pg'
require 'uri'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |link| link ['url'] }
  end

  def self.add(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
  end

  def self.validate(url)
    return false unless url =~ /\A#{URI::regexp(['http', 'https'])}\z/
    add(url)
  end
end
