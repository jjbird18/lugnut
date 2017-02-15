class AddMainContentToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :main_content, :text
  end
end
