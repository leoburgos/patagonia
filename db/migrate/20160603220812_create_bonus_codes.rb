class CreateBonusCodes < ActiveRecord::Migration
  def change
    create_table :bonus_codes do |t|
      t.integer :code

      t.timestamps null: false
    end
  end
end
