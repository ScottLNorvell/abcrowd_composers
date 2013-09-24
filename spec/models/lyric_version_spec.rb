# == Schema Information
#
# Table name: lyric_versions
#
#  id             :integer          not null, primary key
#  lyric_id       :integer
#  version_stream :text
#  title          :string(255)
#  text           :text
#  likes          :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe LyricVersion do
  pending "add some examples to (or delete) #{__FILE__}"
end
