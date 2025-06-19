ActiveAdmin.register Buyer do
  # Specify parameters which should be permitted for assignment
  permit_params :name, :description, :country_id, :address, :coordinates, :semaphore, :btype

  # or consider:
  #
  # permit_params do
  #   permitted = [:name, :description, :country_id, :address, :coordinates, :semaphore, :btype]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :name
  filter :description
  filter :country
  filter :address
  filter :coordinates
  filter :semaphore
  filter :btype
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :country
    column :address
    column :coordinates
    column :semaphore
    column :btype
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :name
      row :description
      row :country
      row :address
      row :coordinates
      row :semaphore
      row :btype
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :name
      f.input :description
      f.input :country
      f.input :address
      f.input :coordinates
      f.input :semaphore
      f.input :btype
    end
    f.actions
  end
end
