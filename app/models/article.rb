class Article < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  validates :header, :article, presence: true

  resourcify
end
