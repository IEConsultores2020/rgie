class Persona < ActiveRecord::Base
  belongs_to :user
  belongs_to :ciudad
  belongs_to :usuarioasignados, :class_name => 'User', :foreign_key => "usuarioasignado"

  def ciudad_name=(name)
  	ciudad.try(:name)
  end  
  
  def usuario_asignado=(name)
  	usuarioasignado.try(:name)
  end
end
