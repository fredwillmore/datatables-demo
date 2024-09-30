# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2018_08_22_052834) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asteroids", force: :cascade do |t|
    t.string "full_name"
    t.float "a", default: 0.0
    t.float "e", default: 0.0
    t.float "i", default: 0.0
    t.float "om", default: 0.0
    t.float "w", default: 0.0
    t.float "q", default: 0.0
    t.float "ad", default: 0.0
    t.float "per_y", default: 0.0
    t.integer "data_arc", default: 0
    t.integer "condition_code", default: 0
    t.integer "n_obs_used", default: 0
    t.integer "n_del_obs_used", default: 0
    t.integer "n_dop_obs_used", default: 0
    t.float "h", default: 0.0
    t.float "diameter", default: 0.0
    t.string "extent"
    t.float "albedo", default: 0.0
    t.float "rot_per", default: 0.0
    t.float "gm", default: 0.0
    t.float "bv", default: 0.0
    t.float "ub", default: 0.0
    t.string "spec_b"
    t.string "spec_t"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "comets", force: :cascade do |t|
    t.string "full_name"
    t.float "e", default: 0.0
    t.float "q", default: 0.0
    t.float "i", default: 0.0
    t.float "om", default: 0.0
    t.float "w", default: 0.0
    t.float "ad", default: 0.0
    t.float "tp_cal", default: 0.0
    t.float "per_y", default: 0.0
    t.string "comet_class"
    t.integer "data_arc", default: 0
    t.integer "condition_code", default: 0
    t.integer "n_obs_used", default: 0
    t.boolean "two_body"
    t.float "a1", default: 0.0
    t.float "a2", default: 0.0
    t.float "a3", default: 0.0
    t.float "dt", default: 0.0
    t.float "m1", default: 0.0
    t.float "k1", default: 0.0
    t.float "m2", default: 0.0
    t.float "k2", default: 0.0
    t.float "pc", default: 0.0
    t.float "diameter", default: 0.0
    t.string "extent"
    t.float "albedo", default: 0.0
    t.float "rot_per", default: 0.0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

end
