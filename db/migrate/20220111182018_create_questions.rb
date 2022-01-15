class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :email
      t.text :message
      t.boolean :responded
      t.string :questionTopic

      t.timestamps
    end
  end
end
