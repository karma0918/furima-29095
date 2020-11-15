class Item < ApplicationRecord
  has_one_attached :image
  with_options presence: true do
    validates :area_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :cost_id, numericality: { other_than: 1 }
    validates :way_time_id, numericality: { other_than: 1 }
    validates :price, inclusion: { in: 300..999999999},format: { with: /\A[0-9]+\z/,message:"半角数字で入力"}
    validates :name
    validates :description
  end
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :way_time
  belongs_to :user
  has_one_attached :image
end
