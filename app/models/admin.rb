class Admin < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :phone, uniqueness: true, presence: true
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "phone number format not acceptable"}
  has_secure_password
end
