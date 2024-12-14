require 'faker'
# 初期化（既存データを削除）
User.destroy_all
Post.destroy_all

# サンプルデータ

# ユーザー作成
test_user = User.find_or_create_by!(email: "aaa@example.com") do |user|
  user.name = "テストくん"
  user.password = "password"
  user.introduction = "テストです"
end

Post.find_or_create_by!(category: "落語", user: test_user) do |post|
  post.title = "おもしろ落語でした"
  post.body = "省略"
end

# 30人のユーザーとそれぞれの投稿データを作成
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
    category: ["演劇", "映画", "音楽"].sample,
    user: user
  )
end

puts "ユーザーと投稿データを作成しました！"
