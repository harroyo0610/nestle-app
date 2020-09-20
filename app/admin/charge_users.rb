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
      f.input :month, as: :select, collection: (1..11).map{ | n| [((DateTime.now + n.month).strftime("%B-%Y")), (DateTime.now + n.month).strftime("%Y%m")]}
      f.input :url, as: :file
      f.input :created_by, as: :hidden
    end
    f.actions
  end
  
  controller do

    def create
      charge_user = ChargeUser.new(charge_user_params)

      if charge_user.save
        redirect_to admin_charge_user_path(charge_user)
      else
        render :new
      end
    end

      private 

      def charge_user_params
        params.require(:charge_user).permit(:url, :created_by, :month)
      end
  end
end
