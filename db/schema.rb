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

ActiveRecord::Schema.define(version: 2019_10_09_045549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "ISBN", null: false, comment: "国际标准书号"
    t.string "title", null: false, comment: "名称"
    t.string "author", null: false, comment: "作者姓名"
    t.text "description", comment: "简介"
    t.integer "available", null: false, comment: "库存数目"
    t.integer "borrowed", default: 0, null: false, comment: "外借数目"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "library_records", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "借阅者 id"
    t.integer "book_id", null: false, comment: "书籍 id"
    t.string "status", default: "initial", null: false, comment: "借阅所处状态"
    t.datetime "deadline", null: false, comment: "应归还日期"
    t.datetime "finish_at", comment: "实际归还日期"
    t.float "cost", comment: "此次借阅的花费"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_library_records_on_book_id"
    t.index ["user_id", "book_id"], name: "index_library_records_on_user_id_and_book_id"
    t.index ["user_id"], name: "index_library_records_on_user_id"
  end

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
