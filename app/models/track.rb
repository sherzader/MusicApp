# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  song       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :song, :album_id, null: false
  
  belongs_to(
    :album,
    foreign_key: :album_id,
    class_name: "Album"
  )
end
