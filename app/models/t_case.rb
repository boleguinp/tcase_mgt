class TCase < ApplicationRecord
  belongs_to :project
  validates :t_case_id, presence: true,
                  length: { minimum: 3 }
end
