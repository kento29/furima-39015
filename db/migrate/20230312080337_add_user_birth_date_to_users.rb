class AddUserBirthDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_birth_date, :date
  end
end
