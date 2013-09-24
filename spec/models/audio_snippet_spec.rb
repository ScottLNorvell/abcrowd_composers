# == Schema Information
#
# Table name: audio_snippets
#
#  id                 :integer          not null, primary key
#  type               :string(255)
#  melody             :float
#  melody_with_lyrics :float
#  verse              :float
#  refrain            :float
#  lyric_version_id   :integer
#  instrumentation    :string(255)
#  source             :string(255)
#  source_url         :string(255)
#  user_id            :integer
#  completion_score   :float
#  likes              :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe AudioSnippet do
  pending "add some examples to (or delete) #{__FILE__}"
end
