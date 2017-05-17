class Project < ApplicationRecord
  LEADS = ['pboleguin', 'apaul', 'palan', 'dryan']
  has_many :t_cases, dependent: :destroy
  validates :title, presence: true,
                  length: { minimum: 5 }
  validates :lead, presence: true
end
