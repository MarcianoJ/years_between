require 'date'

class YearsBetween

  class MissingDateError < StandardError
    def message
      'start_date and end_date must be present'
    end
  end
  class StartDateAfterEndDateError < StandardError
    def message
      'start_date cannot be past end_date'
    end
  end

  def self.calculate_years_between(start_date, end_date, exclude: nil)
    start_date += 1 if exclude.to_s == 'start_date' || exclude.to_s == 'both'
    end_date -= 1 if exclude.to_s == 'end_date' || exclude.to_s == 'both'

    raise MissingDateError if [start_date, end_date].any?(&:nil?)
    raise StartDateAfterEndDateError if start_date > end_date

    start_year = start_date.year
    start_month = start_date.month
    start_day = start_date.day

    end_year = end_date.year
    end_month = end_date.month
    end_day = end_date.day

    start_mmdd = start_month * 100 + start_day
    end_mmdd = end_month * 100 + end_day

    if end_mmdd >= start_mmdd
      anniversary_year = end_year
    else
      anniversary_year = end_year - 1
    end

    if start_month == 2 && start_day == 29 && !(Date.leap?(anniversary_year))   
      anniversary_month = 3
      anniversary_day = 1
    else
      anniversary_month = start_month
      anniversary_day = start_day
    end

    year_frac_new = anniversary_year - start_year

    no_of_days = (end_date - Date.new(anniversary_year, anniversary_month, anniversary_day)).to_i + 1

    if start_mmdd <= 229
      if Date.leap?(anniversary_year)
        tot_no_of_days = 366
      else
        tot_no_of_days = 365
      end
    else        
      if Date.leap?(anniversary_year + 1)
        tot_no_of_days = 366
      else
        tot_no_of_days = 365
      end
    end

    year_frac_new = year_frac_new + (no_of_days.to_f / tot_no_of_days.to_f)
  end
end
