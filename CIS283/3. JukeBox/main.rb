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

# Make song and jukebox class available to main.rb
require "./song.rb"
require "./jukebox.rb"

# Declare a new jukebox object
my_jukebox = JukeBox.new()

# Opens song.text file as song_list_file
song_list_file = File.open("songs.txt")

# Processes song_list_file until the end of the file is reached
until song_list_file.eof?

  # Processes each line into the song_list_array
  song_list_array = song_list_file.gets.chomp.split(/\t/)

  # transforms the song list array into a song object through the miracle of technicolor ...
  temp_song = Song.new(song_list_array[0], song_list_array[1], song_list_array[2],
                       song_list_array[3], song_list_array[4], song_list_array[5])

  # add song object to track listing array in my_jukebox object
  my_jukebox.add_track (temp_song)

end

# Closes the Song List File
song_list_file.close

# Prints Menu
def menu
  puts
  puts "1. Show all songs longer than specific length"
  puts "2. Show all songs written by a specific author"
  puts "3. Play song"
  puts "4. Add new song"
  puts "5. Delete song"
  puts "6. Update song"
  puts "7. Show all songs"
  puts "8. Quit"
  puts
  print"Please enter your menu selection: "
  return gets.to_i
end

# Displays Track Lists Received from JukeBox
def print_song_list ( songs_to_print )

  # Print Tracks
  songs_to_print.each do |item|
    print item
    puts
  end

end

# Gathers Song Information
def gather_information

  # Gather information song
  print "Enter Song Title: "
  temp_title = gets.chomp
  print "Enter Song Artist: "
  temp_artist = gets.chomp
  print "Enter Song Album: "
  temp_album = gets.chomp
  print "Enter Song Year: "
  temp_year = gets.chomp.to_i
  print "Enter Song Comments: "
  temp_comments = gets.chomp
  print "Enter Song Length (in seconds): "
  temp_length = gets.chomp.to_i

  # Create New Song Object
  temp_song = Song.new( temp_title, temp_artist, temp_album, temp_year, temp_comments, temp_length )

  # Return Song Information
  return temp_song

end

# Saves Track List and Says Goodbye
def shut_down ( file_to_save = "songs.txt", info_to_save )

  song_file = File.open("#{file_to_save}", "w")

  info_to_save.each do | item |
    song_file.puts "#{item.to_tab}"
  end

  puts
  puts "Your Information was Saved."
  puts
  puts "Farewell"

  song_file.close

end

# Declare while loop exit variable
user_selection = 0

# Main while loop for program
until user_selection == 8

user_selection = menu()

  if ( user_selection == 1)

    # Ask user for track length in seconds
    puts
    print "How long of a song are you looking for (in seconds)? "

    # Convert answer from string to integer
    desired_song_length = gets.chomp
    puts

    # Test if it is an integer, if it is execute request
    if ( desired_song_length.match(/^(\d)+$/) )

      # Grab track list from JukeBox
      song_list = my_jukebox.list_tracks_longer_than (desired_song_length.to_i)

      # Print song_list
      print_song_list( song_list )

    else
      puts
      puts "Please enter an integer"
    end

  end

  if ( user_selection == 2)

    # Ask user for song artist
    puts
    print "What song artist are you looking for? "

    # Convert answer from string to integer
    desired_song_author = gets.chomp

    # Grab track list from Jukebox
    song_list = my_jukebox.list_tracks_by_author ( desired_song_author )

    # If array is empty, there are no artists by that name
    # otherwise print the returned array
    if ( song_list == [] )
      puts "No Track by that Artist"
    else
      print_song_list( song_list )
    end

  end

  if ( user_selection == 3 )

    puts
    print_song_list ( my_jukebox.short_list )
    puts
    puts "What track did you want to listen to? "

    track_selection = gets.to_i
    if (my_jukebox.does_track_exist ( track_selection ))
      puts
      puts my_jukebox.play_track( track_selection )
    else
      puts
      puts "Track Does Not Exist"
    end

  end

  if ( user_selection == 4)

    song_to_add = gather_information()
    # Add song to Jukebox Track Listing
    puts
    puts my_jukebox.add_track( song_to_add )

  end

  if ( user_selection == 5 )

    puts
    print_song_list ( my_jukebox.short_list )
    puts
    print "What track do you want to delete? "

    # Convert answer from string to integer
    song_to_delete = gets.to_i

    if (my_jukebox.does_track_exist ( song_to_delete ))
      puts
      puts my_jukebox.delete_track ( song_to_delete )
    else
      puts
      puts "Track Does Not Exist"
    end

  end

  if ( user_selection == 6)

    # Ask user for track to update
    puts
    print_song_list ( my_jukebox.short_list )
    puts
    print "What track do you want to update? "
    song_to_update = gets.to_i

    if (my_jukebox.does_track_exist ( song_to_update ))
      updated_song = gather_information()

      # Add song to Jukebox Track Listing
      puts
      puts my_jukebox.update_track( song_to_update, updated_song.song_title,
                                    updated_song.song_artist, updated_song.song_album,
                                    updated_song.song_year, updated_song.song_comments,
                                    updated_song.song_length )
    else
      puts
      puts "Track Does Not Exist"
    end

  end

  if (user_selection == 7)

    puts
    print_song_list ( my_jukebox.list_tracks )

  end

  if ( user_selection == 8)

    list_of_tracks = my_jukebox.track_listing

    shut_down( list_of_tracks )

  end

end