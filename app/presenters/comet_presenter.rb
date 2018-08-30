class CometPresenter < BasePresenter

  presents :comet

  def name
    comet.full_name
  end

  def rotation_period
    round_off comet.rot_per
  end

  def albedo
    comet.albedo
  end

  def round_off number, precision=4
    h.number_with_precision number, precision: precision, significant: true
  end
  
  def au_to_km distance
    "#{round_off distance} (#{"%.3e" %round_off(distance * 1.496e+8)})"
  end

end