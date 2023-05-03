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

ActiveRecord::Schema[7.0].define(version: 2023_04_29_135738) do
  create_table "sudoku_tasks", force: :cascade do |t|
    t.integer "cell_0_0"
    t.integer "cell_0_1"
    t.integer "cell_0_2"
    t.integer "cell_0_3"
    t.integer "cell_0_4"
    t.integer "cell_0_5"
    t.integer "cell_0_6"
    t.integer "cell_0_7"
    t.integer "cell_0_8"
    t.integer "cell_1_0"
    t.integer "cell_1_1"
    t.integer "cell_1_2"
    t.integer "cell_1_3"
    t.integer "cell_1_4"
    t.integer "cell_1_5"
    t.integer "cell_1_6"
    t.integer "cell_1_7"
    t.integer "cell_1_8"
    t.integer "cell_2_0"
    t.integer "cell_2_1"
    t.integer "cell_2_2"
    t.integer "cell_2_3"
    t.integer "cell_2_4"
    t.integer "cell_2_5"
    t.integer "cell_2_6"
    t.integer "cell_2_7"
    t.integer "cell_2_8"
    t.integer "cell_3_0"
    t.integer "cell_3_1"
    t.integer "cell_3_2"
    t.integer "cell_3_3"
    t.integer "cell_3_4"
    t.integer "cell_3_5"
    t.integer "cell_3_6"
    t.integer "cell_3_7"
    t.integer "cell_3_8"
    t.integer "cell_4_0"
    t.integer "cell_4_1"
    t.integer "cell_4_2"
    t.integer "cell_4_3"
    t.integer "cell_4_4"
    t.integer "cell_4_5"
    t.integer "cell_4_6"
    t.integer "cell_4_7"
    t.integer "cell_4_8"
    t.integer "cell_5_0"
    t.integer "cell_5_1"
    t.integer "cell_5_2"
    t.integer "cell_5_3"
    t.integer "cell_5_4"
    t.integer "cell_5_5"
    t.integer "cell_5_6"
    t.integer "cell_5_7"
    t.integer "cell_5_8"
    t.integer "cell_6_0"
    t.integer "cell_6_1"
    t.integer "cell_6_2"
    t.integer "cell_6_3"
    t.integer "cell_6_4"
    t.integer "cell_6_5"
    t.integer "cell_6_6"
    t.integer "cell_6_7"
    t.integer "cell_6_8"
    t.integer "cell_7_0"
    t.integer "cell_7_1"
    t.integer "cell_7_2"
    t.integer "cell_7_3"
    t.integer "cell_7_4"
    t.integer "cell_7_5"
    t.integer "cell_7_6"
    t.integer "cell_7_7"
    t.integer "cell_7_8"
    t.integer "cell_8_0"
    t.integer "cell_8_1"
    t.integer "cell_8_2"
    t.integer "cell_8_3"
    t.integer "cell_8_4"
    t.integer "cell_8_5"
    t.integer "cell_8_6"
    t.integer "cell_8_7"
    t.integer "cell_8_8"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end