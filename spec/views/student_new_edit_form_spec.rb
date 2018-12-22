require "rails_helper"

RSpec.describe "create and edit form" do
  

    it "directly renders the form in a students/form partial with the form object passed through as a local variable" do
      view.lookup_context.prefixes = %w[students]
      student = Student.new
      assign(:student, student)
      render :template => "students/new.html.erb"
      expect(rendered).to render_template(:partial => "_form")
    end


    it "directly renders the form in a students/form partial with the form object passed through as a local variable" do
      view.lookup_context.prefixes = %w[students]
      student = Student.new
      assign(:student, student)

      render :template => "students/new.html.erb"
      expect(rendered).to render_template(:partial => "_form", locals: {student: student})
    end
  end

  describe 'edit form' do
    it "renders edit student form from the edit.html file" do
      view.lookup_context.prefixes = %w[students]
      student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(25.years.ago, 18.years.ago))
      assign(:student, student)
      render :template => "students/edit.html.erb"
      expect(rendered).to match /Update Student/
    end


    it "directly renders the form in a students/form partial with the form object passed through as a local variable" do
      view.lookup_context.prefixes = %w[students]
      student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(25.years.ago, 18.years.ago))
      assign(:student, student)

      render :template => "students/edit.html.erb"
      expect(rendered).to render_template(:partial => "_form", locals: {student: student})
    end
  end
end
