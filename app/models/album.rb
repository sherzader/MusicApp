class Album < ActiveRecord::Base
  belongs_to(
    :band,
    foreign_key: :band_id,
    class_name: "Band"
  )
  has_many(
    :tracks,
    foreign_key: :track_id,
    class_name: "Track"
  )
end
