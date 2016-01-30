ActiveAdmin.register Product do
  index do
  	column :id
  	column :name
  	column :description
  	column :created_at

  	column :comments do |comment|
  		link_to 'comments', admin_products_comments_path(comment)
  	default_actions
  end
	end
end
