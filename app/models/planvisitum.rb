class Planvisitum < ActiveRecord::Base
  belongs_to :puntoventum
  belongs_to :user
  belongs_to :usuarioasignados, :class_name => 'User', :foreign_key => "usuarioasignado"
  has_many   :visita

  validates_uniqueness_of :usuarioasignado, :scope => [:puntoventum_id, :fechavisita], message: "El usuario puede ser asignado una vez al día en el punto de venta"
  validates_presence_of :usuarioasignado, :fechavisita, :puntoventum, :user


  def puntoventum_name=(name)
  	puntoventum.try(:name)
  end

  def usuarioasignado_name=(name)
  	 usuarioasignado.try(:name) 
  end

end

