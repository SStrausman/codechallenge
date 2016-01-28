require 'rails_helper'

describe Attendance do
	user_one = User.new(username: "Shea", password: "password")
	user_one.save
	taster_one = Taster.new(user_id: user_one.id, real_name: "Shea")
	taster_one.save
	user_one.update_attributes(usable: taster_one)
	brand_user = User.new(username: "cocacola", password: "password")
	brand_user.save
	event_one = Event.new(user_id: brand_user.id, location: "Whole Foods", event_date: Date.today)
	event_one.save

	it "it can be created for taster and an event" do
		attendance = Attendance.new(taster_id: taster_one.id, event_id: event_one.id)
		expect(attendance).to be_valid
	end

	it "defaults the check_in to false" do
		attendance = Attendance.new(taster_id: taster_one.id, event_id: event_one.id)
		attendance.save
		expect(attendance.check_in).to eq(false)
		attendance.destroy
	end

	it "defaults the check_out to false" do
		attendance = Attendance.new(taster_id: taster_one.id, event_id: event_one.id)
		attendance.save
		expect(attendance.check_out).to eq(false)
		attendance.destroy
	end

	it "allows tasters to check in" do
		attendance = Attendance.new(taster_id: taster_one.id, event_id: event_one.id)
		attendance.save
		attendance.check_in = true
		expect(attendance.check_in).to eq(true)
		attendance.destroy
	end

	it "allows tasters to check out" do
		attendance = Attendance.new(taster_id: taster_one.id, event_id: event_one.id)
		attendance.save
		attendance.check_out = true
		expect(attendance.check_out).to eq(true)
		attendance.destroy
	end
	user_one.destroy
	taster_one.destroy
	brand_user.destroy
	event_one.destroy

end