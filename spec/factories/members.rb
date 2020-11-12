FactoryBot.define do
  factory :member do
  	sequence(:email) { |n| "member#{n}@example.jp" }
  	first_name { "山田" }
  	last_name { "太郎" }
  	first_name_kana { "ヤマダ" }
  	last_name_lana { "タロウ" }
  	company_name { "(株)山田システムズ" }
  	password { "password" }
  	password_confirmation { 'password' }
  end
end