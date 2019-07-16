class Event < ApplicationRecord

  has_many :user_events
  has_many :users, through: :user_events

  validates :title, presence: true, length: {minimum: 5, maximum: 50}, uniqueness: true
  validates :description, presence: true, length: {minimum: 15, maximum: 500}
  validates :venue, presence: true
  validates :date_time, presence: true
end