class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|

    	t.integer :member_id     #メンバーID
    	t.integer :admin_id      #管理者ID

      t.timestamps
    end
  end
end
