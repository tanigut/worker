titles = ["EL点検", "電気設備点検", "防犯カメラ点検", "ドア点検"]
lnames = ["佐藤", "鈴木", "高橋", "田中"]
from = Date.parse("2021-1-1 00:00:00 +0900")
to   = Date.parse("2021-12-31 11:59:59 +0900")
status_names = ["responding", "approval", "denial"]

0.upto(500) do |idx|
Request.create(
  member_id: "#{rand(1..30)}",
  event_genre_id: 2,
  title: "#{titles[idx % 4]}",
  start_day: "#{Random.rand(from .. to)}",
  finish_day: "#{Random.rand(from .. to)}",
  people: "#{rand(2..10)}",
  body: "test#{idx}",
  help: "(株)#{lnames[idx % 4]}#{idx}商事",
  chief_name: "#{lnames[idx % 4]} ",
  approval_status: "#{status_names[idx % 3]}"
  )

end
