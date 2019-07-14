class Event < ApplicationRecord

  #has_and_belongs_to_many :users

  validates :title, presence: true, length: {minimum: 5, maximum: 50}, uniqueness: true
  validates :description, presence: true, length: {minimum: 15, maximum: 500}
  validates :venue, presence: true
  validates :date_time, presence: true
end