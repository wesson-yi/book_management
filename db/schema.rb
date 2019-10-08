# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_08_131317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name", null: false, comment: "姓名"
    t.integer "age", comment: "年龄"
    t.string "gender", comment: "性别"
    t.string "ID_number", null: false, comment: "身份证号码"
    t.string "mobile", null: false, comment: "手机号"
    t.string "email", comment: "邮箱"
    t.integer "balance", default: 0, null: false, comment: "余额"
    t.boolean "admin", default: false, null: false, comment: "是否为管理员"
    t.string "password_digest", null: false, comment: "密码"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
