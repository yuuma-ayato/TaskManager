require 'rails_helper'

FactoryBot.define do
  factory :user1, class: User do
    id { 1 }
    name { "テストユーザー1" }
    email { test_user1@test.com }
    password { password1 }
    admin { false }
  end
  factory :user2, class: User do
    id { 2 }
    name { "テストユーザー2" }
    email { test_user2@test.com }
    password { password2 }
    admin { true }
  end
end

RSpec.describe 'Users', type: :system do
  before do
    FactoryBot.create(:user1)
    FactoryBot.create(:user2)
  end
  describe 'ユーザー登録・ログイン・ログアウト機能' do
    context 'ユーザーを新規登録した場合' do
      it '作成済みのタスクが表示される' do
      end
    end
  end
