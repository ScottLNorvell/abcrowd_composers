# == Schema Information
#
# Table name: lyrics
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lyric < ActiveRecord::Base
  attr_accessible :topic_id
end
