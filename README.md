# TaskManager
## バージョン情報
-ruby 2.6.5p114  
-Rails 5.2.4.3  
-psql (PostgreSQL) 12.3  

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 20|
|email|string|unique: true, limit: 255|
|password|string|limit: 128|
|admin|boolean|default: false|
### Association
has_many :tasks, dependent: :destroy

## tasksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|content|string|null: false, limit: 50|
|detail|text|
|priority|enum|null: false, default: "中"|
|status|enum|null: false, default: "未着手"|
|limit|datetime|
### Association
belongs_to :user
has_many :labels, through :tasks_labels

## tasks_labelsテーブル
|Column|Type|Options|
|------|----|-------|
|task_id|references|null: false, foreign_key: true|
|label_id|references|null: false, foreign_key: true|
### Association
belongs_to :task
belongs_to :label

## labelsテーブル
|Column|Type|Options|
|------|----|-------|
|label_name|string|null: false, unique: true|
|color|string|null:false, default: "#ffffff"|
### Association
has_many :tasks, through :tasks_labels

## herokuへのデプロイ方法
1. herokuにログインする  
```
heroku login
```
任意のキーを押すとブラウザが立ち上がりログイン画面が表示されるので、ログインする。  
1. heroku上にアプリを新規作成  
```
heroku create アプリ名
```
アプリ名は空欄にすると自動生成される。heroku上の他のアプリと重複できない。  
1. プリコンパイル  
```
bundle exec rails assets:precompile RAILS_ENV=production
```
1. herokuにデプロイ  
```
git add -A
git commit -m "コミットメッセージ"
git push heroku master
```
