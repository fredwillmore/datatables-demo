class AsteroidPresenter < BasePresenter

  presents :asteroid

  def name
    asteroid.full_name
  end

  def rotation_period
    round_off asteroid.rot_per
  end

  def albedo
    asteroid.albedo
  end
  
  def semi_major_axis
    au_to_km asteroid.a
  end
  
  def eccentricity
    round_off asteroid.e
  end
  
  def inclination
    round_off asteroid.i
  end

  def perihelion_distance
    au_to_km asteroid.q
  end

  def aphelion_distance
    au_to_km asteroid.ad
  end
  
  def round_off number, precision=4
    h.number_with_precision number, precision: precision, significant: true
  end
  
  def au_to_km distance
    "#{round_off distance} (#{"%.3e" %round_off(distance * 1.496e+8)})"
  end

end