class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessor :firstname, :lastname, :address, :email, :phone, :user_id
end
