require 'test_helper'

class StarTest < ActiveSupport::TestCase
    def test_uniqueness_for_star_fields
    star = Star.create(:athlete_id => 1, :user_id => 1)
    star1 = Star.create(:athlete_id => 1, :user_id => 1)
    assert !star1.valid?, "One user can't star one athlete more than one time"
  end
end