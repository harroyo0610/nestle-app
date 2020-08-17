ActiveAdmin.register User do
  permit_params :username, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :username
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :role
    actions
  end

  filter :username
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :username
      f.input :password
      f.input :password_confirmation 
      f.input :role, as: :select, collection: ['merchant', 'admin']
    end
    f.actions
  end

end
