class Account < ApplicationRecord
  belongs_to :parent, class_name: 'Account', optional: true
  has_many :children, class_name: 'Account', foreign_key: 'parent_id'
  has_many :users
  has_many :donations

  def total_donations
    #self_and_descendant_ids = self.class.where(id: id).or(self.class.where(parent_id: id)).pluck(:id)
    self_ids = self.class.where(id: id).pluck(:id)
    #puts "...........asdasd.....#{self_ids} ............asdsadasd."
    Donation.where(account_id: self_ids).sum(:amount)
  end

  def self_and_descendants
    self.class.where(id: id).or(self.class.where(parent_id: id))
  end
end
