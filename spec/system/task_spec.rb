require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      # テストコードを it '~' do end ブロックの中に記載する
      it '作成済みのタスクが表示される' do
        # テストで使用するためのタスクを作成
        task = FactoryBot.create(:task, content: 'test_content')
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか。（含まれているか。）ということをexpectする（確認・期待する）
        expect(page).to have_content 'test_content'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
  end
  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        # タスク一覧画面に遷移
        visit tasks_path
        # 「+New」のリンクをクリックし、タスク新規作成フォームを表示
        click_link '+New'
        # contentというラベル名の入力欄と、detailというラベル名の入力欄に
        # タスクの内容と詳細をそれぞれfill_in(入力)する
        fill_in 'Content', with: 'タスクデータが保存されるかテストする'
        fill_in 'Detail', with: 'System　Specを使って必要項目を入力してcreateボタンを押した場合正しく保存されるかテストしている'
        #「Create New Task」というvalueのあるボタンをclick_on(クリック)する
        click_button 'Create New Task'
        # タスク一覧ページにテストコードで作成したデータがhave_contentされているかを確認する
        expect(page).to have_content 'タスクデータが保存されるかテストする'
        # テストコードで作成したデータのcontentの表示をクリックして詳細ウィンドウを表示する
        click_link 'タスクデータが保存されるかテストする'
        # 詳細ウィンドウ内の検証
        within('.modal') do
          # 詳細ウィンドウにテストコードで作成したデータがhave_contentされているかを確認する
          expect(page).to have_content 'タスクデータが保存されるかテストする'
          expect(page).to have_content 'System　Specを使って必要項目を入力してcreateボタンを押した場合正しく保存されるかテストしている'
        end
      end
    end
  end
  describe 'タスク詳細画面' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示されたページに遷移する' do
        # テストに使用するタスクデータを作成
        task = FactoryBot.create(:task, content: 'test_show_content', detail: 'test_show_detail')
        # タスク一覧画面に遷移
        visit tasks_path
        # 作成したタスクデータのcontentの表示をクリック
        # 該当タスクの詳細ウィンドウが表示される
        click_link 'test_show_content'
        # 詳細ウィンドウ内の検証
        within('.modal') do
          # 詳細ウィンドウに該当タスクのcontent,detailがhave_contentされているかを確認する
          expect(page).to have_content 'test_show_content'
          expect(page).to have_content 'test_show_detail'
        end
       end
     end
  end
end
