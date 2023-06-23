class Author < ApplicationRecord
#     All authors have a name
#    No two authors have the same name
#   Author phone numbers are exactly ten digits

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, length: {is: 10}
end
