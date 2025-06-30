ActiveAdmin.register Price do
  # Specify parameters which should be permitted for assignment
  permit_params :buyer_id, :material_id, :value

  # or consider:
  #
  # permit_params do
  #   permitted = [:country_id, :material_id, :value]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :buyer
  filter :material
  filter :value
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :buyer
    column :material
    column :value
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :buyer
      row :material
      row :value
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :buyer
      f.input :material
      f.input :value
    end
    f.actions
  end
end
