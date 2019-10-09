class CreateLibraryRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :library_records do |t|
      t.integer :user_id, null: false, comment: '借阅者 id'
      t.integer :book_id, null: false, comment: '书籍 id'
      t.string :status, null: false, default: :initial, comment: '借阅所处状态'
      t.datetime :deadline, null: false, comment: '应归还日期'
      t.datetime :finish_at, comment: '实际归还日期'
      t.float :cost, comment: '此次借阅的花费'

      t.index :user_id
      t.index :book_id
      t.index [:user_id, :book_id]
      t.timestamps
    end
  end
end
