class Note < ActiveRecord::Base
  belongs_to(
    :track
  )
  belongs_to(
    :user,
    through: :
  )
end
