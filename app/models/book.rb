class Book < ActiveRecord::Base
  belongs_to :chamber
  has_many :books
end
