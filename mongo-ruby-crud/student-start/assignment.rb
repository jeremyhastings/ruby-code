require 'mongo'
require 'json'
require 'pp'
require 'byebug'
Mongo::Logger.logger.level = ::Logger::INFO
#Mongo::Logger.logger.level = ::Logger::DEBUG

class Solution
  MONGO_URL='mongodb://localhost:27017'
  MONGO_DATABASE='test'
  RACE_COLLECTION='race1'

  # helper function to obtain connection to server and set connection to use specific DB
  # set environment variables MONGO_URL and MONGO_DATABASE to alternate values if not
  # using the default.
  def self.mongo_client
    url=ENV['MONGO_URL'] ||= MONGO_URL
    database=ENV['MONGO_DATABASE'] ||= MONGO_DATABASE 
    db = Mongo::Client.new(url)
    @@db=db.use(database)
  end

  # helper method to obtain collection used to make race results. set environment
  # variable RACE_COLLECTION to alternate value if not using the default.
  def self.collection
    collection=ENV['RACE_COLLECTION'] ||= RACE_COLLECTION
    return mongo_client[collection]
  end
  
  # helper method that will load a file and return a parsed JSON document as a hash
  def self.load_hash(file_path) 
    file=File.read(file_path)
    JSON.parse(file)
  end

  # initialization method to get reference to the collection for instance methods to use
  def initialize
    @coll=self.class.collection
  end

  #
  # Lecture 1: Create
  #

  def clear_collection
    Solution.collection.delete_many
  end

  def load_collection(file_path) 
    file = Solution.load_hash(file_path)
    Solution.collection.insert_many(file)
  end

  def insert(race_result)
    Solution.collection.insert_one(race_result)
  end

  #
  # Lecture 2: Find By Prototype
  #

  def all(prototype={})
    Solution.collection.find(prototype)
  end

  def find_by_name(fname, lname)
    Solution.collection.find(:first_name => "#{fname}", :last_name => "#{lname}")
        .projection(first_name:true, last_name:true, number:true, _id:false)
  end

  #
  # Lecture 3: Paging
  #

  def find_group_results(group, offset, limit) 
    Solution.collection.find(:group => "#{group}")
        .projection(group:false, _id:false)
        .sort({:secs => 1})
        .skip(offset)
        .limit(limit)
  end

  #
  # Lecture 4: Find By Criteria
  #

  def find_between(min, max) 
    Solution.collection.find(:secs => { :$gt => min, :$lt => max })
  end

  def find_by_letter(letter, offset, limit) 
    Solution.collection.find(:last_name => { :$regex => "^#{letter}.+"})
        .sort({ :last_name => 1 })
        .skip(offset)
        .limit(limit)
  end

  #
  # Lecture 5: Updates
  #
  
  def update_racer(racer)
    Solution.collection.find(:_id => racer["_id"])
        .replace_one(:_id => racer["_id"],
                     :number => racer["number"],
                     :first_name => racer["first_name"],
                     :last_name => racer["last_name"],
                     :gender => racer["gender"],
                     :group => racer["group"],
                     :secs => racer["secs"]
        )
  end

  def add_time(number, secs)
    Solution.collection.find(:number => number)
        .update_one(:$inc => { secs:secs })
  end

end

s=Solution.new
race1=Solution.collection
