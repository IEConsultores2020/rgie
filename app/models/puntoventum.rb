class Puntoventum < ActiveRecord::Base    
  belongs_to :tipocanal
  belongs_to :ciudad
  belongs_to :user
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   #:distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  
  #geocoded_by :direccion
  #after_validation :geocode, :if => :direccion_changed?  || :ciudad_id_changed?
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode 
 
  def address
    [direccion, ciudad.try(:name), ciudad.departamento.try(:name), ciudad.departamento.pai.try(:name)].compact.join(', ')
  end

  def tipocanal_nombre=(nombre)
  	tipocanal.try(:nombre)
  end
end
