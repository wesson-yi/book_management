class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: '姓名'
      t.integer :age, comment: '年龄'
      t.string :gender, comment: '性别'
      t.string :ID_number, null: false, unique: true, comment: '身份证号码'
      t.string :mobile, null: false, unique: true, comment: '手机号'
      t.string :email, comment: '邮箱'
      t.integer :balance, null: false, default: 0, comment: '余额'
      t.boolean :admin, null: false, default: false, comment: '是否为管理员'
      t.string :password_digest, null: false, comment: '密码'

      t.timestamps
    end
  end
end
