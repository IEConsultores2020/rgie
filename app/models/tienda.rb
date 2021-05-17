class Tienda < ActiveRecord::Base
  belongs_to :empresa
  has_many :inventarios
  belongs_to :user

  def user_name
     user.try(:name)
  end 

end
