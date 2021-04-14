require 'rails_helper'

RSpec.describe GroupMessage, type: :model do
  describe '課題項目のバリデーション' do
    let!(:manager) { FactoryBot.build(:manager) }
    let!(:group) { FactoryBot.build(:group) }
    let!(:group_message){group.group_messages.build(group_id: 1, title: "連絡事項", body: "全体への連絡です")}
    

    it 'バリデーションが有効であること' do
      expect(group_message).to be_valid
    end
    
    context '連絡事項のバリデーション' do
      it '空欄でないこと' do
        group_message.title = ''
        expect(group_message).to be_invalid
      end
    
      it '30文字以内であること' do
        group_message.title = "a" * 31
        expect(group_message).to be_invalid
      end
    
    end

    context '連絡内容のバリデーション' do
      it '空欄でないこと' do
        group_message.body = ''
        expect(group_message).to be_invalid
      end
      it '300文字以内であること' do
        group_message.body = "a" * 301
        expect(group_message).to be_invalid
      end
    end
    
  end
end  