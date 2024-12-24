require 'faker'

User.destroy_all
Post.destroy_all

test_user = User.find_or_create_by!(email: "aaa@example.com") do |user|
  user.name = "テストくん"
  user.password = "password"
  user.introduction = "テストです"
end

Post.find_or_create_by!(title: "おもしろ落語でした", user: test_user) do |post|
  post.body = "省略"
  post.category_list = "落語,滑稽噺" 
end

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
    category_list: ["落語", "歌舞伎", "演劇", "ミュージカル", "2.5次元", "コント", "プロレス", "デスマッチ", "映画", "ホラー", "アクション", "SF", "恋愛", "ノンフィクション", "サスペンス", "アニメ", "音楽", "コンサート", "ロック", "ジャズ", "クラシック"].sample,
    user: user
  )
end

puts "ユーザーと投稿データを作成しました！"
