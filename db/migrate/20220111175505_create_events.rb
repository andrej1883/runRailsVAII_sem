class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :place
      t.time :time
      t.string :surface
      t.string :organizer
      t.text :info

      t.timestamps
    end
  end
end
