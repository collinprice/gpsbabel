# Gpsbabel

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gpsbabel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gpsbabel

## Usage

#### Basic

Convert `gdb` file into a `gpx` file.

	GPSBabel.convert {
		input: {
			format: 'gdb',
			file: '/home/user/gps_data/tracks.gdb'
		}
	}

This example will create a `gpx` file at `/home/user/gps_data/tracks.gpx`.

#### Specify Output

	GPSBabel.convert {
		input: {
			format: 'gdb',
			file: '/home/user/gps_data/tracks.gdb'
		},
		output: {
			format: 'gpx',
			file: '/home/user/gps_data/converted_tracks.gpx'
		}
	}

#### Convert and Extract

Only extract specific GPS data from converted file using `options`. Defaults `waypoints`, `routes`, and `tracks` to `true`.

	GPSBabel.convert {
		input: {
			format: 'gdb',
			file: '/home/user/gps_data/tracks.gdb'
		},
		output: {
			format: 'gpx',
			file: '/home/user/gps_data/converted_tracks.gpx'
		},
		options: {
			waypoints: false,
			routes: false,
			tracks: true
		}
	}

#### GPX Version

Specify which `gpx` version to convert to. Default: `1.1`

	GPSBabel.convert {
		input: {
			format: 'gdb',
			file: '/home/user/gps_data/tracks.gdb'
		},
		output: {
			format: 'gpx',
			gpxver: '1.0'
			file: '/home/user/gps_data/converted_tracks.gpx'
		},
		options: {
			waypoints: false,
			routes: false,
			tracks: true
		}
	}

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gpsbabel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
