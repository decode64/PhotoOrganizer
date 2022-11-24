require "minitest/autorun"
require "date"
require_relative "../lib/photo_organizer"

class PhotoOrganizerTest < Minitest::Test
  def test_basic
    input = <<~TEXT
      photo.jpg, Krakow, 2013-09-05 14:08:15
      Mike.png, London, 2015-06-20 15:13:22
      myFriends.png, Krakow, 2013-09-05 14:07:13
      Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02
      pisatower.jpg, Florianopolis, 2015-07-22 23:59:59
      BOB.jpg, London, 2015-08-05 00:02:03
      notredame.png, Florianopolis, 2015-09-01 12:00:00
      me.jpg, Krakow, 2013-09-06 15:40:22
      a.png, Krakow, 2016-02-13 13:33:50
      b.jpg, Krakow, 2016-01-02 15:12:22
      c.jpg, Krakow, 2016-01-02 14:34:30
      d.jpg, Krakow, 2016-01-02 15:15:01
      e.png, Krakow, 2016-01-02 09:49:09
      f.png, Krakow, 2016-01-02 10:55:32
      g.jpg, Krakow, 2016-02-29 22:13:11
    TEXT

    expected_result = <<~TEXT.chomp
      Krakow02.jpg
      London1.png
      Krakow01.png
      Florianopolis2.jpg
      Florianopolis1.jpg
      London2.jpg
      Florianopolis3.png
      Krakow03.jpg
      Krakow09.png
      Krakow07.jpg
      Krakow06.jpg
      Krakow08.jpg
      Krakow04.png
      Krakow05.png
      Krakow10.jpg
    TEXT

    assert solution(input) == expected_result
  end

  def test_output_no_leading_zeros
    now = DateTime.now
    date_format = "%Y-%m-%d %H:%M:%S"
    expected_result = []
    input = ""

    (1..9).each do |n|
      input << "photo.jpg, Oklahoma City, #{(now - (n/1440.0)).strftime(date_format)}\n"
      expected_result << "Oklahoma City#{n}.jpg"
    end

    assert solution(input) == expected_result.reverse.join("\n")
  end

  def test_output_one_leading_zero
    now = DateTime.now
    date_format = "%Y-%m-%d %H:%M:%S"
    expected_result = []
    input = ""

    (1..10).each do |n|
      input << "photo.jpg, Oklahoma City, #{(now - (n/1440.0)).strftime(date_format)}\n"
      expected_result << "Oklahoma City#{'%02d' % n}.jpg"
    end

    assert solution(input) == expected_result.reverse.join("\n")
  end

  def test_output_two_leading_zeros
    now = DateTime.now
    date_format = "%Y-%m-%d %H:%M:%S"
    expected_result = []
    input = ""

    (1..100).each do |n|
      input << "photo.jpg, Curitiba, #{(now - (n/1440.0)).strftime(date_format)}\n"
      expected_result << "Curitiba#{'%03d' % n}.jpg"
    end

    assert solution(input) == expected_result.reverse.join("\n")
  end

  def test_output_file_extensions
    input = <<~TEXT
      photo.jpg, Chicago, 2022-11-23 13:00:00
      photo, Chicago, 2022-11-23 13:00:01
      DCIM_1234-10.png, New York, 2022-11-22 13:00:30
      photo.jpeg, New York, 2022-11-22 13:00:00
    TEXT

    expected_result = <<~TEXT.chomp
      Chicago1.jpg
      Chicago2
      New York2.png
      New York1.jpeg
    TEXT

    assert solution(input) == expected_result
  end
end
