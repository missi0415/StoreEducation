require 'rails_helper'

RSpec.describe Education, type: :model do
  describe '教育項目のバリデーション' do
    let!(:manager) { FactoryBot.build(:manager) }
    let!(:member) { FactoryBot.build(:member) }
    let!(:education){ member.educations.build(member_id: 1,title: "教育タイトル",body: "教育ボディ")}
    

    it 'バリデーションが有効であること' do
      expect(education).to be_valid
    end
    
    context '教育タイトルのバリデーション' do
      it '空欄でないこと' do
        education.title = ''
        expect(education).to be_invalid
      end
    
      it '30文字以内であること' do
        education.title = "a" * 31
        expect(education).to be_invalid
      end
    
    end

    context '補足部分のバリデーション' do
      it '空欄でないこと' do
        education.body = ''
        expect(education).to be_invalid
      end

      it '300文字以内であること' do
        education.body = "a" * 201
        expect(education).to be_invalid
      end
    end
    
    context '進捗率のバリデーション' do
      it '空欄でも入力され0が代入される' do
        education.progress = ''
        expect(education).to be_valid
      end
      
      it "3桁以上の数値は入力されない" do
        education.progress = 1000
        expect(education).to be_invalid
      end
      
    end  
  end
end