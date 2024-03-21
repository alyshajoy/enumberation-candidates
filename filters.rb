# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require_relative './candidates'
require 'active_support/all'


def find(id)
    @candidates.each do |candidate|
      return candidate if candidate[:id] == id
  end
end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end

  def enough_points(candidate)
    candidate[:github_points] >= 100
  end

  def language_check(candidate)
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end

  def applied_recently(candidate)
    candidate[:date_applied] >= 15.days.ago.to_date
  end

  def is_adult(candidate)
    candidate[:age] > 17
  end
  
  def qualified_candidates(candidates)
    qualified_candidates_array = []

    candidates.each do |candidate|
      if experienced?(candidate) && enough_points(candidate) && language_check(candidate) && applied_recently(candidate) && is_adult(candidate)
        qualified_candidates_array.push(candidate)
      end
    end

    qualified_candidates_array

  end
  
  # More methods will go below

  def ordered_by_qualifications(candidates)
    sorted_candidates = candidates.sort_by { |candidate | -candidate[:years_of_experience]}
    puts sorted_candidates
  end