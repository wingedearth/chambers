class Chamber < ActiveRecord::Base
  has_many :books
  belongs_to :user
end
