require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do
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
