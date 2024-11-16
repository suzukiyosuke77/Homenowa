テストくん = User.find_or_create_by!(email: "aaa@example.com") do |user|  
  user.name = "テストくん"  
  user.password = "password"  
  user.introduction = "テストです"
end

james = User.find_or_create_by!(email: "bbb@example.com") do |user|  
  user.name = "James"  
  user.password = "password"
  user.introduction = "テストです"
end

lucas = User.find_or_create_by!(email: "ccc@example.com") do |user|  
  user.name = "Lucas"  
  user.password = "password" 
  user.introduction = "テストです"
end

Post.find_or_create_by!(category: "ミュージカル") do |post|  
  post.title = "おもしろミュージカルでした"  
  post.user = テストくん
  post.body = "省略"
end

Post.find_or_create_by!(category: "プロレス") do |post|  
  post.title = "激アツプロレスでした"  
  post.user = lucas
  post.body = "省略"
end

Post.find_or_create_by!(category: "落語") do |post|  
  post.title = "おもしろ落語でした"  
  post.user = テストくん
  post.body = "省略"
end
