content_sample = ["テストをする","シードデータを作る","Railsを楽しむ"]
values = [0,1,2]

20.times do |n|
  Task.create(content:content_sample.sample + "#{n}", detail: "シードデータで投入したタスクです", limit: DateTime.now, status: values.sample, priority:values.sample, user_id:30)
end
