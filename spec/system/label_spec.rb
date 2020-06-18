require 'rails_helper'

FactoryBot.define do
  factory :user1, class: User do
    id { 1 }
    name { "テストユーザー1" }
    email { "test_user@test.com" }
    password { "password" }
    admin { true }
  end
end
RSpec.describe 'ラベル機能', type: :system do
  before do
    FactoryBot.create(:user1)
    # ログインする
    visit tasks_path
    click_link 'LogIn'
    sleep 0.5
    fill_in 'Email', with: 'test_user@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
  context '管理画面からタスクを作成した場合' do
    it '作成したタスクが表示される' do
      visit new_admin_label_path
      fill_in 'ラベル名', with: 'テストラベル'
      within '.dropdown_original' do
        select '赤'
      end
      click_button '登録する'
      expect(page).to have_content('テストラベル')
      expect(page).to have_css('.label')
    end
  end
end
