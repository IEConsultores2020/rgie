class Ventum < ActiveRecord::Base
  belongs_to :puntoventum
  belongs_to :equipo
  belongs_to :user

  def puntoventum_name=(name)
  	puntoventum.try(:name)
  end
end
