# spec/factories/projects.rb
FactoryGirl.define do
  factory :project do
    sequence(:title) {|n| "Project_#{n}"}
    lead "pboleguin"
    sequence(:description) {|n| "Proj_Description_#{n}"}
  end
end
