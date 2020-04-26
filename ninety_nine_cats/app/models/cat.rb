require 'date'
require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w(black sepia white orange slate)

  validates :birth_date, :name, :description, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w(M F) }

  # How to calculate age?
  def age
    time_ago_in_words(birth_date)
    
    # Date.today - birth_date

    
    # 3 # placeholder
  end
end

# whiskers.birth_date # =>