ActiveAdmin.register Price do
  # Specify parameters which should be permitted for assignment
  permit_params :material_id, :buyer_id, :value, :max_value, :min_value, :last_update, :source, :description

  # or consider:
  #
  # permit_params do
  #   permitted = [:material_id, :buyer_id, :value, :max_value, :min_value, :last_update, :source, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :material
  filter :buyer
  filter :value
  filter :created_at
  filter :updated_at
  filter :max_value
  filter :min_value
  filter :last_update
  filter :source
  filter :description

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :material
    column :buyer
    column :value
    column :created_at
    column :updated_at
    column :max_value
    column :min_value
    column :last_update
    column :source
    column :description
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :material
      row :buyer
      row :value
      row :created_at
      row :updated_at
      row :max_value
      row :min_value
      row :last_update
      row :source
      row :description
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :material
      f.input :buyer
      f.input :value
      f.input :max_value
      f.input :min_value
      f.input :last_update
      f.input :source
      f.input :description
    end
    f.actions
  end
end
