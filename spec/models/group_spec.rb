require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'グループのバリデーションテスト' do
    it 'グループ名が空欄ならば無効' do
      genre = Group.new(name: '',manager_id: 1)
      expect(genre).to be_invalid
    end
  end
end