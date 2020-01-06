require 'rspec'
require 'song'
require 'album'
require 'pry'
require('spec_helper')

describe '#Song' do
#
  before(:each) do
    Album.clear()
    Song.clear()
    @album = Album.new({:name => "Giant Steps", id: nil })
    @album.save()
  end
#
  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      song = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
      song2 = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
      expect(song).to(eq(song2))
    end
  end

  describe('.all') do
    it("returns a list of all songs") do
      song = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
      song.save()
      song2 = Song.new({:name => "Toast", :album_id => @album.id, id: nil })
      song2.save()
      expect(Song.all).to(eq([song, song2]))
    end
  end
#
describe('.sorted_songs') do
  it("returns a list of all songs") do
    song = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
    song.save()
    song2 = Song.new({:name => "Toast", :album_id => @album.id, id: nil })
    song2.save()
    song3 = Song.new({:name => "Apple", :album_id => @album.id, id: nil })
    song3.save()
    song4 = Song.new({:name => "Boots", :album_id => @album.id, id: nil })
    song4.save()
    expect(Song.sorted_songs).to(eq([song3, song4, song, song2 ]))
  end
end

  describe('.clear') do
    it("clears all songs") do
      song = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
      song.save()
      song2 = Song.new({:name => "Toast", :album_id => @album.id, id: nil })
      song2.save()
      Song.clear()
      expect(Song.all).to(eq([]))
    end
  end
#
  describe('#save') do
    it("saves a song") do
      song = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
      song.save()
      expect(Song.all).to(eq([song]))
    end
  end
#
  describe('.find') do
    it("finds a song by id") do
      song = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
      song.save()
      song2 = Song.new({:name => "Naima", :album_id => @album.id, id: nil })
      song2.save()
      expect(Song.find(song.id)).to(eq(song))
    end
  end

  describe('#update') do
    it("updates an song by id") do
      song = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
      song.save()
      song.update("Mr. P.C.", @album.id)
      expect(song.name).to(eq("Mr. P.C."))
    end
  end
#
  describe('#delete') do
    it("deletes an song by id") do
      song = Song.new({:name => "Giant Steps", :album_id => @album.id, id: nil })
      song.save()
      song2 = Song.new({:name => "Naima", :album_id => @album.id, id: nil })
      song2.save()
      song.delete()
      expect(Song.all).to(eq([song2]))
    end
  end
end
