# TaskManager

## usersテーブル
-|Column|Type|Options|
-|------|----|-------|
### Association
has_many :tasks, dependent: :destroy

## tasksテーブル
-|Column|Type|Options|
-|------|----|-------|
-|user_id|references|null: false, foreign_key: true|
-|content|string|null: false, limit: 150|
-|priority|enum|null: false, default: "通常"|
-|status|enum|null: false, default: "未着手"|
-|limit|timestamp|
### Association
belongs_to :user
has_many :labels, through :tasks_labels

## tasks_labelsテーブル
-|Column|Type|Options|
-|------|----|-------|
-|task_id|references|null: false, foreign_key: true|
-|label_id|references|null: false, foreign_key: true|
### Association
belongs_to :task
belongs_to :label

## labelsテーブル
-|Column|Type|Options|
-|------|----|-------|
-|label_name|string|null: false, unique: true|
-|color|string|null:false, default: "#ffffff"|
### Association
has_many :tasks, through :tasks_labels
