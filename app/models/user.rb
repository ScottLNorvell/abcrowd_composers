class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Basic Authentication
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Other Stuff!
  # attr_accessible :other :stuff
end
