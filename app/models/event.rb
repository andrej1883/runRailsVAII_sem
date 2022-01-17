class Event < ApplicationRecord
  resourcify
  validates :name, :organizer, presence: true, format: { with: /\A[a-zA-Z-À-ž\s]+\z/, message: "only allows letters" }
  validates :info, presence: true
  validates :name, uniqueness: true
end
