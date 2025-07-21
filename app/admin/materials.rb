ActiveAdmin.register Material do
  # Specify parameters which should be permitted for assignment
  permit_params :name, :description, :color, :category

  # or consider:
  #
  # permit_params do
  #   permitted = [:name, :description, :color]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :name
  filter :category
  filter :description
  filter :color
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :name
    column :category
    column :description
    column :color
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :name
      row :category
      row :description
      row :color
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :name
      f.input :category
      f.input :description
      f.input :color
    end
    f.actions
  end
end
