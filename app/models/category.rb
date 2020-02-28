class Category < ApplicationRecord
  validates :title, presence: true
  has_many :microposts, dependent: :destroy
end
