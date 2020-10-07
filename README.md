# years_between
Calculate difference in years with decimals between to dates in ruby. Both start_date and end_date are inclusive by default.

Usage:

```ruby
  start_date = Date.today - 365
  end_date = Date.today
  
  YearsBetween.calculate_years_between(start_date, end_date)
  > 1.0
```

Excluding dates is possible with the :exclude keyword (possible values: :start_date, :end_date, :both)

```ruby
  YearsBetween.calculate_years_between(start_date, end_date, exclude: :end_date)
  > 0.9972677595628415
```
