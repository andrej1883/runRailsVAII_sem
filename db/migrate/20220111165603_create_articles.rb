class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :header
      t.text :article

      t.timestamps
    end
  end
end
