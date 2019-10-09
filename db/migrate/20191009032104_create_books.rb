class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :ISBN, null: false, uniqueness: true, comment: '国际标准书号'
      t.string :title, null: false, comment: '名称'
      # 一位作者可能有多本书，暂时做最小化设计
      t.string :author, null: false, comment: '作者姓名'
      t.text :description, comment: '简介'
      t.integer :available, null: false, comment: '库存数目'
      t.integer :borrowed, null: false, default: 0, comment: '外借数目'

      t.timestamps
    end
  end
end
