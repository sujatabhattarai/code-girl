class Event < ApplicationRecord

  has_and_belongs_to_many :users

  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 15, maximum: 500}
end