class Product < ActiveRecord::Base
  attr_accessible :description, :name, :attachments_attributes

  has_many :comments

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
end
