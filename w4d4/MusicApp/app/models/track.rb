# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  song       :string           not null
#  album_id   :integer          not null
#  ord        :integer          not null
#  bonus      :boolean          default("false"), not null
#  lyrics     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base

  belongs_to :album,
    foreign_key: :album_id,
    class_name: :Album

  has_one :band,
    through: :album,
    source: :band

  has_many :notes,
  foreign_key: :track_id,
  class_name: :Note

  validates :song, :album_id, :ord, :lyrics, presence: true

end
