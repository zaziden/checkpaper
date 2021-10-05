require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryBot.build(:menu)
  end

  describe 'メニュー登録' do
    it 'menu_nameが空では登録できない' do
      @menu = Menu.new(menu_name: '')
      @menu.valid?
      expect(@menu.errors.full_messages).to include ("Menu nameを入力してください")
    end

    it 'priceが全角数字では登録できない' do
      @menu = Menu.new(price: '１１１' )
      @menu.valid?
      expect(@menu.errors.full_messages).to include ("Priceは数値で入力してください")
    end

    it 'priceが全角文字では登録できない' do
      @menu = Menu.new(price: '百十一' )
      @menu.valid?
      expect(@menu.errors.full_messages).to include ("Priceは数値で入力してください")
    end

    it 'priceが英語では登録できない' do
      @menu = Menu.new(price: 'one' )
      @menu.valid?
      expect(@menu.errors.full_messages).to include ("Priceは数値で入力してください")
    end

    it '重複したmenu_nameがある場合は登録できない' do
      @menu.save
      new_menu = FactoryBot.build(:menu)
      new_menu.menu_name = @menu.menu_name
      new_menu.valid?
      expect(@menu.errors.full_messages).to include ("Menu nameはすでに存在します")
    end
  end
end
