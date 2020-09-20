class ChangeMonthDateForString < ActiveRecord::Migration[6.0]
  def change
    change_column :charge_users, :month, :string
  end
end
