Photo = Struct.new(:filename, :location, :date)

def solution(input)
  photos = input.lines(chomp: true).map do |line|
    Photo.new(*line.split(",").map(&:strip))
  end

  grouped_photos = photos.group_by(&:location)
                         .transform_values { |photos| photos.sort_by(&:date) }

  photos.map do |photo|
    leading_zeros = grouped_photos[photo.location].size.digits.size
    index = grouped_photos[photo.location].index(photo) + 1
    index = "%0#{leading_zeros}d" % index

    "#{photo.location}#{index}#{File.extname(photo.filename)}"
  end.join("\n")
end
