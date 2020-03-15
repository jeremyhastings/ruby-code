############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Jukebox
#  Date:         May 3rd, 2019
#  Class:        CIS 283 - PROGRAMMING PRINCIPLES II
#  Description:  Create a jukebox object that can store song
#  objects.
#
############################################################

class JukeBox

  attr_reader :track_listing

  def initialize
    @track_listing = []
  end

  def add_track ( track )
    @track_listing.push( track )
    return "Track Added"
  end

  def does_track_exist ( track )

    if ( track == 0 )
      return false
    elsif ( self.track_listing[track - 1] == nil )
      return false
    else
      return true
    end

  end

  def short_list
    # Counter for track number
    track_counter = 1

    # Track List Array
    track_list = []
    # look through track listings in jukebox
    @track_listing.each do |item|
      # Call print song details method in song object.
      track_list.push ( "Track #{track_counter}. #{item.song_title}" )

      # Forward the track listing one
      track_counter += 1
    end

    return track_list
  end

  def delete_track ( track )

      self.track_listing.delete_at(track - 1)
      return "Deleted"

  end

  def play_track ( track )

    return self.track_listing[track - 1].play_song

  end

  def update_track ( track, title, artist, album, year, comments, length )

    self.track_listing[track - 1].song_title = title
    self.track_listing[track - 1].song_artist = artist
    self.track_listing[track - 1].song_album = album
    self.track_listing[track - 1].song_year = year
    self.track_listing[track - 1].song_comments = comments
    self.track_listing[track - 1].song_length = length
    return "Track Updated"

  end

  def list_tracks

    # Counter for track number
    track_counter = 1

    # Track List Array
    track_list = []
    # look through track listings in jukebox
    @track_listing.each do |item|
      # Call print song details method in song object.
      track_list.push ( "Track #{track_counter}. #{item.print_song_details}\n" )
      # puts

      # Forward the track listing one
      track_counter += 1
    end

    return track_list

  end

  def list_tracks_longer_than ( length_of_song )

    # Counter for track number
    track_counter = 1

    # Track List Array
    songs_that_are_long = []

    # look through track listings in jukebox
    @track_listing.each do |item|

      if ( item.song_length.to_i >= length_of_song )

        # Put all tracks above desired length into an array
        songs_that_are_long.push ( "Track #{track_counter}. #{item.print_song_details}\n")

      end

      # Forward the track listing one
      track_counter += 1

    end

    return songs_that_are_long

  end

  def list_tracks_by_author ( author )

    # Counter for track number
    track_counter = 1
    puts

    # Track List Array
    songs_that_are_by = []

    # look through track listings in jukebox
    @track_listing.each do |item|

      if ( item.song_artist == author )
        # # Call print song details method in song object.
        # puts "Track #{track_counter}. #{item.print_song_details}"
        # puts
        # Put all tracks above desired length into an array
        songs_that_are_by.push ( "Track #{track_counter}. #{item.print_song_details}\n")
      end

      # Forward the track listing one
      track_counter += 1
    end

    return songs_that_are_by

  end

end