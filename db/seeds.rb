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

users_data = [
  { name: "山田 太郎", introduction: "旅行が趣味です。", email: "taro@example.com" },
  { name: "佐藤 花子", introduction: "料理が得意です。", email: "hanako@example.com" },
  { name: "鈴木 次郎", introduction: "映画鑑賞が好きです。", email: "jiro@example.com" },
  { name: "高橋 由美", introduction: "本を読むのが大好きです。", email: "yumi@example.com" },
  { name: "伊藤 健", introduction: "音楽フェスが楽しみです。", email: "ken@example.com" }
]

posts_data = [
  { title: "初めての旅", body: "京都を訪れて素晴らしい景色を堪能しました。", category: "旅行" },
  { title: "特製カレー", body: "スパイスを工夫してみたら、家族にも好評でした！", category: "料理" },
  { title: "感動の映画", body: "涙なしには見られない映画でした。", category: "映画" },
  { title: "お気に入りの本", body: "哲学について考えさせられる素晴らしい本でした。", category: "読書" },
  { title: "ライブ最高！", body: "お気に入りのバンドのライブに行き、最高でした。", category: "音楽" }
]

# データの作成
users_data.each_with_index do |user_data, index|
  user = User.find_or_create_by!(email: user_data[:email]) do |u|
    u.name = user_data[:name]
    u.password = "password"
    u.introduction = user_data[:introduction]
  end

  post_data = posts_data[index] # 各ユーザーに対応する投稿データを取得
  Post.create!(
    title: post_data[:title],
    body: post_data[:body],
    category: post_data[:category],
    user: user
  )
end

puts "ユーザーと投稿データを作成しました！"
