Photo = Struct.new(:filename, :location, :date, :index)

def solution(input)
  photos = input.lines(chomp: true).map do |line|
    Photo.new(*line.split(",").map(&:strip))
  end

  photos.group_by(&:location).each_value { |group| assign_indices(group) }

  photos.map do |photo|
    "#{photo.location}#{photo.index}#{File.extname(photo.filename)}"
  end.join("\n")
end

def assign_indices(photo_group)
  digits = photo_group.size.digits.size
  photo_group.sort_by(&:date)
             .each.with_index(1) do |photo, index|
               photo.index = "%0#{digits}d" % index
             end
end
