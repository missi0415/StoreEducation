require 'rails_helper'
RSpec.describe "マネジャーログイン", type: :system do
  
  manager = Manager.create(id:1 ,email: 'test_manager@example.com', password: 'password')
  context 'ログイン画面' do
    it 'ヘッダーから遷移' do
      visit root_path
      click_link 'マネジャーログイン'
      expect(current_path).to eq new_manager_session_path
    end
    
    it 'ログイン画面が表示されること' do
      visit new_manager_session_path
      expect(page).to have_content('メールアドレス')
      expect(page).to have_content('パスワード')
    end
  end
  
  context 'フォームの入力値が正常' do
    it 'ログインに成功' do
      visit new_manager_session_path
      fill_in 'manager_email', with: manager.email
      fill_in 'manager_password', with: manager.password
      click_button 'マネジャーログイン'
      expect(page).to have_content('ログインしました')
    end
    
    it "ログイン後グループ一覧に遷移" do
      visit new_manager_session_path
      fill_in "manager_email", with: manager.email
      fill_in 'manager_password', with: manager.password
      click_button 'マネジャーログイン'
      expect(current_path).to eq manager_groups_path
    end
  end
  
  context 'メールアドレスが未入力' do
    it 'ログインに失敗' do
      visit new_manager_session_path
      fill_in "manager_email", with: ''
      fill_in 'manager_password', with: manager.password
      click_button 'マネジャーログイン'
      expect(page).to have_content('Emailまたはパスワードが違います')
    end
  end
  
  context 'パスワードが未入力' do
    it 'ログインに失敗' do
      visit new_manager_session_path
      fill_in "manager_email", with: manager.email
      fill_in 'manager_password', with: ''
      click_button 'マネジャーログイン'
      expect(page).to have_content('Emailまたはパスワードが違います')
    end
  end
  
  describe 'ログイン後' do 
    before do
      @group = Group.create(id: 1, name: "管理グループ1", manager_id: 1)
      @member = Member.create(
                    id:1,
                    name: "テストメンバー", 
                    email: "testmember@example.com",
                    password: "password",
                    group_id: 1
      )
      visit new_manager_session_path
      fill_in 'manager_email', with: manager.email
      fill_in 'manager_password', with: manager.password
      click_button 'マネジャーログイン'
      visit manager_groups_path
    end
    context "ページ遷移のテスト" do
      it "グループをクリックするとグループメンバー一覧へ遷移する" do
        click_link 'メンバー一覧'
        expect(current_path).to eq manager_group_path(@group.id)
      end
      it "グループ連絡への遷移" do
        click_link 'メンバー一覧'
        click_link 'グループ連絡'
        expect(current_path).to eq manager_group_message_path(@group.id)
      end 
      it "メンバープロフィールへの遷移" do
        click_link 'メンバー一覧'
        click_on "テストメンバー"
        #expect(page).to have_content('Emailまたはパスワードが違います')
        expect(current_path).to eq manager_member_path(@member.id)
      end 
    end
    
  end
    
    context 'ロウアウトのテスト' do
      it 'ログアウトできること' do
        visit new_manager_session_path
        fill_in 'manager_email', with: manager.email
        fill_in 'manager_password', with: manager.password
        click_button 'マネジャーログイン'
        click_link 'ログアウト'
        expect(page).to have_content('ログアウトしました')
      end
      
      it 'ログアウト後トップページに遷移すること' do
        visit new_manager_session_path
        fill_in 'manager_email', with: manager.email
        fill_in 'manager_password', with: manager.password
        click_button 'マネジャーログイン'
        click_link  'ログアウト'
        expect(current_path).to eq root_path
      end
    end
    
end