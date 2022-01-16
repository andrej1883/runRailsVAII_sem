class Article < ApplicationRecord
  has_one_attached :avatar
  has_rich_text :article
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :header, :article, presence: true

  resourcify
end
