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
    context "能力管理機能のテスト" do
      it "能力項目の追加" do
        fill_in 'title', with: "能力タイトル"
        click_button "項目追加"
        expect(page).to have_content('能力タイトル')
      end
      it "能力値の編集" do
        fill_in 'title', with: "能力タイトル"
        click_button "項目追加"
        fill_in "ability_value",with: 5
        click_button "値の変更"
        expect(page).to have_field'ability[value]', with: 5
      end
    end
    context "課題管理機能のテスト" do
      it "課題項目の追加" do
        fill_in 'task[title]', with: "課題タイトル"
        fill_in 'task[body]', with: "補足"
        click_button "課題項目追加"
        expect(page).to have_field'task[title]', with: "課題タイトル"
        expect(page).to have_field'task[body]', with: "補足"
      end
      it "値の変更" do
        fill_in 'task[title]', with: "課題タイトル"
        fill_in 'task[body]', with: "補足"
        click_button "課題項目追加"
          fill_in 'task_title_1', with: '課題タイトル変更'
          click_button "変更を保存"
        expect(page).to have_field'task[title]', with: "課題タイトル変更"
      end
      it "項目の消去" do
        fill_in 'task[title]', with: "課題タイトル"
        fill_in 'task[body]', with: "補足"
        click_button "課題項目追加"
        find("#task_delete_1").click
        expect(page).to_not have_field'task_title_1', with: "課題タイトル"
      end
    end
    context "教育管理機能のテスト" do
      it "教育項目の追加" do
        fill_in 'education_title', with:  "教育タイトル"
        fill_in 'education_body', with: "補足"
        click_button "教育項目追加"
        expect(page).to have_field'education_title_1', with: "教育タイトル"
        expect(page).to have_field'education_body_1', with: "補足"
      end
      it "値の変更" do
        fill_in 'education_title', with:  "教育タイトル"
        fill_in 'education_body', with: "補足"
        click_button "教育項目追加"
        fill_in 'education_title_1', with: '教育タイトル変更'
        find_by_id('education_update_1').click
        expect(page).to have_field'education_title_1', with: "教育タイトル変更"
      end
      it "項目の消去" do
        fill_in 'education_title', with: "課題タイトル"
        fill_in 'education_body', with: "補足"
        click_button "教育項目追加"
        find("#education_delete_1").click
        expect(page).to_not have_field'education_title_1', with: "教育タイトル"
      end
    end
    context "グループ連絡機能のテスト" do
      it "グループ連絡の投稿"do
        click_link 'グループ連絡'
        fill_in 'group_message_title', with: 'グループ連絡タイトル'
        fill_in 'group_message_body', with: '連絡内容'
        click_button "連絡事項追加"
        expect(page).to have_field'group_message_title_1', with: "グループ連絡タイトル"
        expect(page).to have_field'group_message_body_1', with: "連絡内容"
      end
      it "グループメッセージの編集" do
        click_link 'グループ連絡'
        fill_in 'group_message_title', with: 'グループ連絡タイトル'
        fill_in 'group_message_body', with: '連絡内容'
        click_button "連絡事項追加"
        fill_in 'group_message_body_1', with: '内容変更'
        find_by_id('group_message_update1').click
        expect(page).to have_field'group_message_body_1', with: "内容変更"
      end
        it "グループメッセージの削除" do
        click_link 'グループ連絡'
        fill_in 'group_message_title', with: "グループ連絡タイトル"
        fill_in 'group_message_body', with: "連絡内容"
        click_button '連絡事項追加'
        click_link "削除"
        expect(page).to_not have_field'group_message_title_1', with: "連絡内容"
      end  
    end
  end    
end