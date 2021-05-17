class Pai < ActiveRecord::Base
  belongs_to :user
  
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Pai.create! row.to_hash
    end
  end
end
