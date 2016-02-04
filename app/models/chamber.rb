class Chamber < ActiveRecord::Base
  has_many :access_types
  has_many :users, through: :access_types
  has_many :books
end
