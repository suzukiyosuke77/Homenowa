require 'faker'

Admin.create!(email: "admin@test.com", password: "password")

# テストユーザー
test_user = User.find_or_create_by!(email: "aaa@example.com") do |user|
  user.name = "テストくん"
  user.password = "password"
  user.introduction = "テストです"
end

# 固定投稿データ
Post.find_or_create_by!(title: "最高のタイトルマッチでした...!", user: test_user) do |post|
  post.body = "省略"
  post.category_list = "新日本プロレス,IWGPヘビー級選手権試合"
  post.rating = 3
end

# サンプルデータ
30.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    introduction: Faker::Lorem.sentence(word_count: 10)
  )

  Post.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    body: Faker::Lorem.paragraph(sentence_count: 3),
    category_list: ["新日本プロレス","全日本プロレス","プロレスリングNOA","DDT","大日本プロレス","FREEDOMS","スターダム","マリーゴールド","WWE","AEW","タッグマッチ","デスマッチ","蛍光灯"].sample(2).join(","),
    rating: 3,
    user: user
  )
end

puts "ユーザーと投稿データを作成しました！"