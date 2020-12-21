# frozen_string_literal: true

# Reply model
class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user

  # checks if not empty
  validates :reply, presence: true
end
