# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  track_id   :integer          not null
#  user_id    :integer          not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  belongs_to :track,
  foreign_key: :track_id,
  class_name: :Track

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

   validates :content, :track_id, :user_id, presence: true
end
