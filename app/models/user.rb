class User < ApplicationRecord
  rolify
  has_many :articles
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  after_create :assign_default_role
  validate :must_have_a_role, on: :update

  private

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least 1 role")
    end
  end


  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end


end
