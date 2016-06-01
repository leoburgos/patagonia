class ChangeBirthDateType < ActiveRecord::Migration
  def change
    remove_column :users, :birth_date, :updated_at
    add_column :users, :birth_date, :string
  end
end
