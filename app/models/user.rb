class User < ActiveRecord::Base
  has_secure_password
  has_many :access_types, dependent: :destroy
  has_many :chambers, through: :access_types, dependent: :destroy
  has_many :books, through: :chambers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :books, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
end
