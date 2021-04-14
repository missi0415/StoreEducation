require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '課題項目のバリデーション' do
    let!(:manager) { FactoryBot.build(:manager) }
    let!(:member) { FactoryBot.build(:member) }
    let!(:task){ member.tasks.build(member_id: 1,title: "課題タイトル",body: "課題ボディ")}
    

    it 'バリデーションが有効であること' do
      expect(task).to be_valid
    end
    
    context '課題タイトルのバリデーション' do
      it '空欄でないこと' do
        task.title = ''
        expect(task).to be_invalid
      end
    
      it '30文字以内であること' do
        task.title = "a" * 31
        expect(task).to be_invalid
      end
    
    end

    context '補足部分のバリデーション' do
      it '空欄でないこと' do
        task.body = ''
        expect(task).to be_invalid
      end

      it '300文字以内であること' do
        task.body = "a" * 301
        expect(task).to be_invalid
      end
    end
    
    context '進捗率のバリデーション' do
      it '空欄でも入力され0が代入される' do
        task.progress = ''
        expect(task).to be_valid
      end
      
      it "4桁の数値は入力されない" do
        task.progress = 1000
        expect(task).to be_invalid
      end
    end
    
    context 'メンバーコメントのバリデーション' do
      it '空欄の状態で有効である' do
        task.progress = ''
        expect(task).to be_valid
      end
      
      it "200文字以上は入力されない" do
        task.member_body = "a" * 201
        expect(task).to be_invalid
      end
    end
  end
end