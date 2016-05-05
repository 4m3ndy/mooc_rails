ActiveAdmin.register Course do

  permit_params :user_id, :title, :description

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    column :updated_at
    actions
  end

  filter :user_id

  form do |f|
    f.inputs "Course Details" do
      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.where('users.status="instructor"').map{|u| ["#{u.name}", u.id]}
      f.input :title
      f.input :description
    end
    f.actions
  end


end
