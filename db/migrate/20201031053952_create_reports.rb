class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|

        t.integer :request_id     #リクエストID
        t.integer :member_id      #メンバーID
        t.datetime :in_at         #入館時間
        t.datetime :out_at        #退館時間
        t.string :image_id        #イベント画像ID
        t.text :body              #イベント報告

      t.timestamps
    end
  end
end
