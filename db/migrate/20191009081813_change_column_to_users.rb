class ChangeColumnToUsers < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :balance, :float, null: false, default: 0, comment: '余额'
  end

  def down
    change_column :users, :balance, :integer, null: false, default: 0, comment: '余额'
  end
end
