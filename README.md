# Photo organizer

This repository contains a small Ruby method to organize a list of photos. It receives a list of photo file names along with the location the photo was taken and the date. It outputs a new list with the photos renamed chronologically for each localtion.

Example input:

```
thebean.jpg, Chicago, 2022-11-23 13:00:00
DCIM_1234-10.png, Chicago, 2022-11-23 13:00:01
centralpark.png, New York, 2022-11-22 13:00:30
photo.jpeg, New York, 2022-11-22 13:00:00
```
will produce the following output

```
Chicago1.jpg
Chicago2.png
New York2.png
New York1.jpeg
```

## Usage

Import the `photo_organizer.rb` file and call the `solution` method:

```ruby
require "./lib/photo_organizer.rb"

input = <<~TEXT
  thebean.jpg, Chicago, 2022-11-23 13:00:00
  DCIM_1234-10.png, Chicago, 2022-11-23 13:00:01
  centralpark.png, New York, 2022-11-22 13:00:30
  photo.jpeg, New York, 2022-11-22 13:00:00
TEXT

solution(input)
```

Alternatively, you can use the following command:

```
ruby bin/photo_organizer.rb
```

Enter the photo information list and press `CTRL+D` to get the result.

## Test

The tests in this project have been written using the `minitest` gem, which was chosen for simplicity.
To run the automated tests:

```
bundle
ruby test/photo_organizer.rb
```
