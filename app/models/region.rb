class Region < ActiveRecord::Base
  belongs_to :user
  has_many :ciudads
end
