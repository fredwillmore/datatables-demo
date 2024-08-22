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
  
  def self.datatable_columns
    {
      id: { header_text: "ID", orderable: 'false', searchable: 'false' },
      full_name: { header_text: "Full Name", searchable: 'true', orderable: 'true' },
      rot_per: { header_text: "Rotation Period (hours)", searchable: 'false', orderable: 'true' },
      diameter: { header_text: "Diameter (km)", searchable: 'false', orderable: 'true' },
      q: { header_text: "Perihelion Distance AU (km)", searchable: 'false', orderable: 'true' },
      ad: { header_text: "Aphelion Distance AU (km)", searchable: 'false', orderable: 'true' },
    }
  end

  def self.search_fields
    [ :full_name ]
  end

  def self.default_sort
    :full_name
  end
end
