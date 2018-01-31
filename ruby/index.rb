#!/usr/bin/env ruby

app_root = File.expand_path File.dirname("../")
input_filename = ARGV[0]
filename_without_extension = input_filename.split('.').first
corrected_file =  File.new(File.join(app_root, "#{ filename_without_extension }_corrected.txt"), 'w')

p 'Please, enter space-separated invalid positions:'
STDOUT.flush
invalid_positions = STDIN.gets.chomp

p 'Removing invalid positions...'

File.open(File.join app_root, input_filename) do |source|
  source.each_line do |line|
    position = line.split(',').first

    unless invalid_positions.split.include? position
      corrected_file << line
    end
  end
end

p 'Removed positions: ' + invalid_positions
