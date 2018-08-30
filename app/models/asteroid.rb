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
  
  def self.search_fields()
    [ :full_name ]
  end

  def self.sort_fields
    {
      id:        :id,
      name:      :full_name,
      rotation_period: :rot_per,
      albedo:    :albedo,
      diameter:  :diameter,
      perihelion_distance: :q,
      aphelion_distance: :ad,
      semi_major_axis: :a,
      eccentricity:  :e,
      inclination:  :i,
      default:   :full_name
    }
  end
end
