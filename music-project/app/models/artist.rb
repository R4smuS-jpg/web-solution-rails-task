class Artist < ApplicationRecord
  has_many :songs

  def songs
    artist_songs.order(:title)
  end

  def songs_top
    artist_songs.order(downloads_count: :desc)
  end

  def self.top(letter, count)
    Artist.where('substr(name, 1, 1) = ?', letter).limit(count)
  end

  private
  
    def artist_songs
      Song.where(artist_id: self.id)
    end
end
