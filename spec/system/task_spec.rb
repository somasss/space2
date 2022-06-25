require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    before(:each) do 
      user = create(:user)
      visit user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on 'ログイン'
    end
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "task_task_title", with: "test"
        find_by_id("task_due_date_1i").find("option[value='2022']").select_option
        find_by_id("task_due_date_2i").find("option[value='6']").select_option
        find_by_id("task_due_date_3i").find("option[value='30']").select_option
        find_by_id("task_due_date_4i").find("option[value='10']").select_option
        find_by_id("task_due_date_5i").find("option[value='30']").select_option
        find_by_id("task_status").find("option[value='実行中']").select_option
        click_on '登録する'
        visit tasks_path
        expect(page).to have_content'test'
      end
    end
  end

  describe '一覧表示機能' do
    before(:each) do 
      user = create(:user)
      visit user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on 'ログイン'
      visit new_task_path
      fill_in "task_task_title", with: "test"
      find_by_id("task_due_date_1i").find("option[value='2022']").select_option
      find_by_id("task_due_date_2i").find("option[value='6']").select_option
      find_by_id("task_due_date_3i").find("option[value='30']").select_option
      find_by_id("task_due_date_4i").find("option[value='10']").select_option
      find_by_id("task_due_date_5i").find("option[value='30']").select_option
      find_by_id("task_status").find("option[value='実行中']").select_option
      click_on '登録する'
      visit tasks_path
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit new_task_path
        fill_in "task_task_title", with: "note"
        find_by_id("task_due_date_1i").find("option[value='2022']").select_option
        find_by_id("task_due_date_2i").find("option[value='6']").select_option
        find_by_id("task_due_date_3i").find("option[value='30']").select_option
        find_by_id("task_due_date_4i").find("option[value='10']").select_option
        find_by_id("task_due_date_5i").find("option[value='30']").select_option
        find_by_id("task_status").find("option[value='実行中']").select_option
        click_on '登録する'
        visit tasks_path
        expect(page).to have_content'note'
      end
    end

    context 'タスクをタイトルで検索した場合' do
      it '検索条件に該当するものが上に表示される' do
        visit tasks_path
        fill_in "q_task_title_cont", with: "test"
        click_on '検索'
        expect(page).to have_content'test'
      end
    end

  end

  describe '詳細表示機能' do
    before(:each) do 
      user = create(:user)
      visit user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on 'ログイン'
      visit new_task_path
      fill_in "task_task_title", with: "test"
      find_by_id("task_due_date_1i").find("option[value='2022']").select_option
      find_by_id("task_due_date_2i").find("option[value='6']").select_option
      find_by_id("task_due_date_3i").find("option[value='30']").select_option
      find_by_id("task_due_date_4i").find("option[value='10']").select_option
      find_by_id("task_due_date_5i").find("option[value='30']").select_option
      find_by_id("task_status").find("option[value='実行中']").select_option
      click_on '登録する'
      visit tasks_path
    end
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        visit tasks_path
        click_on '詳細'
        expect(page).to have_content'test'
       end
     end
  end

  describe '投稿編集機能' do
    before(:each) do 
      user = create(:user)
      visit user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on 'ログイン'
      visit new_task_path
      fill_in "task_task_title", with: "test"
      find_by_id("task_due_date_1i").find("option[value='2022']").select_option
      find_by_id("task_due_date_2i").find("option[value='6']").select_option
      find_by_id("task_due_date_3i").find("option[value='30']").select_option
      find_by_id("task_due_date_4i").find("option[value='10']").select_option
      find_by_id("task_due_date_5i").find("option[value='30']").select_option
      find_by_id("task_status").find("option[value='実行中']").select_option
      click_on '登録する'
      visit tasks_path
    end
     context '任意のタスクを編集した場合' do
       it '該当タスクの内容が変更される' do
        visit tasks_path
        click_on '編集'
        fill_in "task_task_title", with: "edit"
        click_on '更新する'
        visit tasks_path
        expect(page).to have_content'edit'
       end
     end
  end

  describe '投稿削除機能' do
    before(:each) do 
      user = create(:user)
      visit user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on 'ログイン'
      visit new_task_path
      fill_in "task_task_title", with: "test"
      find_by_id("task_due_date_1i").find("option[value='2022']").select_option
      find_by_id("task_due_date_2i").find("option[value='6']").select_option
      find_by_id("task_due_date_3i").find("option[value='30']").select_option
      find_by_id("task_due_date_4i").find("option[value='10']").select_option
      find_by_id("task_due_date_5i").find("option[value='30']").select_option
      find_by_id("task_status").find("option[value='実行中']").select_option
      click_on '登録する'
      visit tasks_path
    end
     context '任意のタスクを削除した場合' do
       it '該当タスクが削除される' do
        visit tasks_path
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content'削除に成功しました'
       end
     end
  end

end