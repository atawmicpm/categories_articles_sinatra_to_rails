class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :category, index: true
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
