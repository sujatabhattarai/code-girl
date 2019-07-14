require 'test_helper'

class CreateEventsTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(first_name: "Sujata", last_name: "Bhattarai", email: "user@gmail.com", password: "abcdef", password_confirmation: "abcdef", admin: true )
  end

  test "get new event form and create event" do
     sign_in_as(@user, "abcdef")
    get new_event_path
    assert_template 'events/new'

    assert_difference 'Event.count', 1 do
      post events_path, params:{event:{title: "Scope of Programming", description: "These days with the increase in technology, almost every company require programmers",
                                       venue: "Room 203", date_time: "2019/07/19 13:30"}}
      follow_redirect!
    end
  end

  test "invalid event submission" do
    sign_in_as(@user, "abcdef")
    get new_event_path
    assert_template 'events/new'

    assert_no_difference 'Event.count' do
      post events_path, params:{event:{title: " ", description: "These days require programmers",
                                       venue: "Room 203", date_time: "2019/07/19 13:30"}}
    end
   # assert_template 'events/new'
  end

  test "should redirect when admin not logged in" do
    assert_no_difference 'Event.count' do
      post events_path, params: {event:{title: "Scope of Programming", description: "These days with the increase in technology, almost every company require programmers",
                                        venue: "Room 203", date_time: "2019/07/19 13:30"}}
    end
    assert_redirected_to events_path
  end
end