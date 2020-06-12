content_sample = ["テストをする","シードデータを作る","Railsを楽しむ"]
every_status = [0,1,2]

10.times do |n|
  Task.create(content:content_sample.sample + "#{n}", detail: "シードデータで投入したタスクです", limit: DateTime.now, status: every_status.sample)
end
