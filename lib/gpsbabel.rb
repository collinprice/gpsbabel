require "gpsbabel/version"
require "cliver"

module GPSBabel

	class FileNotFoundException < Exception; end
	class MissingAttributesException < Exception; end

	def self.convert attributes

		# Check valid input attributes are there
		unless (attributes.is_a? Hash) &&
				(attributes.has_key? :input) &&
				(attributes[:input].has_key? :format) &&
				(attributes[:input].has_key? :file)
			raise MissingAttributesException.new "Missing attributes"
		end

		# Merge options
		options = {
			waypoints: true,
			routes: true,
			tracks: true,
			gpsbabel: 'gpsbabel'
		}
		if attributes.has_key? :options
			options.merge! attributes[:options]
		end

		# Ensure gpsbabel command-line application is installed.
		Cliver.detect! options[:gpsbabel]

		# Check input file exists
		unless File.exists? attributes[:input][:file]
			raise FileNotFoundException.new "Unable to open #{attributes[:input][:file]}"
		end

		# Merge output
		output = {
			format: 'gpx',
			gpxver: '1.1',
			file: File.join(File.dirname(attributes[:input][:file]), File.basename(attributes[:input][:file], File.extname(attributes[:input][:file])) + ".gpx")
		}
		if attributes.has_key? :output
			output.merge! attributes[:output]
		end

		# Build gpsbabel command
		cmd = options[:gpsbabel]

		if options[:waypoints]
			cmd << " -w"
		end
		if options[:tracks]
			cmd << " -t"
		end
		if options[:routes]
			cmd << " -r"
		end

		cmd << " -i #{attributes[:input][:format]} -f #{attributes[:input][:file]}"
		cmd << " -o #{output[:format]}"
		if output[:format] == 'gpx'
			cmd << ",gpxver=#{output[:gpxver]}"
		end
		cmd << " -F #{output[:file]}"

		if system cmd
			output[:file]
		else
			false
		end
	end
end
