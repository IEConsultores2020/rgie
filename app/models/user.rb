class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :rememberable,
  devise :database_authenticatable, :registerable,
         :recoverable,  :trackable, :validatable, :timeoutable
  belongs_to :role
  belongs_to :ciudad
  has_many :articulos
  has_many :modelos
  has_many :empresas
  has_many :inventarios
  has_many :componentes
  has_many :tiendas
  has_many :unidad_medidas
  has_many :tipocanals
  has_many :canals
  has_many :pais
  has_many :departamentos
  has_many :ciudads
  has_many :puntoventa
  has_many :planvisita
  has_many :visita
  has_many :fabricantes
  has_many :equipos
  has_many :venta
  has_many :usuarioasignados, :class_name => 'Planvisitum', :foreign_key => 'usuarioasignado'
  has_many :usuarioasignados, :class_name => 'Persona', :foreign_key => 'usuarioasignado'

  validates_presence_of :name
  before_save :assign_role
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|   
      rol = Role.where( ["lower(name) = ?", row['role_id'].downcase]).first      
      ciudad = Ciudad.where (["lower(name) = ?", row['ciudad_id'].downcase]).first
      user = User.new(:name => row['name'], :email => row['email'], 
        :numdoc => row['numdoc'],
        :password => row['password'])      
      user.role_id = rol.id
      if (ciudad.present?)
        user.ciudad_id = ciudad.id        
      end
      user.save
    end
  end

  def ciudad_name=(name)
    ciudad.try(:name)
  end

  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  def seller?
    self.role.name == "Seller"
  end

  def regular?
    self.role.name == "Regular"
  end

  def promoter?
    self.role.name == "Promoter"
  end

  def merchandizer?
    self.role.name == "Merchandizer"
  end

  def supervisor?
    self.role.name == "Supervisor"
  end

  def adminaccount?
    self.role.name == "AdminAccount"
  end
  
  

end
