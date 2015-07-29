class Hunt < ActiveRecord::Base
 validates :name, presence: true, length: { maximum: 30, minimum: 2}   
end