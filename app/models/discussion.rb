# frozen_string_literal: true

# Discussion model
class Discussion < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy

  # fields cant be empty
  validates :title, :content, presence: true
end
