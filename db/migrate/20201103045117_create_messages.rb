class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

        t.integer :room_id
        t.boolean :is_member
        t.text :content

      t.timestamps
    end
  end
end
