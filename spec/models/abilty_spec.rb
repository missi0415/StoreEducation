require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe '能力値のバリデーションテスト' do
    let!(:manager) { FactoryBot.build(:manager) }
    let!(:group){ manager.groups.build(name: "グループ１",manager_id:1)}
    let!(:title){ group.ability_titles.build(id:1 ,title: "能力値",group_id:1)}
    let!(:member) { FactoryBot.build(:member) }
    let!(:ability){ member.abilities.build(value: 5, ability_title_id: 1, member_id: 1)}
    
    # it '空欄でも入力ができる' do
    #   ability.value = 4
    #   expect(ability).to be_valid
    # end
    it "4桁の数値は入力されない" do
      ability.value = 1000
      expect(ability).to be_invalid
    end
  end
end