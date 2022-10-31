require 'date'
require 'pry'

def cal
  today = Date.today
  year = today.year
  month = today.month
  days_count = Date.new(year, month, -1).day

  days_names = { 0 => 'Sun', 1 => 'Mon', 2 => 'Tue', 3 => 'Wed', 4 => 'Thu', 5 => 'Fri', 6 => 'Sat' }
  table_days_names_line = days_names.values.join(' ')

  month_year_line = today.strftime('%B %Y').to_s
  table_month_year_line = month_year_line.center(table_days_names_line.length)

  puts table_month_year_line
  puts table_days_names_line

  table_days_grid = Array.new(6) { String.new(' ' * 100) }

  first_day_wday_num = Date.new(year, month, 1).wday
  offset = first_day_wday_num
  week_day_num = offset

  1.upto(days_count) do |day_num|
    week_day_num = 0 if week_day_num > 6

    week_day_pos = table_days_names_line =~ /#{days_names[week_day_num]}/

    table_week_line = (day_num + offset - 1) / 7
    table_days_grid[table_week_line].insert(week_day_pos, day_num.to_s)
    week_day_num += 1
  end

  puts table_days_grid
end

cal
