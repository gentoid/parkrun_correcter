# frozen_string_literal: true

file = Pathname.pwd / 'parkrun_barcode.txt'

file
  .readlines
  .map(&:chomp)
  .map { |line| line.split(',') }
  .each_with_object({}) { |(a, p, time), memo| memo[p[1..-1].to_i] = { athletee: a, position: p, time: time } }
  .sort_by { |k, _v| k }
  .each_with_object([]) { |(_k, data), memo| new_position = memo.count + 1; data[:position] = "P#{ new_position.to_s.rjust(4, '0') }"; memo.push data }
  .sort_by { |line| line[:time] }
  .map { |line| "#{ line[:athletee] },#{ line[:position] },#{ line[:time] }" }

new_file = Pathname.pwd / 'corrected.txt'
new_file.write corrected.join("\r\n")
