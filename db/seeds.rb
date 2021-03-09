# メインのサンプルユーザーを1人作成する
User.create!(name: "Hironobu Nakamura", email: "hironobu9dance@gmail.com", password: "password", password_confirmation: "password", admin: true,activated: true, activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@hironobunakamura.org"
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password, activated: true, activated_at: Time.zone.now)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
5.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end
