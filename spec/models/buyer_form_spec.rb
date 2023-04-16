require 'rails_helper'

RSpec.describe BuyerForm, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buyer_form = FactoryBot.build(:buyer_form, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品購入できる場合' do
      it '全ての購入情報が存在すれば購入できる' do
        expect(@buyer_form).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @buyer_form.building = ''
        expect(@buyer_form).to be_valid
      end
    end

    context '商品購入できない場合' do
      it "tokenが空では登録できないこと" do
        @buyer_form.token = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空だと購入できない" do
        @buyer_form.post_code = ''
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it "shipping_area_idが空だと購入できない" do
        @buyer_form.shipping_area_id = '___'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Shipping area is not a number")
      end
      it "municipalitiesが空だと購入できない" do
        @buyer_form.municipalities = ''
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "addressが空だと購入できない" do
        @buyer_form.address = ''
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Address can't be blank")
      end
      it "telephone_numberが空だと購入できない" do
        @buyer_form.telephone_number = ''
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end
      it "post_codeはハイフンがないと登録できない" do
        @buyer_form.post_code = '1234567'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Post code is invalid")
      end
      it "post_codeは「3桁ハイフン4桁」でないと購入できない" do
        @buyer_form.post_code = '1-234567'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Post code is invalid')
      end
      it "post_codeは全角文字だと購入できない" do
        @buyer_form.post_code = '１２３−４５６７'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Post code is invalid')
      end
      it "post_codeは英字だと購入できない" do
        @buyer_form.post_code = 'onetwothree'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Post code is invalid')
      end
      it "post_codeはひらがなだと購入できない" do
        @buyer_form.post_code = 'いちにさんし'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Post code is invalid')
      end
      it "post_codeは漢字だと購入できない" do
        @buyer_form.post_code = '一二三四'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Post code is invalid')
      end
      it "post_codeはカタカナだと購入できない" do
        @buyer_form.post_code = 'イチニサン'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Post code is invalid')
      end
      it "telephone_numberが全角文字だと購入できない" do
        @buyer_form.telephone_number = '０９０１２３４５６７８'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberが英字だと購入できない" do
        @buyer_form.telephone_number = 'onetwothree'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberが漢字だと購入できない" do
        @buyer_form.telephone_number = '一二三四'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberがひらがなだと購入できない" do
        @buyer_form.telephone_number = 'いちにさんし'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberがカタカナだと購入できない" do
        @buyer_form.telephone_number = 'イチニサンシ'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberが9桁以下だと購入できない" do
        @buyer_form.telephone_number = '090123456'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberが12桁以上だと購入できない" do
        @buyer_form.telephone_number = '090123456789'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberはハイフンがあると購入できない" do
        @buyer_form.telephone_number = '090-1234-5678'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buyer_form.user_id = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
          @buyer_form.item_id = nil
          @buyer_form.valid?
          expect(@buyer_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end







