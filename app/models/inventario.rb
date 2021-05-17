class Inventario < ActiveRecord::Base
  belongs_to :tienda
  belongs_to :articulo 
  belongs_to :user
  has_many :conteos
  #validates_presence_of :tienda_id, :fecha_ingreso, 
  #:moneda, :articulo_id, :cantidad_integer, :valor_unidad
  #validates_uniqueness_of :articulo_id, scope: [:valor_unidad, :valor_venta, :num_factura]
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|   
      tienda = Tienda.where( ["lower(nombre) = ?", row['tienda_id'].downcase]).first
      articulo = Articulo.where( ["nombre = ?", row['articulo_id']]).first             
      inventario = Inventario.new(:fecha_ingreso => row['fecha_ingreso'], 
        :moneda => 'COP',
        :valor_unidad => row['valor_unidad'], 
        :valor_venta => row['valor_venta'],
        :cantidad_integer => row['cantidad_integer'],
        :num_factura => row['num_factura'])  
      #inventario.valor_total = (inventario.valor_unidad * inventario.cantidad_integer)
      inventario.user_id = 6
      inventario.tienda_id = tienda.id
      inventario.articulo_id = articulo.id
      inventario.save
    end
  end
  

   
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |inventario|
        csv << inventario.attributes.values_at(*column_names)
      end
    end
  end

  def tienda_nombre
     tienda.try(:nombre)
  end 

  def tienda_nombre=(nombre)
    self.tienda = tienda.find_or_create_by_nombre(nombre) if nombre.present?
  end
 
  
  
  def articulo_nombre
     articulo.try(:nombre)
  end 
  
  def articulo_descripcion
     articulo.try(:descripcion)
  end 

  def articulo_nombre=(nombre)
    self.articulo = Articulo.find_by_nombre(nombre)  if nombre.present?
  end  

  def articulo_descripcion=(descripcion)
    self.articulo = Articulo.find_by_descripcion(descripcion)  if descripcion.present?
  end  
  
  
  def componente_nombre
     articulo.try(:componente_nombre)
  end 
  def componente_nombre=(componente_nombre)
    self.articulo = Articulo.find_by_componente_nombre(componente_nombre)  if componente_nombre.present?
  end  
  
  def modelo_nombre
     articulo.try(:modelo_nombre)
  end 
  def modelo_nombre=(modelo_nombre)
    self.articulo = Articulo.find_by_modelo_nombre(modelo_nombre)  if modelo_nombre.present?
  end  
  
  def medida_nombre
     articulo.try(:medida_nombre)
  end 
  def medida_nombre=(medida_nombre)
    self.articulo = Articulo.find_by_medida_nombre(medida_nombre)  if medida_nombre.present?
  end  
  

  def moneda
  	 'COP'
  end
  
  def valor_total
    cantidad_integer.to_f.round(2) * valor_unidad
   end 

  def self.search(query, filter, datefilter)
    if datefilter.blank? or datefilter == 0 then
    # where(:title, query) -> This would return an exact match of the query      
      joins(:articulo).where("num_factura like ? and exists (select 1 from componentes where codigo like ? and articulos.componente_id = componentes.id)", "%#{query}%", "%#{filter}%")
    else
      joins(:articulo).where("inventarios.fecha_ingreso =  ? and num_factura like ? and  exists (select 1 from componentes where codigo like ? and articulos.componente_id = componentes.id)", "#{datefilter}", "%#{query}%", "%#{filter}%")
    end
  end

  def user_name
     user.try(:name)
  end 


  validates_presence_of :tienda_id, :fecha_ingreso, :moneda, :articulo_id, :cantidad_integer, :valor_unidad
end

  
  
  
  
  
  