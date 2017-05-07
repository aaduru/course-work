# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text             not null
#

class Sub < ActiveRecord::Base
  validates :title, :user_id, :description, presence: true

  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :post_subs, inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :post



end
