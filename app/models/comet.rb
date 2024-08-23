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
  
  def self.datatable_configuration_class
    CometDatatableConfiguration
  end
end
