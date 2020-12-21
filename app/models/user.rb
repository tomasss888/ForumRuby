class User < ApplicationRecord
  rolify
  # Using Devise you can add all of this to database
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable

  has_many :discussions, dependent: :destroy
end
