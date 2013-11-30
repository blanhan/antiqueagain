class Profile < ActiveRecord::Base
  belongs_to :user
  #attr_accessor :firstname, :lastname, :address, :phone, :user_id
end
