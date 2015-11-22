class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :user, presence: true

  delegate :name, to: :user, prefix: true, allow_nil: true
end
