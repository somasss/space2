require 'rails_helper'

RSpec.describe 'ノート管理機能', type: :system do
  describe '新規作成機能' do
    before(:each) do 
      user = create(:user)
      visit user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on 'ログイン'
    end
    context 'ノートを新規作成した場合' do
      it '作成したノートが表示される' do
        visit new_note_path
        fill_in"note_note_title", with: "note"
        fill_in"note_text", with: "note"
        fill_in"note_youtube", with: "https://youtu.be/79xG29X-n8U"
        click_on '登録する'
        visit notes_path
        expect(page).to have_content'note'
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
      visit new_note_path
      fill_in"note_note_title", with: "note"
      fill_in"note_text", with: "note"
      fill_in"note_youtube", with: "https://youtu.be/79xG29X-n8U"
      click_on '登録する'
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのノート一覧が表示される' do
        visit new_note_path
        fill_in"note_note_title", with: "note2"
        fill_in"note_text", with: "note2"
        fill_in"note_youtube", with: "https://youtu.be/79xG29X-n8U"
        click_on '登録する'
        visit notes_path
        expect(page).to have_content'note2'
      end
    end

    context 'ノートをタイトルで検索した場合' do
      it '検索条件に該当するものが上に表示される' do
       visit notes_path
       fill_in "q_note_title_cont", with: "note"
       click_on '検索'
       expect(page).to have_content'note'
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
      visit new_note_path
      fill_in"note_note_title", with: "note"
      fill_in"note_text", with: "note"
      fill_in"note_youtube", with: "https://youtu.be/79xG29X-n8U"
      click_on '登録する'
    end
    context '任意のノート詳細画面に遷移した場合' do
      it '該当ノートの内容が表示される' do
        visit notes_path
        click_on 'Show'
        expect(page).to have_content'note'
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
      visit new_note_path
      fill_in"note_note_title", with: "note"
      fill_in"note_text", with: "note"
      fill_in"note_youtube", with: "https://youtu.be/79xG29X-n8U"
      click_on '登録する'
    end
    context '任意のノートを編集した場合' do
      it '該当ノートの内容が変更される' do
        visit notes_path
        click_on 'Edit'
        fill_in"note_note_title", with: "note2"
        click_on '更新する'
        visit notes_path
        expect(page).to have_content'note2'
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
      visit new_note_path
      fill_in"note_note_title", with: "note"
      fill_in"note_text", with: "note"
      fill_in"note_youtube", with: "https://youtu.be/79xG29X-n8U"
      click_on '登録する'
    end
    context '任意のノートを削除した場合' do
      it '該当ノートが削除される' do
        visit notes_path
        click_on 'Destroy'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content'was successfully destroyed'
      end
    end
  end

end