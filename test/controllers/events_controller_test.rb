require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @event = Event.create(title: "Scope of Programming", description: "These days with the increase in technology, almost every company require programmers",
                          venue: "Room 203", date_time: "2019/07/19 13:30")
    @user = User.create(first_name: "Sujata", last_name: "Bhattarai", email: "user@gmail.com", password: "abcdef", admin: true )
  end

  test "should get events index" do
    get events_path
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, "abcdef")
    get new_event_path
    assert_response :success
  end

  test "should get show" do
    get event_path(@event)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { title: "Scope of Programming", description: "These days with the increase in technology, almost every company require programmers",
          venue: "Room 203", date_time: "2019/07/19 13:30"} }
    end
    assert_redirected_to events_path
  end
end
