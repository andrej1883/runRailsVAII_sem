class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :commentText, presence: :true

  resourcify

end
