class Micropost < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user

  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
