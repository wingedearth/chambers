class Book < ActiveRecord::Base
  belongs_to :chamber
  has_and_belongs_to_many :users
  has_many :reviews
end
