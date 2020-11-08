require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end  

  def files 
    @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    # files called by #import returns array, converts file paths to string, then removes the path name gibberish
  end

  def import
    self.files.collect {|file| Song.new_by_filename(file)}
  end  


end
