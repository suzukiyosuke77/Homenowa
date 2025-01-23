require 'faker'

puts "既存データを削除します..."
User.destroy_all
Post.destroy_all
puts "データの初期化が完了しました。"

Admin.create!(email: "admin@test.com", password: "password")

# テストユーザー
test_user = User.find_or_create_by!(email: "aaa@example.com") do |user|
  user.name = "テストくん"
  user.password = "password"
  user.introduction = "テストです"
end

# 固定投稿データ
Post.find_or_create_by!(title: "おもしろ落語でした", user: test_user) do |post|
  post.body = "省略"
  post.category_list = "落語,滑稽噺"
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
    category_list: ["落語","滑稽噺","怪談噺","人情噺", 
    "歌舞伎","時代物","世話物","舞踊", 
    "映画", "アニメ", "ホラー","SF","アクション","伝記","コメディ", "犯罪","ドキュメンタリー","ドラマ","ファミリー","ファンタジー","ミステリー","スリラー",
    "音楽","ポップス","ロック","ダンス","ジャズ","ラテン","クラシック","ラップ","ハードロック","メタル","ソフトロック","ゴシック","歌謡曲"].sample(2).join(","),
    rating: 3,
    user: user
  )
end

puts "ユーザーと投稿データを作成しました！"