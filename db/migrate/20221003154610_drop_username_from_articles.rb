class DropUsernameFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :username
    add_column :articles, :title, :string
    change_column :articles, :description, :text
  end
end
