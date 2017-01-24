class TCase < ApplicationRecord
  belongs_to :project
  validates :title, presence: true,
                  length: { minimum: 5 }
  validates :t_case_id, presence: true,
                  length: { minimum: 3 }
end
