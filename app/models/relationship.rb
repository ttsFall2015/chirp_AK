class Relationship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, class_name: "User"
  #friend_id is just an alias of user_id > depends on who the "user" is, which defines who the rest of the "friends" are
  #store all users in one database
  #once this is set up, you can call @User.friend and it will give you friends data (or, @user.user.friends)
end
