# spec/factories/tcase.rb
FactoryGirl.define do
  factory :t_case do
    sequence(:t_case_id) {|n| "TC#{n}"}
    sequence(:title) {|n| "Title_#{n}"}
    sequence(:scenario) {|n| "Scenario_#{n}"}
    status "NotRun"
    end
  end
