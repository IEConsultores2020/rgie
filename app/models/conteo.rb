class Conteo < ActiveRecord::Base
  belongs_to :inventario
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|  
      
      inventario = Inventario.where( " id = ?", row['codbarras']).first
      conteo = Conteo.new(:cantidad => row['cantidad'], :codbarras =>row['codbarras'])
      conteo.inventario_id = inventario.id
      #conteo.user_id = 6
     
      conteo.save
    end
  end
  
  
  
end
