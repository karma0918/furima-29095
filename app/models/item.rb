class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  with_options presence: true do
    validates :area_id, numericality: { other_than: 0 }
    validates :category_id, numericality: { other_than: 0 }
    validates :condition_id, numericality: { other_than: 0 }
    validates :cost_id, numericality: { other_than: 0 }
    validates :way_time_id, numericality: { other_than: 0 }
    validates :price, inclusion: { in: 300..9999999},format: { with: /\A[0-9]+\z/,message:"半角数字で入力"}
    validates :name
    validates :description
    validates :image
  end
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :way_time
  belongs_to :user
  has_one_attached :image
end
