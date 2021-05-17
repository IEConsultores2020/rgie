class Equipo < ActiveRecord::Base
  belongs_to :fabricante
  belongs_to :user

  def fabricante_nombre=(nombre)
  	fabricante.try(:nombre)
  end
end
