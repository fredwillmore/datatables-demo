class Comet < ApplicationRecord
  include DatatableSupport

  validates :full_name, presence: true
  [ 
    :e,
    :q,
    :i,
    :om,
    :w,
    :ad,
    :tp_cal,
    :per_y,
    :a1,
    :a2,
    :a3,
    :dt,
    :m1,
    :k1,
    :m2,
    :k2,
    :pc,
    :diameter,
    :albedo,
    :rot_per,

    :data_arc,
    :condition_code,
    :n_obs_used
  ].each do |field|
    validates field, numericality: true, allow_nil: true
  end

  protected
  
  def self.datatable_columns
    {
      id: { header_text: "ID", orderable: 'false', searchable: 'false' },
      full_name: { header_text: "Full Name", searchable: 'true', orderable: 'true' },
      diameter: { header_text: "Diameter (km)", searchable: 'false', orderable: 'true' },
      albedo: { header_text: "Albedo", searchable: 'false', orderable: 'true' },
    }
  end
  
  def self.search_fields()
    [ :full_name ]
  end

  def self.default_sort
    :full_name
  end  
end
