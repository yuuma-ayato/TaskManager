require 'rails_helper'

FactoryBot.define do
  factory :user1, class: User do
    id { 1 }
    name { "テストユーザー1" }
    email { 'test_user1@test.com' }
    password { 'password1' }
    admin { false }
  end
  factory :user2, class: User do
    id { 2 }
    name { "テストユーザー2" }
    email { 'test_user2@test.com' }
    password { 'password2' }
    admin { true }
  end
end

RSpec.describe 'Users', type: :system do
  before do
    FactoryBot.create(:user1)
    FactoryBot.create(:user2)
  end
  describe 'ユーザー登録・ログイン・ログアウト機能' do
    context 'ユーザーのデータがなくログインしていない場合' do
      it 'ユーザーの新規登録のテスト' do
        visit tasks_path
        click_link 'SignUp'
        sleep 0.5
        fill_in 'user[name]', with: 'test_user'
        fill_in 'user[email]', with: 'test_user@test.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '登録する'
        expect(page).to have_content 'test_user'
        expect(page).to have_content 'test_user@test.com'
      end
      it 'タスク一覧のページに飛ぶとログインを促すメッセージが表示される' do
        visit tasks_path
        expect(page). to have_content 'ログインして下さい'
      end
      it 'ログインのテスト' do
        visit tasks_path
        click_link 'LogIn'
        sleep 0.5
        fill_in 'Email', with: 'test_user1@test.com'
        fill_in 'Password', with: 'password1'
        click_button 'Log in'
        expect(page).to have_content 'テストユーザー1'
        expect(page).to have_content 'test_user1@test.com'
      end
    end
    context '一般ユーザーでログインしている場合' do
      before do
        visit tasks_path
        click_link 'LogIn'
        sleep 0.5
        fill_in 'Email', with: 'test_user1@test.com'
        fill_in 'Password', with: 'password1'
        click_button 'Log in'
      end
      it '自分の詳細が画面に表示されている(show)' do
        expect(page).to have_content 'テストユーザー1'
        expect(page).to have_content 'test_user1@test.com'
      end
      it 'ログアウトが出来る' do
        click_link 'LogOut'
        expect(page).to have_content 'ログインして下さい'
      end
    end
    context '管理ユーザーでログインしている場合' do
      before do
        visit tasks_path
        click_link 'LogIn'
        sleep 0.5
        fill_in 'Email', with: 'test_user2@test.com'
        fill_in 'Password', with: 'password2'
        click_button 'Log in'
      end
      it '管理ユーザーは管理画面にアクセス出来る' do
        visit admin_users_path
        expect(current_path).to eq admin_users_path
      end
      it '管理ユーザーはユーザーを新規登録できる' do
        visit admin_users_path
        click_link 'ユーザーを作成する'
        fill_in 'user[name]', with: 'admin_test_user'
        fill_in 'user[email]', with: 'test_user@test.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '送信'
        expect(page).to have_content 'admin_test_user'
      end
      it '管理ユーザーはユーザーの詳細画面にアクセス出来る' do
        visit admin_users_path
        click_link '詳細', match: :first
        expect(current_path).to eq admin_user_path(id: 1)
      end
      it '管理ユーザーはユーザーを編集できる' do
        visit admin_users_path
        click_link '編集', match: :first
        fill_in 'user[name]', with: 'test_user1edit'
        fill_in 'user[email]', with: 'test_user_edit@test.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '送信'
        visit admin_user_path(id: 1)
        expect(page).to have_content 'test_user1edit'
        expect(page).to have_content 'test_user_edit@test.com'
      end
      it '管理ユーザーはユーザーを削除できる' do
        visit admin_users_path
        click_link '削除', match: :first
        expect(page).not_to have_content 'test_user1'
      end
    end
  end
end
