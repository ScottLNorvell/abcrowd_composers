# == Schema Information
#
# Table name: lyric_lines
#
#  id             :integer          not null, primary key
#  text           :text
#  lyric_id       :integer
#  order_number   :float
#  version_number :integer
#  likes          :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe LyricLine do
  pending "add some examples to (or delete) #{__FILE__}"
end
