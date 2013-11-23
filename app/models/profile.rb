class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessor :address, :background, :category, :description, :email, :logo, :name, :phone, :user_id
end
