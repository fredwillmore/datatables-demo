require 'csv'

csv_text = File.read 'db/seeds/data/asteroids.csv'
csv = CSV.parse(csv_text, headers: true, header_converters: :downcase)
csv.each do |row|
  data = row.to_hash
  data.delete 'ir'
  data['full_name'].strip!

  [
    :a,
    :e,
    :i,
    :om,
    :w,
    :q,
    :ad,
    :per_y,
    :h,
    :diameter,
    :albedo,
    :rot_per,
    :gm,
    :bv,
    :ub
  ].each do |key|
    key = key.to_s
    data[key] = data[key].to_f
  end
  
  [
    :data_arc,
    :condition_code,
    :n_obs_used,
    :n_del_obs_used,
    :n_dop_obs_used
  ].each do |key|
    key = key.to_s
    data[key] = data[key].to_i
  end

  if data['diameter'] > 0 and data['rot_per'] > 0 and data['albedo'] > 0
    Asteroid.create! data.to_hash
  end
end
