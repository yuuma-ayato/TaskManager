require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do
  context 'タスクを保存した場合' do
    it 'contentが空ならバリデーションが通らない' do
      task = Task.new(content:"", detail: "失敗テスト")
      expect(task).not_to be_valid
    end
    it 'contentが50文字以上ならバリデーションが通らない' do
      task = Task.new(content:"#{ "あ" * 51 }", detail: "失敗テスト")
      expect(task).not_to be_valid
    end
    it 'detailが空でもcontentが入力されていればバリデーションが通る' do
      task = Task.new(content:"成功テスト", detail: "")
      expect(task).to be_valid
    end
    it 'detailが255文字以上ならバリデーションが通らない' do
      task = Task.new(content:"失敗テスト", detail: "#{ "f" * 260 }")
      expect(task).not_to be_valid
    end
  end
  context 'scopeメソッドで検索をした場合' do
    before do
      Task.create(content:"task", status: 0, priority: 0)
      Task.create(content:"test", status: 1, priority: 1)
      Task.create(content:"model", status: 2, priority: 2)
      Task.create(content:"spec", status: 0, priority: 0)
    end
    it 'scopeメソッドでタイトル検索ができる' do
      expect(Task.what_content("task").what_status("").count).to eq 1
    end
    it 'scopeメソッドでステータス検索ができる' do
      expect(Task.what_content("").what_status(0).count).to eq 2
      expect(Task.what_content("").what_status(2).count).to eq 1
    end
    it 'scopeメソッドでタイトルとステータスの両方で絞り込んで検索ができる' do
      expect(Task.what_content("task").what_status(1).count).to eq 0
      expect(Task.what_content("model").what_status(2).count).to eq 1
      expect(Task.what_content("model").what_status(0).count).to eq 0
    end
    it 'scopeメソッドで優先順位検索ができる' do
      expect(Task.what_priority(0).count).to eq 2
      expect(Task.what_priority(1).count).to eq 1
    end
    it 'scopeメソッドでタイトルとステータスと優先順位で絞り込んで検索ができる' do
      expect(Task.what_content("task").what_status(0).what_priority(0).count).to eq 1
    end
  end
end
