require 'rubygems'
require 'roo'
class Articulo < ActiveRecord::Base
  belongs_to :medida
  belongs_to :componente
  belongs_to :modelo
  belongs_to :user
  has_many   :inventarios
 validates_presence_of :nombre, :descripcion, :medida_id, :componente_id, :modelo_id
 validates_uniqueness_of :nombre

def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|   
      componente = Componente.where( ["lower(nombre) = ?", row['componente_id'].downcase]).first
      modelo = Modelo.where( ["lower(nombre) = ?", row['modelo_id'].downcase]).first
      unidad = Medida.where( ["lower(nombre) = ?", row['medida_id'].downcase]).first       
      articulo = Articulo.new(:nombre => row['nombre'], :descripcion => row['descripcion'])      
      articulo.componente_id = componente.id 
      articulo.modelo_id = modelo.id
      articulo.medida_id = unidad.id      
      articulo.user_id = 7
      articulo.save
    end
  end
  


def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |articulo|
        csv << articulo.attributes.values_at(*column_names)
      end
    end
  end
  
=begin
  def self.import(file)
        #La funcion open_spreadsheet abre el archivo e identifica el tipo: excel, csv, etc.
    spreadsheet = open_spreadsheet(file)
    #En header guardamos los nombres de las columnas y luego guardamos datos apartir de row(2)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      c = Componente.where( ["nombre = ?", row[:componente_id]]).first
      u = Medida.where( ["nombre = ?", row[:medida_id]]).first      
      m = Modelo.where( ["nombre = ?", row[:modelo_id]]).first      
      articulo = Articulo.new(:nombre => row[:nombre], :descripcion => row[:descripcion])   
      
      articulo.componente_id = c.id    
      articulo.modelo_id = m.id
      articulo.medida_id = u.id
      articulo.user_id = 7
      articulo.save
    end
  end
=end

  
    
   
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then  Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then  Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

    
  def medida_nombre
    medida.try(:nombre)
  end 

  def medida_nombre=(nombre)
  	self.medida = medida.find_or_create_by_nombre(nombre) if nombre.present?
  end

  def componente_nombre
    componente.try(:nombre)
  end 

  def componente_nombre=(nombre)
  	self.componente = componente.find_or_create_by_nombre(nombre) if nombre.present?
  end

   def modelo_nombre
     modelo.try(:nombre)
  end 

   def user_name
     user.try(:name)
  end 

  def modelo_nombre=(nombre)
    self.modelo = modelo.find_or_create_by_nombre(nombre) if nombre.present?
  end


  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("nombre like :name1 OR descripcion LIKE :name2 ", 
          {:name1 => "%#{query}%", :name2 => "%#{query}%"}) 
    
  end

  # It returns the articles whose titles contain one or more words that form the query
  def self.filter(query)
    # where(:title, query) -> This would return an exact match of the query
    joins(:componente).where("codigo like ?", "%#{query}%") 
  end

end

