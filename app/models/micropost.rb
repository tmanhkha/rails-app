class Micropost < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :category

  def should_generate_new_friendly_id?
    title_changed? || super
  end

  def short_content
    content.size > 255 ? content[0..254] + '...'  : content 
  end
end
