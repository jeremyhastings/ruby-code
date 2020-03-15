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

class Song

  attr_accessor :song_title, :song_artist, :song_album, :song_year, :song_comments, :song_length

  def initialize ( song_title, song_artist, song_album, song_year, song_comments, song_length )
    @song_title = song_title
    @song_artist = song_artist
    @song_album = song_album
    @song_year = song_year
    @song_comments = song_comments
    @song_length = song_length
  end

  def print_song_details
    return "\nTitle: #{@song_title}\nArtist: #{@song_artist}\nAlbum: #{@song_album}\n" +
        "Year: #{@song_year}\nComments: #{@song_comments}\nLength: #{@song_length}"
  end

  def play_song
    return "\n #{@song_title} is playing and wow ... it is amazing"
  end

  def to_tab
    return "#{@song_title}\t#{@song_artist}\t#{@song_album}\t#{@song_year}\t#{@song_comments}\t#{@song_length}"
  end

end