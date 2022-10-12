class Song < ApplicationRecord
  belongs_to :artist
  has_many :downloads

  def self.top(days, count)
    time_range = (days.days.ago..Time.now)

    Song.joins(:downloads)
        .distinct
        .where('downloads.created_at' => time_range)
        .order(downloads_count: :desc)
        .limit(count)
  end
end
