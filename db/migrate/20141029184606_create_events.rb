class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :location
      t.boolean :requires_id
      t.integer :capacity
      t.date :date
      t.timestamps
    end
  end
end
