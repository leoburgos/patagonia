class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.date :birth_date
      t.integer :tel
      t.integer :return_rate
      t.integer :recommendation_rate
      t.string :suggestions

      t.timestamps null: false
    end
  end
end
