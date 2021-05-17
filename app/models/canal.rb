class Canal < ActiveRecord::Base
  belongs_to :tipocanal
  belongs_to :user

  def tipocanal_nombre=(nombre)
  	tipocanal.try(:nombre)
  end
end
