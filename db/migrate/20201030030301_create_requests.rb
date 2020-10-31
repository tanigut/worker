class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|

        t.integer :member_id                                       #メンバーID
    	t.integer :event_genre_id                                  #ジャンルID
    	t.string :title                                            #イベントタイトル
        t.datetime :start_day                                      #イベント開始日
        t.datetime :finish_day                                     #イベント終了日
        t.integer :people                                          #人数
        t.text :body                                               #イベント詳細
        t.string :help                                             #協力会社
        t.string :chief_name                                       #責任者
        t.integer :approval_status, default: 0, null: false        #承認ステータス(0:対応中,1:承認,2:否認)

      t.timestamps
    end
  end
end
