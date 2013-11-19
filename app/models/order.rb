class Order < ActiveRecord::Base
  attr_accessor :order_date, :user_id
  has_many :orderitems
  belongs_to :user
end