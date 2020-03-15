require 'net/http'
require 'nokogiri'

module YourRuby
  module_function

  def fizzbuzz(max)
    # ret_arr is the array to be returned
    ret_arr = []
    # num represents a number counter since max is representing the number to count up to.
    num = 1
    # runs my if/elsif/else loop the number of times designated by max
    max.times do
      # if the number is divisible by 3
      if num % 3 == 0
        # and if the number is divisible by 5
        if num % 5 == 0
          # then add "fizzbuzz" to the array
          ret_arr.push("fizzbuzz")
        else
          # otherwise add "fizz"
          ret_arr.push("fizz")
        end
        # if the number is divisible by 5
      elsif num % 5 == 0
        # then add "buzz" to the array
        ret_arr.push("buzz")
      else
        # otherwise just add the current number to the array
        ret_arr.push(num)
      end
      # iterate the number by 1
      num += 1
    end
    # when the loop is complete return the array
    return ret_arr
  end

  # This needs more tests if you get time.
  def smallest_rectangle_of_aspect(ratio, rectangle)
    height = rectangle[0]
    width = rectangle[1]

    if ratio == 1
      if height > width
        width = height
      else
        height = width
      end
    elsif ratio > 1
      if height > width
        width = height * ratio
      elsif height < width
        if width / ratio > height
          height = width / ratio
        else
          width = height * ratio
        end
      else
        width = height * ratio
      end
    elsif ratio < 1
      if height * ratio > width
        width = height * ratio
      else
        height = width / ratio
      end
    end

    return [height, width]
  end

  # This needs more tests if you get time.
  def parse_time(str)
    split_str = str.split(//)
    split_str
    seconds = 0
    tens_of_hours = split_str[0].to_i
    ones_of_hours = split_str[1].to_i
    tens_of_minutes = split_str[3].to_i
    ones_of_minutes = split_str[4].to_i
    seconds += (tens_of_hours * 10 * 60 * 60)
    seconds += (ones_of_hours * 60 * 60)
    seconds += (tens_of_minutes * 10 * 60)
    seconds += (ones_of_minutes * 60)
    seconds
  end

  # This needs more tests and better logic.
  def finish_time_for_day(date, opening_hours)
    if date.saturday? || date.sunday?
      return false
    end

    year = date.year
    month = date.month
    day = date.day

    if date.friday?
      finish_time = opening_hours["Fri"][1].split(//)
      else
      finish_time = opening_hours["Mon"][1].split(//)
    end

    hours = finish_time[0] + finish_time[1]
    minutes = finish_time[3] + finish_time[4]

    Time.mktime(year, month, day, hours.to_i, minutes.to_i)
  end

  # This needs more tests and better logic.
  def start_time_for_day(date, opening_hours)
    if date.saturday? || date.sunday?
      return false
    end

    year = date.year
    month = date.month
    day = date.day

    start_time = opening_hours["Mon"][0].split(//)

    hours = start_time[0] + start_time[1]
    minutes = start_time[3] + start_time[4]

    Time.mktime(year, month, day, hours.to_i, minutes.to_i)
  end

  # This needs more tests and better logic.
  def calculate_completion_time(placed_at, num_hours, opening_hours)
    year = placed_at.year
    month = placed_at.month
    day = placed_at.day
    hour = placed_at.hour
    minutes = placed_at.min
    closing_time = opening_hours["Fri"][1].split(//)
    closing_hour = (closing_time[0] + closing_time[1]).to_i
    closing_minute = (closing_time[3] + closing_time[4]).to_i
    start_time = opening_hours["Mon"][0].split(//)
    completion_hour = hour + num_hours

    if completion_hour > closing_hour
      next_day = Time.mktime(year, month, day + 1)
      if next_day.saturday?
        day += 3
      else
        day += 1
      end
      hour =
          (hour + num_hours) - (closing_hour) +
              (start_time[0] + start_time[1]).to_i
      minutes = closing_minute + minutes

      return Time.mktime(year, month, day, hour, minutes)
    end

    Time.mktime(year, month, day, (hour + num_hours), minutes)

  end

  def duckduckwhy(str, num_results)
    uri = URI("https://duckduckgo.com/html/?q=#{str}+wiki")
    html = Net::HTTP.get(uri) # => String

    document = Nokogiri::HTML(html)
    results = []

    document.css('.result__a').each do |result|
      element = result
      uri = element['href']
      http_address = URI.decode_www_form(uri).to_h["uddg"]
      results.append(http_address)
    end

    counter = 0
    final_response =[]
    while counter < num_results
      final_response.append(results[counter])
      counter += 1
    end
    return final_response


  end
end

