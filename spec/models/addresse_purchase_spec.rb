require 'rails_helper'
RSpec.describe AddressePurchase, type: :model do
  describe '#create' do
      before do
        seller = FactoryBot.create(:user)
        buyer = FactoryBot.create(:user)
        item = FactoryBot.build(:item, user_id:seller.id)
        @purchase = FactoryBot.build(:addresse_purchase, user_id:buyer.id, item_id:item.id)
      end
      describe '購入機能' do
        context '購入がうまくいくとき' do
        it "購入できる" do
          expect(@purchase).to be_valid
        end
        it "building_nameは空でも保存できること" do
          @purchase.building_name = ""
          expect(@purchase).to be_valid
        end
      end

      context '購入機能がうまくいかないとき' do
        it "tokenが空では登録できないこと" do
          @purchase.token = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end
        it "配送先の情報として、郵便番号が必須であること" do
          @purchase.postal_code = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
        end
        it "郵便番号にはハイフンが必要であること（123-4567となる）" do
          @purchase.postal_code = '1234567'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it "配送先の情報として、都道府県が必須であること" do
          @purchase.prefecture_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'prefectureを選択していないと保存できないこと' do
          @purchase.prefecture_id = 0
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
        end
        it "配送先の情報として、市区町村が必須であること" do
          @purchase.municipality = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
        end
        it "配送先の情報として、番地が必須であること" do
          @purchase.house_number = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("House number can't be blank")
        end
        it "配送先の情報として、電話番号が必須であること" do
          @purchase.phone_number = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
        end
        it "電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）" do
          @purchase.phone_number = "090-12345-6789"
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
        end
        it "電話番号にはハイフンは不要で、11桁以内でないと登録できないこと（09012345678となる）" do
          @purchase.phone_number = "090-12345-6789"
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
        end
        it "電話番号にはハイフンは不要で、数字のみでないと登録できないこと（09012345678となる）" do
          @purchase.phone_number = "090-12345-6789"
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
        end
      end
    end
  end
 end
