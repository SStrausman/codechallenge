require 'rails_helper'

describe Assessment do

	it "is valid with a title." do
		assessment = Assessment.new(title: "Beer Assessment")
		expect(assessment).to be_valid
	end

	it "is invalid without a title" do
		assessment = Assessment.new(title: nil)
		assessment.valid?
		expect(assessment.errors[:title]).to include ("can't be blank")
	end

	it "returns a list of questions" do 
		assessment = Assessment.new(title: "Wine Knowledge")
		assessment.save
		question_one = assessment.questions.new(prompt: "What is the best wine?", answer: "Pinot Grigio")
		question_one.save
		expect(assessment.questions.length).to eq(1)
		expect(assessment.questions.first).to eq(question_one)
		question_two = assessment.questions.new(prompt: "What is the worst wine?", answer: "reisling")
		question_two.save
		expect(assessment.questions.length).to eq(2)
		expect(assessment.questions.last).to eq(question_two)
		assessment.destroy
		question_one.destroy
		question_two.destroy
	end

	it "returns a list of tasters who have taken it" do 
		assessment = Assessment.new(title: "Why do people drink 4loko?")
		assessment.save
		user = User.new(username: "shea", password: "password")
		user.save
		taster = Taster.new(user_id: user.id, real_name: "shea")
		taster.save
		user.update_attributes(usable: taster)
		taster_assessment = TasterAssessment.new(taster_id: taster.id, assessment_id: assessment.id)
		taster_assessment.save
		expect(assessment.tasters.first).to eq(taster)
		expect(assessment.tasters.length).to eq(1)
		taster.destroy
		user.destroy
		taster_assessment.destroy
		assessment.destroy
	end

end