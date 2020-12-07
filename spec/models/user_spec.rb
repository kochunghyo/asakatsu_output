require 'rails_helper'

describe User do
  describe '#create' do

    it "全ての項目が入力されている場合は登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが入力されていないこと場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが入力されていない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが入力されていない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "encrypted_passwordが入力されていない場合は登録できないこと" do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください")
    end

    it "first_nameが入力されていない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "last_nameが入力されていない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "first_name_kanaが入力されていない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "last_name_kanaが入力されていない場合は登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "birthdayが入力されていない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "emailが重複する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "1234567", encrypted_password: "1234567")
      expect(user).to be_valid
    end
    
    it "passwordが7文字以下であれば登録できないこと" do
      user = build(:user, password: "123456", encrypted_password: "123456")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("は7文字以上で入力してください")
    end   

    it "first_nameが全角で入力されていない場合は登録できないこと" do
      user = build(:user, first_name: "ﾀﾛｳ")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角で入力してください")
    end

    it "last_nameが全角で入力されていない場合は登録できないこと" do
      user = build(:user, last_name: "ｻﾄｳ")
      user.valid?
      expect(user.errors[:last_name]).to include("は全角で入力してください")
    end

    it "first_name_kanaが全角カタカナで入力されていない場合は登録できないこと" do
      user = build(:user, first_name_kana: "たろう")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カナで入力してください")
    end  

    it "last_name_kanaが全角カタカナで入力されていない場合は登録できないこと" do
      user = build(:user, last_name_kana: "さとう")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は全角カナで入力してください")
    end

  end
end