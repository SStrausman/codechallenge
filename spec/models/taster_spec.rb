require 'rails_helper'

describe Taster do
	user = User.new(username: "shea", password: "password")
	taster = Taster.new(user_id: user.id, real_name: "Shea")
	user.save
	taster.save
	user.update_attributes(usable: taster)
	event = Event.new(location: "Albany, NY", event_date: Date.today)
	event.save

	it "is valid with a real name." do
		expect(taster).to be_valid
	end

	it "is invalid without a real name" do
		taster_two = Taster.new(user_id: user.id)
		(taster_two).valid?
		expect(taster_two.errors[:real_name]).to include("can't be blank")
	end

	it "returns a list of attendances" do 
		t = taster.attendances.new(event_id: event.id)
		t.save
		expect(taster.attendances.length).to eq(1)
		expect(taster.attendances[0].event_id).to eq(event.id)
		t.destroy
	end

	it "returns a list of assessments" do 
		assessment = Assessment.new(title: "first test")
		assessment.save
		taster_assessment = TasterAssessment.new(taster_id: taster.id, assessment_id: assessment.id)
		taster_assessment.save
		expect(taster.assessments.length).to eq(1)
		expect(taster.assessments[0].id).to eq(assessment.id)
		taster_assessment.destroy
		assessment.destroy
	end

	taster.destroy
	event.destroy
	user.destroy
end