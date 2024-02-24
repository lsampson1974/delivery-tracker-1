# == Schema Information
#
# Table name: delivery_items
#
#  id           :integer          not null, primary key
#  arrival_date :date
#  description  :text
#  name         :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class DeliveryItem < ApplicationRecord
   validates(:name, presence: true) 
   validates(:arrival_date, presence: true)
end
