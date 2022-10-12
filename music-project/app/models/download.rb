class Download < ApplicationRecord
  belongs_to :song, counter_cache: true
end
