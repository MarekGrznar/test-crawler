class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :article_id, null: false
      t.string :title,       null: false
      t.text :perex
      t.string :url,         null: false

      t.timestamps
    end

  add_index :articles, :title

  end
end
