# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read 'db/seeds/data/comets.csv'
csv = CSV.parse(csv_text, headers: true, header_converters: :downcase)
csv.each do |row|
  data = row.to_hash
  data.delete 'gm'
  data['full_name'].strip!
  data['comet_class'] = data.delete 'class'
  data['two_body'] = data['two_body'].to_s.downcase == 't' ? true : false

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
    :rot_per
  ].each do |key|
    key = key.to_s
    data[key] = data[key].to_f
  end
  
  [
    :data_arc,
    :condition_code,
    :n_obs_used
  ].each do |key|
    key = key.to_s
    data[key] = data[key].to_i
  end
  
  Comet.create! data
end
