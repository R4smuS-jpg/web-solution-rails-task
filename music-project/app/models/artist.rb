class Artist < ApplicationRecord
  has_many :songs

  def songs
    Song.artist_is(self).order(:title)
  end

  def songs_top
    Song.artist_is(self).order(downloads_count: :desc)
  end

  def self.top(letter, count)
    Artist.where('substr(name, 1, 1) = ?', letter).limit(count)
  end
end
