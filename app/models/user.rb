class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #This is iniating devise, a framework, to run across the user models

  has_many :tweets
  has_many :relationships
  has_many :friends, through: :relationships
  has_many :likes
  has_many :inverse_relationships, class_name: "Relationship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_relationships, source: :user



  validates :username, presence: true, uniqueness: true

  def likes?(tweet)
    tweet.likes.where(user_id: id).any?
  end
