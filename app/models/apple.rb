class Apple < ApplicationRecord
  include Blending
  belongs_to :basket
  after_create :filling_percentage

  def filling_percentage
    basket = self.basket
    percent = basket.apple.count.to_f / basket.capacity.to_f * 100
    p "Baseket with id #{basket.id} filled with the rate of #{percent.round(2)}"
    basket.update(fill_rate: percent.round(2))
  end
end
