class Asteroid < ApplicationRecord
  include DatatableSupport
  validates :full_name, presence: true
  
  [ 
    :a, :e, :i, :om, :w, :q, :ad, :per_y, :data_arc, :condition_code, :n_obs_used, 
    :n_del_obs_used, :n_dop_obs_used, :h, :diameter, :albedo, :rot_per, :gm, :bv, :ub 
  ].each do |field|
    validates field, numericality: true, allow_nil: true
  end
  
  protected
  
  def self.datatable_configuration_class
    AsteroidDatatableConfiguration
  end
end
