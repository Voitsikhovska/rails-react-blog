class Challenge < ApplicationRecord
  belongs_to :user

  validates :title, :description, :start_date, :end_date, presence: true
end
