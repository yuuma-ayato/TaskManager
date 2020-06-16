content_sample = ["テストをする","シードデータを作る","Railsを楽しむ"]
values = [0,1,2]

user1 = User.create(name:"一般ユーザー",email:"general@test.com",password:"password",admin:false)
user2 = User.create(name:"管理ユーザー",email:"admin@test.com",password:"password",admin:true)


20.times do |n|
  user1.tasks.build(content:content_sample.sample + "#{n}", detail: "シードデータで投入したタスクです", limit: DateTime.now, status: values.sample, priority:values.sample)
end
20.times do |n|
  user2.tasks.build(content:content_sample.sample + "#{n}", detail: "シードデータで投入したタスクです", limit: DateTime.now, status: values.sample, priority:values.sample)
end
