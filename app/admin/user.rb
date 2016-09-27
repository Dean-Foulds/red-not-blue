# ActiveAdmin.register User do
ermit_params :email, :username
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
ActiveAdmin.register User do
  index do
    selectable_column
    column :id
    column :email
    column :username
    column :created_at
    column :admin
    column :last_sign_in_at
    column :last_sign_in_ip
    actions
  end
end

