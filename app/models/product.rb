# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  release_date :date
#  rating       :string
#  score        :integer
#  importance   :integer
#  moderator_id :integer
#  actable_id   :integer
#  actable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ActiveRecord::Base
  actable
  has_many :reviews
  belongs_to :moderator

  before_save do
    if release_date.class == Hash
      self.release_date = Date.new(*release_date.values)
    end
  end

  def pretty_date
    release_date.strftime('%B %-d, %Y')
  end
end
