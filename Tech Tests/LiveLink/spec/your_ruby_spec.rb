require 'spec_helper'

RSpec.describe "YourRuby" do
  describe ".fizzbuzz" do
    it "should play fizzbuzz to 3, returning the number or 'fizz' if the number is a multiple of 3" do
      expect(YourRuby.fizzbuzz(3)).to eq([1,2, "fizz"])
    end
    it "should play fizzbuzz to 5, with rules above and multiples of 5 are 'buzz'" do
      expect(YourRuby.fizzbuzz(5)).to eq([1,2,"fizz",4,"buzz"])
    end
    it "should play fizzbuzz to 10 with rules above and multiples of 3 and 5 are 'fizzbuzz'" do
      expect(YourRuby.fizzbuzz(15)).to eq([1,2,"fizz",4,"buzz","fizz",7,8,"fizz","buzz",11,"fizz",13,14,"fizzbuzz"])
    end
    it "should play fizzbuzz to 30" do
      expect(YourRuby.fizzbuzz(30)).to eq([1,2,"fizz",4,"buzz","fizz",7,8,"fizz","buzz",11,"fizz",13,14,"fizzbuzz",16,17,"fizz",19,"buzz","fizz",22,23,"fizz","buzz",26,"fizz",28,29,"fizzbuzz"])
    end
  end

  describe ".smallest_rectangle_of_aspect" do
    it "should find the smallest rectangle of aspect ratio 1.0 the contains rectangle 300x500" do
      expect(YourRuby.smallest_rectangle_of_aspect(1.0, [300, 500])).to eq([500, 500])
    end

    it "should find the smallest rectangle of aspect ratio 1.0 the contains rectangle 500x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(1.0, [500, 300])).to eq([500, 500])
    end

    it "should find the smallest rectangle of aspect ratio 2.0 the contains a rectangle of size 500x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(2.0, [500, 300])).to eq([500, 1000])
    end

    it "should find the smallest rectangle of aspect ratio 0.5 the contains a rectangle of size 500x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.5, [500, 300])).to eq([600, 300])
    end

    it "should find the smallest rectangle of aspect ratio 0.1 the contains a rectangle of size 500x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.1, [500, 300])).to eq([3000, 300])
    end

    it "should find the smallest rectangle of aspect ratio 10 the contains a rectangle of size 500x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(10, [500, 300])).to eq([500, 5000])
    end

    it "should find the smallest rectangle of aspect ratio 10 the contains a rectangle of size 10x10" do
      expect(YourRuby.smallest_rectangle_of_aspect(10, [10, 10])).to match_array([10, 100])
    end

    it "should find the smallest rectangle of aspect ratio 3/5 the contains a rectangle of size 500x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(3.0/5.0, [500, 300])).to eq([500, 300])
    end

    it "should work for ratio 2, rectangle: 200x700" do
      expect(YourRuby.smallest_rectangle_of_aspect(2, [200, 700])).to eq([350, 700])
    end

    it "should work for ratio 0.5, rectangle: 400x700" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.5, [400, 700])).to eq([1400, 700])
    end

    it "should work for ratio: 1, rectangle: 300x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(1.0, [300, 300])).to eq([300, 300])
    end

    it "should work for ratio: 2, rectangle: 300x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(2, [300, 300])).to eq([300, 600])
    end

    it "should work for ratio: 0.5, rectangle: 300x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.5, [300, 300])).to eq([600, 300])
    end

    it "should work for ratio: 1, rectangle: 700x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(1.0, [700, 300])).to eq([700, 700])
    end

    it "should work for ratio: 2, rectangle: 700x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(2, [700, 300])).to eq([700, 1400])
    end

    it "should work for ratio: 2, rectangle: 700x600" do
      expect(YourRuby.smallest_rectangle_of_aspect(2, [700, 600])).to eq([700, 1400])
    end

    it "should work for ratio: 0.5, rectangle: 700x300" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.5, [700, 300])).to eq([700, 350])
    end

    it "should work for ratio: 0.5, rectangle: 700x600" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.5, [700, 600])).to eq([1200, 600])
    end

    it "should work for ratio: 1, rectangle: 300x400" do
      expect(YourRuby.smallest_rectangle_of_aspect(1.0, [300, 400])).to eq([400, 400])
    end

    it "should work for ratio: 2, rectangle: 300x400" do
      expect(YourRuby.smallest_rectangle_of_aspect(2, [300, 400])).to eq([300, 600])
    end

    it "should work for ratio: 2, rectangle: 300x800" do
      expect(YourRuby.smallest_rectangle_of_aspect(2, [300, 800])).to eq([400, 800])
    end

    it "should work for ratio: 2, rectangle: 400x800" do
      expect(YourRuby.smallest_rectangle_of_aspect(2, [400, 800])).to eq([400, 800])
    end

    it "should work for ratio: 0.5, rectangle: 300x400" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.5, [300, 400])).to eq([800, 400])
    end

    it "should work for ratio: 0.5, rectangle: 300x800" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.5, [300, 800])).to eq([1600, 800])
    end

    it "should work for ratio: 0.5, rectangle: 400x800" do
      expect(YourRuby.smallest_rectangle_of_aspect(0.5, [400, 800])).to eq([1600, 800])
    end
  end

  STD_HOURS = {
    "Mon" => ["09:00", "17:30"],
    "Tue" => ["09:00", "17:30"],
    "Wed" => ["09:00", "17:30"],
    "Thu" => ["09:00", "17:30"],
    "Fri" => ["09:00", "17:00"]
  }

  describe ".parse_time" do
    it "should turn 09:00 into seconds into the day" do
      expect(YourRuby.parse_time("09:00")).to eq(32400)
    end
    it "should turn 17:30 into seconds into the day" do
      expect(YourRuby.parse_time("17:30")).to eq(63000)
    end
  end

  describe ".finish_time_for_day" do
    it "should calculate the closing time from an opening hours hash" do
      expect(YourRuby.finish_time_for_day(Time.mktime(2014, 12, 02, 12), STD_HOURS)).to eq(Time.mktime(2014, 12, 02, 17, 30))
    end
    it "should return false if there are no opening times for the given day" do
      expect(YourRuby.finish_time_for_day(Time.mktime(2014, 12, 06, 12), STD_HOURS)).to eq(false)
    end
  end

  describe ".start_time_for_day" do
    it "should calculate the opening time from an opening hours hash" do
      expect(YourRuby.start_time_for_day(Time.mktime(2014, 12, 02, 10), STD_HOURS)).to eq(Time.mktime(2014, 12, 02, 9, 0))
    end
    it "should return false if there are no opening times for the given day" do
      expect(YourRuby.start_time_for_day(Time.mktime(2014, 12, 06, 10), STD_HOURS)).to eq(false)
    end
  end

  describe ".calculate_completion_time" do
    it "should calculate when my prints will be ready if they take 2 hours to process and I order them at 11:00 on Tuesday" do
      expect(YourRuby.calculate_completion_time(Time.parse("2014-12-02 11:00 UTC"), 2, STD_HOURS)).to eq(Time.parse("2014-12-02 13:00 UTC"))
    end
    it "should calculate when my prints will be ready if they take 2 hours to process and I order them at 16:30 on Friday" do
      expect(YourRuby.calculate_completion_time(Time.parse("2014-12-05 16:30 UTC"), 2, STD_HOURS)).to eq(Time.parse("2014-12-08 10:30 UTC"))
    end
  end

  describe ".duckduckwhy" do
    it "should use Net::HTTP to get the top 5 results for 'whytheluckystiff' from duckduckgo.com" do
      results = YourRuby.duckduckwhy("whytheluckystiff", 5)
      expect(results).not_to be_nil
      expect(results.size).to eq(5)
      expect(results).to include("https://en.wikipedia.org/wiki/Why_the_lucky_stiff")
    end
    it "should use Net::HTTP to get the top 1 results for 'whytheluckystiff' from duckduckgo.com" do
      results = YourRuby.duckduckwhy("whytheluckystiff", 1)
      expect(results).not_to be_nil
      expect(results.size).to eq(1)
      expect(results).to include("https://en.wikipedia.org/wiki/Why_the_lucky_stiff")
    end
  end
end
