# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :name, presence: true

  belongs_to(
    :band,
    foreign_key: :band_id,
    class_name: "Band"
  )
  has_many(
    :tracks,
    foreign_key: :track_id,
    class_name: "Track",
    dependent: :destroy
  )
end
