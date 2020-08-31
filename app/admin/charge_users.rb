ActiveAdmin.register ChargeUser do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  form do |f|
    f.inputs do
      f.input :url, as: :file
      f.input :created_by, as: :hidden
      f.input :month, as: :select, collection: (1..11).map{ | n| [((DateTime.now + n.month).strftime("%B-%Y")), (DateTime.now + n.month).strftime("%Y%m")]}
    end
    f.actions
  end
  permit_params do
    permitted = [:url, :created_by, :month]
    permitted << :other if current_user.admin?
    permitted
  end
  
end
