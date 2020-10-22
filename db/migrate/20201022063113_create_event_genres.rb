class CreateEventGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :event_genres do |t|

    	t.string :name
    	t.string :other
        t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
