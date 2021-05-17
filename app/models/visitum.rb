class Visitum < ActiveRecord::Base  
  belongs_to :puntoventum 
  belongs_to :planvisitum, :class_name => 'Planvisitum', :foreign_key => "planvisitum_id"
  belongs_to :user
  validate :date_scope, on: :create
  after_validation :geocode
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   #:distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  
  #geocoded_by :ip_address, :latitude => :latitude, :longitude => :longitude
  #after_validation :geocode
 
  def ip_address    
 	  if self.IPin != nil then
      self.IPin
    elsif self.IPout != nil then
      self.IPOut
    else
      '216.58.211.110'
    end
  end

private
  def date_scope
    if Visitum.where("user_id = ? AND DATE(created_at) = DATE(?) AND puntoventum_id = ?", self.user_id, Time.now, self.puntoventum_id).all.any?
      errors.add(:user_id, "El usuario solo puede registrar un ingreso a punto venta, programado, una vez al día.")
    end
  end

end
