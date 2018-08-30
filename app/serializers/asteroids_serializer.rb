class AsteroidsSerializer < BaseDatatableSerializer

  def data_fields
    [
      :id,
      :name,
      # :semi_major_axis,
      # :rotation_period,
      # :albedo,
      :diameter,
      # :eccentricity,
      # :inclination,
      :perihelion_distance,
      :aphelion_distance
    ]
  end

end
