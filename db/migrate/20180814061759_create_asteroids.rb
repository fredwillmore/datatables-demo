class CreateAsteroids < ActiveRecord::Migration[5.2]
  def change
    create_table :asteroids do |t|
      t.string :full_name
      t.float :a, default: 0
      t.float :e, default: 0
      t.float :i, default: 0
      t.float :om, default: 0
      t.float :w, default: 0
      t.float :q, default: 0
      t.float :ad, default: 0
      t.float :per_y, default: 0
      t.integer :data_arc, default: 0
      t.integer :condition_code, default: 0
      t.integer :n_obs_used, default: 0
      t.integer :n_del_obs_used, default: 0
      t.integer :n_dop_obs_used, default: 0
      t.float :h, default: 0
      t.float :diameter, default: 0
      t.string :extent
      t.float :albedo, default: 0
      t.float :rot_per, default: 0
      t.float :gm, default: 0
      t.float :bv, default: 0
      t.float :ub, default: 0
      t.string :spec_b
      t.string :spec_t
      t.timestamps null: false
    end
  end
end
