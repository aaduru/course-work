# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :user_id, :subs, presence: true

  # belongs_to :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs, inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub
end
