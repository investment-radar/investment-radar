class AddAuthorIdToBlorghArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :blorgh_articles, :author_id, :integer
  end
end
