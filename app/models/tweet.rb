class Tweet < ActiveRecord::Base
  #Creates the ActiveRecord
  belongs_to :user
  has_many :likes
  validates :message, presence: true, length: {maximum: 140, too_long: "A chirp is only 140 characters max. Everyone knows that!"}
end
