require 'rails_helper'
RSpec.describe "メンバーログイン", type: :system do
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
    end  
    context 'ログイン画面' do
      it 'ヘッダーから遷移' do
        visit root_path
        click_link "メンバーログイン"
        expect(current_path).to eq new_member_session_path
      end
      
      it 'ログイン画面が表示されること' do
        visit new_member_session_path
        expect(page).to have_content('メールアドレス')
        expect(page).to have_content('パスワード')
      end
    end
    context 'フォームの入力値が正常' do
      it 'ログインに成功' do
        visit new_member_session_path
        fill_in 'member_email', with: @member.email
        fill_in 'member_password', with: @member.password
        click_button 'メンバーログイン'
        expect(page).to have_content('ログインしました')
      end
    end
    context 'メールアドレスが未入力' do
      it 'ログインに失敗' do
        visit new_member_session_path
        fill_in 'member_email', with: ""
        fill_in 'member_password', with: @member.password
        click_button 'メンバーログイン'
        expect(page).to have_content('Emailまたはパスワードが違います')
      end
    end
    context 'パスワードが未入力' do
      it 'ログインに失敗' do
        visit new_member_session_path
        fill_in 'member_email', with: @member.email
        fill_in 'member_password', with: ""
        click_button 'メンバーログイン'
        expect(page).to have_content('Emailまたはパスワードが違います')
      end
    end
  end
  
  describe 'ページ遷移のテスト' do
    before do 
      @group = Group.create(id: 1, name: "管理グループ1", manager_id: 1)
      @member = Member.create(
                    id:1,
                    name: "テストメンバー", 
                    email: "testmember@example.com",
                    password: "password",
                    group_id: 1
      )
      @task = Task.create(id: 1, member_id: 1, title: "接客用語暗記", body: "34ページから", start_on: "2021-04-11", end_on: "2021-04-15", member_body: "完了しました。確認お願いいたします", member_status: "完了", manager_status: "未確認", progress: 5)
      @Education = Education.create(id: 1, member_id: 1, title: "接客用語教育", body: "34ページから", progress: 5 )  
        visit new_member_session_path
        fill_in 'member_email', with: @member.email
        fill_in 'member_password', with: @member.password
        click_button 'メンバーログイン'
    end
    context "ログイン後のページ遷移" do
      it "ログイン後のページがメンバーindexである" do
        expect(current_path).to eq member_members_path
      end
      it "店舗連絡への遷移" do
        click_link '店舗連絡'
        expect(current_path).to eq member_group_messages_path
      end
    end
    context "プロフィールの編集" do
      it "名前の編集" do 
        fill_in 'member_name', with: 'テスト編集'
        find('#profile-update').click
        expect(page).to have_field'member_name', with: "テスト編集"
      end
      it "メールアドレスの編集" do 
        fill_in 'member_email', with: 'testedit@example.com'
        find('#profile-update').click
        expect(page).to have_field'member_email', with: 'testedit@example.com'
      end
      it "電話番号の編集" do 
        fill_in 'member_phone_number', with: '12345678912'
        find('#profile-update').click
        expect(page).to have_field'member_phone_number', with: "12345678912"
      end
    end  
    context "グループメッセージ機能" do
      it "グループメッセージの投稿" do
        click_link '店舗連絡'
        fill_in 'group_message_post', with: "店舗連絡タイトル"
        fill_in 'auto-resize', with: "連絡内容"
        click_button '連絡事項追加'
        expect(page).to have_field'group_message_title_1', with: "店舗連絡タイトル"
        expect(page).to have_field'group_message_body_1', with: "連絡内容"
      end
      it "グループメッセージの編集" do
        click_link '店舗連絡'
        fill_in 'group_message_post', with: "店舗連絡タイトル"
        fill_in 'auto-resize', with: "連絡内容"
        click_button '連絡事項追加'
        fill_in 'group_message_title_1', with: '内容変更'
        find_by_id('group_message_update_1').click
        expect(page).to have_field'group_message_title_1', with: "内容変更"
      end  
      it "グループメッセージの削除" do
        click_link '店舗連絡'
        fill_in 'group_message_post', with: "店舗連絡タイトル"
        fill_in 'auto-resize', with: "連絡内容"
        click_button '連絡事項追加'
        click_link "削除"
        expect(page).to_not have_field'group_message_title_1', with: "連絡内容"
      end  
    end
    context "課題項目機能のテスト" do
      it "コメントの編集" do 
        fill_in 'task_member_body_1', with: "メンバーコメント"
        find_by_id('task_update_1').click
        expect(page).to have_field "task_member_body_1", with: "メンバーコメント"
      end
      it "進捗率の編集" do 
        fill_in 'task_progress_1', with: '100'
        find_by_id('task_update_1').click
        expect(page).to have_field "task_progress_1", with: "100"
      end      
      it "完了チェックの編集" do
        select '完了', from: 'task_member_status_1'
        find_by_id('task_update_1').click
        expect(page).to have_field "task_member_status_1", with: "完了"
      end
    end
    context "教育項目機能のテスト" do
      it "進捗率の編集" do 
        fill_in 'education_progress_1', with: '100'
        find_by_id('education_update_1').click
        expect(page).to have_field "education_progress_1", with: "100"
      end
    end  
    
  end 
end  