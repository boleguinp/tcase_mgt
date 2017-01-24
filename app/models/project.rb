class Project < ApplicationRecord
  has_many :t_cases, dependent: :destroy
  validates :title, presence: true,
                  length: { minimum: 5 }
end
