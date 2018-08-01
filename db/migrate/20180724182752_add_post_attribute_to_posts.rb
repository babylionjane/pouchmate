class AddPostAttributeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :category, :string
    add_column :posts, :open_date, :string
    add_column :posts, :exp_date, :string
    add_column :posts, :public, :boolean
  end
end
