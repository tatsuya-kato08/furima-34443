class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :code, :area_id, :city, :number, :phone, :building, :purchase, :token

  with_options presence: true do
    validates :code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :number
    validates :phone, numericality: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' }
    validates :token
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id) #購入情報を保存して、変数purchaseに格納
    Address.create(code: code, area_id: area_id, city: city, number: number, building: building, phone: phone, purchase_id: purchase.id)
  end
end
