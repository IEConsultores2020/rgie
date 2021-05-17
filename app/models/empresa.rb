class Empresa < ActiveRecord::Base
	belongs_to :user

  def user_name
     user.try(:name)
  end 

end
