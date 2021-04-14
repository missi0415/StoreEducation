require 'rails_helper'

RSpec.describe AbilityTitle, type: :model do
  describe '能力項目のバリデーションテスト' do
    it '空欄でないこと' do
      title = AbilityTitle.new(title: '',group_id: 1)
      expect(title).to be_invalid
    end
  end
end