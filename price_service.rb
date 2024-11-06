class PriceService
  attr_reader :product, :user

  FOOD_AND_BEVERAGE_DISCOUNT = 0.05
  BIRTHDAY_DISCOUNT = 0.10

  def initialize(product:, user:)
    @product = product
    @user = user
  end

  def call
    total_price = base_price + tax_amount
    total_price - discount_amount(total_price)
  end

  private

  def base_price
    product[:base_price] || 0
  end

  def tax_amount
    base_price * (product[:tax_percentage] || 0) / 100.0
  end

  def discount_amount(total_price)
    discount_percentage = 0
    discount_percentage += FOOD_AND_BEVERAGE_DISCOUNT if eligible_for_food_or_beverage_discount?
    discount_percentage += BIRTHDAY_DISCOUNT if eligible_for_birthday_discount?
    total_price * discount_percentage
  end

  def eligible_for_food_or_beverage_discount?
    %w[food beverages].include?(product[:category])
  end

  def eligible_for_birthday_discount?
    user[:birthday_month] == Time.now.month
  end
end
