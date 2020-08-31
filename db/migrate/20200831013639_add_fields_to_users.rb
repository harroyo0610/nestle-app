class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :region, :string, default: ''
    add_column :users, :session_id, :integer
    add_column :users, :group_call, :boolean, default: false
    add_column :users, :in_call, :boolean, default: false
    add_column :users, :calling, :boolean, default: false
    add_column :users, :who_is_calling, :string, default: ''
  end
end
