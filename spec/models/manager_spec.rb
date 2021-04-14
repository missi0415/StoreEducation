require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'マネジャーバリデーションテスト' do
    let(:manager) { FactoryBot.build(:manager) }

    it 'バリデーションが有効なこと' do
      expect(manager).to be_valid
    end

    it 'メールアドレスが空欄でないこと' do
      manager.email = ''
      expect(manager).to be_invalid
    end

    context 'パスワードが6文字以上であること' do
      it 'パスワードが5文字' do
        manager.password = '12345'
        expect(manager).to be_invalid
      end

      it 'パスワードが6文字' do
        manager.password = '123456'
        expect(manager).to be_valid
      end
    end
  end
end