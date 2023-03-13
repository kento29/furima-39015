require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'abc', email: '', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'パスワードが空では登録できない' do
      user = User.new(nickname: 'abc', email: 'kkk@gmail.com', password: '', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    # it "苗字が空だと登録できない" do
    #   user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "", first_name: "ゆたか", last_name_kana: "ハラ", first_name_kana: "ユタカ")
    #   user.valid?
    #   binding.pry
    #   expect(user.errors.full_messages).to include("Last_name can't be blank")
    # end
    # it "名前が空だと登録できない" do
    #   user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "原", first_name: "", last_name_kana: "ハラ", first_name_kana: "ユタカ")
    #   user.valid?
    #   expect(user.errors.full_messages).to include("First_name can't be blank")
    # end
    # it "苗字（カナ）が空だと登録できない" do
    #   user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "原", first_name: "ゆたか", last_name_kana: "", first_name_kana: "ユタカ")
    #   user.valid?
    #   expect(user.errors.full_messages).to include("Last_name_kana can't be blank")
    # end
    # it "名前（カナ）が空だと登録できない" do
    #   user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "原", first_name: "ゆたか", last_name_kana: "ハラ", first_name_kana: "")
    #   user.valid?
    #   expect(user.errors.full_messages).to include("First_name_kana can't be blank")
    # end
  end
end
