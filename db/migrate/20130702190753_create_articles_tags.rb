class CreateArticlesTags < ActiveRecord::Migration
  def change
    create_table :articles_tags do |t|
    	t.references :article
    	t.references :tag
    	
    	t.timestamps
    end
  end
end
