class Departamento < ActiveRecord::Base
  belongs_to :pai, :class_name => 'Pai', :foreign_key => "pais_id"
  belongs_to :user

  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Departamento.create! row.to_hash
    end
  end

  def pai_name=(name)
  	pai.try(:name)
  end

end
