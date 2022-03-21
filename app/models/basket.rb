class Basket < ApplicationRecord
  has_many :apple
  scope :limit_check, ->(limit) { where("id NOT IN (SELECT DISTINCT(basket_id) FROM baskets inner join apples on apples.basket_id = baskets.id group by apples.basket_id having count(apples.basket_id) >= #{limit})") }
end