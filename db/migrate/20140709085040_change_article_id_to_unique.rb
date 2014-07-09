class ChangeArticleIdToUnique < ActiveRecord::Migration
  def change
    add_index :articles, :article_id, unique: true
  end
end
