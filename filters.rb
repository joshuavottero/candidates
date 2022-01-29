# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  results = nil
  people = @candidates
  people.each do |candidate|
    if (candidate[:id] == id)
      results = candidate
    end
  end
  return results
end

def experienced?(candidate)
  if (candidate[:years_of_experience] >= 2) 
    return true
  end
  return false
end

def qualified_candidates(candidates)
  good_candidates = []
  candidates.each do |candidate|
    #puts (candidate[:languages].include("Ruby") || candidate[:languages].include("Python"))
    if (experienced?(candidate) && candidate[:github_points] >= 100 && (candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")) && daysAgo(15) <= candidate[:date_applied] && candidate[:age] > 18)
      good_candidates.push(candidate)
    end
  end
  return good_candidates
end

def ordered_by_qualifications(candidates)
  sorted_candidates = candidates
  # while a changes occure keep looping
  #pp sorted_candidates[0][:years_of_experience]
  change = true
  while (change)
    change = false
    sorted_candidates.each_with_index do |key,index|
      # check for to see if index is not last element
      if (index != sorted_candidates.length() - 1)
        # check to see if current element has less experienced then the next element
        if (sorted_candidates[index][:years_of_experience] < sorted_candidates[index + 1][:years_of_experience])
          #swap places set change to true
          change = true
          temp_current = sorted_candidates[index]
          sorted_candidates[index] = sorted_candidates[index + 1]
          sorted_candidates[index + 1] = temp_current;
        # if not check if they have current element has less gitPoints then the next element
        elsif (sorted_candidates[index][:years_of_experience] == sorted_candidates[index + 1][:years_of_experience] && sorted_candidates[index][:github_points] < sorted_candidates[index + 1][:github_points])
          change = true
          temp_current = sorted_candidates[index]
          sorted_candidates[index] = sorted_candidates[index + 1]
          sorted_candidates[index + 1] = temp_current;
        end
      end
    end
  end
  return sorted_candidates
end

# returns the current time but a given days ago
def daysAgo(days)
  return (Time.now()) - 60 * 60 * 24 * days 
end
# More methods will go below
