names = %w(新規設立 保守・メンテナンス 清掃 その他)

4.times do |idx|
 EventGenre.create!(
  name: names[idx],
  is_active: true
 )
end