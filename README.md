# years_between
Calculate difference in years with decimals between to dates in ruby. Both start_date and end_date are inclusive by default.

Usage:

```ruby
  start_date = Date.today - 365
  end_date = Date.today
  
  YearsBetween.calculate_years_between(start_date, end_date)
  > 1.0
```
