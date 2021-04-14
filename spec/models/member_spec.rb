require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'メンバーバリデーションテスト' do
    let(:member) { FactoryBot.build(:member) }

    # it 'バリデーションが有効なこと' do
    #   expect(member).to be_valid
    # end

    it 'メールアドレスが空欄でないこと' do
      member.email = ''
      expect(member).to be_invalid
    end
    
    it '名前が空欄でないこと' do
        member.name = ''
        expect(member).to be_invalid
      end
      
    context 'パスワードが6文字以上であること' do
      it 'パスワードが5文字以下だとエラー' do
        member.password = '12345'
        expect(member).to be_invalid
      end

      # it 'パスワードが6文字' do
      #   member.password = '123456'
      #   expect(member).to be_valid
      # end
    end
  end
end