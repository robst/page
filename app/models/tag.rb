class Tag < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end

  def self.plucked_names
    pluck(:name)
  end

end
