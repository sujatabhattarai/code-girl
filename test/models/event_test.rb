require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @event = Event.new(title: "Scope of Programming", description: "These days with the increase in technology, almost every company require programmers",
                       venue: "Room 203", date_time: "2019/07/19 13:30")
  end


  test "event should be valid" do
    assert @event.valid?
  end

  test "title should be present" do
    @event.title = ""
    assert_not @event.valid?
  end

  test "title should be unique" do
    @event.save
    event2 = Event.new(title: "Scope of Programming")
    assert_not event2.valid?
  end

  test "title should not be too long" do
    @event.title = "abc" * 50
    assert_not @event.valid?
  end

  test "title should not be too short" do
    @event.title = "abcd"
    assert_not @event.valid?
  end

end