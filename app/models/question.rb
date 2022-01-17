class Question < ApplicationRecord
  resourcify
  validates :name, presence: true, format: { with: /\A[a-zA-Z-À-ž\s]+\z/, message: "only allows letters" }
  validates :email, presence: true, format:{with: /\w+@\w+\.{1}[a-zA-Z]{2,}/, message: "not valid email address"}
end

