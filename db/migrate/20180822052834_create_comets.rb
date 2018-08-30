class CreateComets < ActiveRecord::Migration[5.2]
  def change
    create_table :comets do |t|
      t.string :full_name
      t.float :e, default: 0
      t.float :q, default: 0
      t.float :i, default: 0
      t.float :om, default: 0
      t.float :w, default: 0
      t.float :ad, default: 0
      t.float :tp_cal, default: 0
      t.float :per_y, default: 0
      t.string :comet_class
      t.integer :data_arc, default: 0
      t.integer :condition_code, default: 0
      t.integer :n_obs_used, default: 0
      t.boolean :two_body
      t.float :a1, default: 0
      t.float :a2, default: 0
      t.float :a3, default: 0
      t.float :dt, default: 0
      t.float :m1, default: 0
      t.float :k1, default: 0
      t.float :m2, default: 0
      t.float :k2, default: 0
      t.float :pc, default: 0
      t.float :diameter, default: 0
      t.string :extent
      t.float :albedo, default: 0
      t.float :rot_per, default: 0
      t.timestamps
    end
  end
end
