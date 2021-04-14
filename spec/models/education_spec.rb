require 'rails_helper'

RSpec.describe Education, type: :model do
  describe 'のバリデーション' do
    let!(:manager) { FactoryBot.build(:manager) }
    let!(:member) { FactoryBot.build(:member) }
    let!(:education){ member.educations.build(member_id: 1,title: "教育タイトル",body: "教育ボディ")}
    

    it 'バリデーションが有効であること' do
      expect(education).to be_valid
    end
    
    context '商品名のバリデーション' do
      it '教育タイトルが空欄でないこと' do
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
        education.body = "a" * 301
        expect(education).to be_invalid
      end
    end
  end
end