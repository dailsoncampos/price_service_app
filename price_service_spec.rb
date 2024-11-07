require 'rspec'
require_relative 'price_service'

RSpec.describe PriceService do
  subject(:call) { PriceService.new(product: product, user: user).call }

  let(:user) { { id: 1, birthday_month: 5 } }

  context 'without tax and without discount' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 0, category: 'electronics' } }

    it 'calculates the total price as the base price' do
      expect(call).to eq(100.0)
    end
  end

  context 'when product has tax' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 10, category: 'electronics' } }

    it 'calculates the total price including tax' do
      expect(call).to eq(110.0)
    end
  end

  context 'when product belongs to food category' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 10, category: 'food' } }

    it 'applies a 5% discount for food category' do
      expect(call).to eq(104.5)
    end
  end

  context 'when product belongs to beverages category' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 10, category: 'beverages' } }

    it 'applies a 5% discount for beverages category' do
      expect(call).to eq(104.5)
    end
  end

  context 'when it is the user’s birthday month' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 10, category: 'electronics' } }
    let(:user) { { id: 1, birthday_month: Time.now.month } }

    it 'applies a 10% birthday discount' do
      expect(call).to eq(99.0)
    end
  end

  context 'when product is in food category and it is the user’s birthday month' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 10, category: 'food' } }
    let(:user) { { id: 1, birthday_month: Time.now.month } }

    it 'applies both 5% food discount and 10% birthday discount' do
      expect(call).to eq(93.5)
    end
  end
end
