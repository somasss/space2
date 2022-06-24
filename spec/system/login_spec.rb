require 'rails_helper'

RSpec.describe 'ログイン機能', type: :system do
  describe 'ログイン機能' do
    context 'ユーザーを新規作成した場合' do
      it 'ログインできる' do
        user = create(:user)
        visit user_session_path
        fill_in "user_email", with: user.email
        fill_in "user_password", with: user.password
        click_on 'ログイン'
        expect(page).to have_content'ログインしました'
      end
    end
  end

  describe 'ログイン機能' do
    before(:each) do 
      user = create(:user)
      visit user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on 'ログイン'
      expect(page).to have_content'ログインしました'
    end
    context 'ログイン状態でログアウトをクリックした場合' do
      it 'ログアウトできる' do
        visit beats_path
        find(".navbar-toggler-icon").click
        click_on 'ログアウト'
        expect(page).to have_content'ログアウトしました'
      end
    end
  end


end