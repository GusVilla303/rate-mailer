class CreateDelta < ActiveRecord::Migration
  def change
    create_table :delta do |t|
      t.integer :rate

      t.timestamps null: false
    end
  end
end
