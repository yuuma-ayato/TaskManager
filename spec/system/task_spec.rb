require 'rails_helper'

FactoryBot.define do
  factory :task1, class: Task do
    content { 'デフォルトの内容1' }
    detail { 'デフォルトの詳細1' }
  end
  factory :task2, class: Task do
    content { 'デフォルトの内容2' }
    detail { 'デフォルトの詳細2'}
  end
end

RSpec.describe 'Tasks', type: :system do
  before do
    # それぞれのテストケースで、before内のコードが実行
    # 各テストで使用するタスクを1件作成する
    # 作成したタスクオブジェクトを各テストケースで呼び出せるようにインスタンス変数に代入
    @task = FactoryBot.create(:task1)
  end
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      # テストコードを it '~' do end ブロックの中に記載する
      it '作成済みのタスクが表示される' do
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか。（含まれているか。）ということをexpectする（確認・期待する）
        expect(page).to have_content 'デフォルトの内容1'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいる' do
        new_task = FactoryBot.create(:task2)
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'デフォルトの内容2'
        expect(task_list[1]).to have_content 'デフォルトの内容1'
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
        sleep 3
        # contentというラベル名の入力欄と、detailというラベル名の入力欄に
        # タスクの内容と詳細をそれぞれfill_in(入力)する
        fill_in '内容', with: 'タスクデータテスト'
        fill_in '詳細', with: 'System　Specを使って必要項目を入力してcreateボタンを押した場合正しく保存されるかテストしている'
        #「Create New Task」というvalueのあるボタンをclick_on(クリック)する
        click_button 'Create New Task'
        # タスク一覧ページにテストコードで作成したデータがhave_contentされているかを確認する
        expect(page).to have_content 'タスクデータテスト'
        # テストコードで作成したデータのcontentの表示をクリックして詳細ウィンドウを表示する
        click_link 'タスクデータテスト'
        # 詳細ウィンドウ内の検証
        within('.modal') do
          # 詳細ウィンドウにテストコードで作成したデータがhave_contentされているかを確認する
          expect(page).to have_content 'タスクデータテスト'
          expect(page).to have_content 'System　Specを使って必要項目を入力してcreateボタンを押した場合正しく保存されるかテストしている'
        end
      end
    end
  end
  describe 'タスク詳細画面' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示されたページに遷移する' do
        # タスク一覧画面に遷移
        visit tasks_path
        # 作成したタスクデータのcontentの表示をクリック
        # 該当タスクの詳細ウィンドウが表示される
        click_link 'デフォルトの内容1'
        # 詳細ウィンドウ内の検証
        within('.modal') do
          # 詳細ウィンドウに該当タスクのcontent,detailがhave_contentされているかを確認する
          expect(page).to have_content 'デフォルトの内容1'
          expect(page).to have_content 'デフォルトの詳細1'
        end
       end
     end
  end
end
