class Ciudad < ActiveRecord::Base
  belongs_to :departamento
  belongs_to :user
  belongs_to :region
  has_many :users 
  
  validates :name, presence: true,
                   uniqueness: true,
                    uniqueness: { case_sensitive: false }



  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      #Busco el departamento que esta ubicado en la segunda columna del documento, en este caso row[1], 
      #Convirtiendo todo a minusculas.
      departamento = Departamento.where( ["lower(name) = ?", row['departamento_id'].downcase]).first
      c = Ciudad.new(:name => row['name'],:latitude => row['latitude'],:longitude => row['longitude'])
      c.departamento_id = departamento.id
      c.user_id = current_user.user_id
      c.save
    end
  end

  def departamento_name=(name)
  	departamento.try(:name)
  end

  def region_name=(name)
  	region.try(:name)
  end  
end
