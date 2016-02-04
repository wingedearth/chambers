class AccessType < ActiveRecord::Base
  belongs_to :user
  belongs_to :chamber
end
