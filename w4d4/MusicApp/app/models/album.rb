# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  yr         :integer          not null
#  live       :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks,
    foreign_key: :album_id,
    class_name: :Track,
    dependent: :destroy

  validates :title, :band_id, :yr, presence: true
  # validates :live, inclusion: { in: %w(true false) }
end
