require 'rails_helper'
RSpec.describe "マネジャー機能のテスト", type: :system do
  manager = Manager.create(id:1 ,email: 'test_manager@example.com', password: 'password')

  describe 'メンバープロフィール画面のテスト' do 
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
      click_link 'メンバー一覧'
      click_on "テストメンバー"
    end
    context "能力管理機能" do
      it "能力項目の追加" do
        fill_in 'title', with: "能力タイトル"
        click_button "項目追加"
        expect(page).to have_content('能力タイトル')
      end
      it "能力値の編集" do
        fill_in "ability[value]",with: 5
        click_button "変更"
        expect(ability_value).to eq  5
      end
    end
  end    
end