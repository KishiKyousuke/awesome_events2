require "test_helper"

class EventTest < ActiveSupport::TestCase
  test '#created_by? owner_idと引数の#idが同じ時' do
    event = FactoryBot.create(:event)
    user = User.new
    user.stub(:id, event.owner_id) do
      assert_equal(true, event.created_by?(user))
    end
  end

  test '#created_by? owner_idと引数の#idが異なるとき' do
    event = FactoryBot.create(:event)
    another_user = FactoryBot.create(:user)
    assert_equal(false, event.created_by?(another_user))
  end

  test '#created_by? 引数がnilなとき' do
    event = FactoryBot.create(:event)
    assert_equal(false, event.created_by?(nil))
  end

end
