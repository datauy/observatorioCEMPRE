ActiveAdmin.register Buyer do
  # Specify parameters which should be permitted for assignment
  permit_params :name, :description, :address, :coordinates, :semaphore, :btype, :buyer_id, material_ids:[]

  # or consider:
  #
  # permit_params do
  #   permitted = [:name, :description, :address, :coordinates, :semaphore, :btype, :buyer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :name
  filter :country
  filter :description
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
    column :address
    column :coordinates
    column :semaphore
    column :btype
    column :created_at
    column :updated_at
    column :country
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :name
      row :description
      row :address
      row :coordinates
      row :semaphore
      row :btype
      row :created_at
      row :updated_at
      row :country
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :name
      f.input :description
      f.input :address
      f.input :coordinates
      f.input :semaphore
      f.input :btype, label: "Tipo de comprador"
      f.input :country, label: "País", collection: Buyer.where(btype: 0).map{|b| [b.name, b.id]}
      f.input :materials, as: :check_boxes
    end
    f.actions
  end
end
