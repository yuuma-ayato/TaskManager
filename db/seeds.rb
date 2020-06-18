content_sample = ["テストをする","シードデータを作る","Railsを楽しむ"]
values = [0,1,2]

user1 = User.create(name:"一般ユーザー",email:"general@test.com",password:"password",admin:false)
user2 = User.create(name:"管理ユーザー",email:"admin@test.com",password:"password",admin:true)

label1 = Label.create(label_name:"テストラベル1", color: "赤")
label2 = Label.create(label_name:"テストラベル2", color: "青")
label3 = Label.create(label_name:"テストラベル3", color: "緑")
labels = [label1,label2,label3]


20.times do |n|
  task = user1.tasks.create(content:content_sample.sample + "#{n}", detail: "シードデータで投入したタスクです", limit: DateTime.now, status: values.sample, priority:values.sample)
  task.task_labels.create(label_id:labels.sample.id)
end
20.times do |n|
  task = user2.tasks.create(content:content_sample.sample + "#{n}", detail: "シードデータで投入したタスクです", limit: DateTime.now, status: values.sample, priority:values.sample)
  task.task_labels.create(label_id:labels.sample.id)
end
