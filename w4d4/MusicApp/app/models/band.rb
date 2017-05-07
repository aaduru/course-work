# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base

  has_many :albums,
    foreign_key: :band_id,
    class_name: :Album,
    dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
