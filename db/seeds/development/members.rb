lnames = ["佐藤", "鈴木", "高橋", "田中"]
fnames = ["太郎", "次郎", "花子"]
lknames = ["サトウ", "スズキ", "タカハシ", "タナカ"]
fknames = ["タロウ", "ジロウ", "ハナコ"]

0.upto(29) do |idx|
Member.create(
  last_name: "#{lnames[idx % 4]} ",
  first_name: "#{fnames[idx % 3]}",
  last_name_kana: "#{lknames[idx % 4]} ",
  first_name_kana: "#{fknames[idx % 3]}",
  email: "member#{idx}@example.com",
  company_name: "(株)#{lnames[idx % 4]}#{idx}商事",
  password: "worker",
  password_confirmation: "worker"
  )

end