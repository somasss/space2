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
        visit new_beat_path
        fill_in "beat_beat_title", with: "test"
        find('input[type="number"]').set(20)
        click_on '登録する'
        visit beats_path
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
      visit new_beat_path
      fill_in "beat_beat_title", with: "test"
      find('input[type="number"]').set(20)
      click_on '登録する'
      visit beats_path
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit new_beat_path
        fill_in "beat_beat_title", with: "test2"
        find('input[type="number"]').set(20)
        click_on '登録する'
        expect(page).to have_content'test2'
      end
    end

    context 'タスクをタイトルで検索した場合' do
      it '検索条件に該当するものが上に表示される' do
        visit beats_path
        fill_in "q_beat_title_cont", with: "test"
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
      visit new_beat_path
      fill_in "beat_beat_title", with: "test"
      find('input[type="number"]').set(20)
      click_on '登録する'
      visit beats_path
    end
    
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        click_on 'Show'
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
      visit new_beat_path
      fill_in "beat_beat_title", with: "test"
      find('input[type="number"]').set(20)
      click_on '登録する'
      visit beats_path
    end

    context '任意のタスクを編集した場合' do
      it '該当タスクの内容が変更される' do
        click_on 'Edit'
        fill_in "beat_beat_title", with: "test2"
        click_on '更新する'
        expect(page).to have_content'test2'
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
      visit new_beat_path
      fill_in "beat_beat_title", with: "test"
      find('input[type="number"]').set(20)
      click_on '登録する'
      visit beats_path
    end
    
    context '任意のタスクを削除した場合' do
      it '該当タスクが削除される' do
        click_on 'Destroy'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content'was successfully destroyed'
      end
    end
  end

end