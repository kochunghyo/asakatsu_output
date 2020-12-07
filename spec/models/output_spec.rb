require 'rails_helper'

describe Output do
  describe '#create' do

    it "全ての項目が入力されている場合は投稿できること" do
      user = create(:user)
      type = create(:type)
      output = build(:output, user_id: user[:id], type_id: type[:id])
      expect(output).to be_valid
    end

    it "titleがない場合は投稿できないこと" do 
      user = create(:user)
      type = create(:type)
      output = build(:output, type_id: type[:id])
      output.title = nil
      expect(output.errors[:title]).to include()
    end

    it "type_idがない場合は投稿できないこと" do 
      user = create(:user)
      type = create(:type)
      output = build(:output)
      output.type_id = nil
      expect(output.errors[:type_id]).to include()
    end

    it "画像が無い場合は投稿できないこと" do
      user = create(:user)
      type = create(:type)
      output = build(:output)
      output.images = []
      output.valid?
      expect(output.errors[:src]).to include()
    end

    it "textがない場合は投稿できないこと" do 
      user = create(:user)
      type = create(:type)
      output = build(:output, type_id: type[:id])
      output.text = nil
      expect(output.errors[:text]).to include()
    end
  end

end