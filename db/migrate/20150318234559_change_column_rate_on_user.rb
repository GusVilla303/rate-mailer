class ChangeColumnRateOnUser < ActiveRecord::Migration
  def change
    change_column :users, :rate, :integer
  end
end
