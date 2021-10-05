require 'rails_helper'

RSpec.describe Staff, type: :model do
  before do
    @staff = FactoryBot.build(:staff)
    @user = FactoryBot.build(:user)
  end

  describe 'スタッフ登録' do
    it 'nicknameが空では登録できない' do
      @staff = Staff.new(nickname: '')
      @staff.valid?
      expect(@staff.errors.full_messages).to include ("Nicknameを入力してください")
    end

    it '重複したnicknameが存在する場合登録できない' do
      @user.save
      @staff.save
      another_staff = FactoryBot.build(:staff)
      another_staff.nickname = @staff.nickname
      another_staff.valid?
      expect(another_staff.errors.full_messages).to include ("Nicknameはすでに存在します")
    end
  end
end
