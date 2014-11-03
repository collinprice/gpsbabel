require 'spec_helper'

describe GPSBabel do
	let(:unable_open_input) {{
								 input: {
									 format: 'gdb',
									 file: File.join(File.dirname(__FILE__), "gps_files", "missing.gdb")
								 }
	}}
	let(:missing_attributes) {{
								input: {
									format: 'gdb'
								}
	}}
	let(:input_only_attributes) {{
									 input: {
										 format: 'gdb',
										 file: File.join(File.dirname(__FILE__), "gps_files", "test.gdb")
									 }
	}}
	let(:io_attritubes) {{
							 input: {
								 format: 'gdb',
								 file: File.join(File.dirname(__FILE__), "gps_files", "test.gdb")
							 },
							 output: {
								 format: 'gpx',
								 file: File.join(File.dirname(__FILE__), "gps_files", "test2.gpx")
							 }
	}}
	let(:advanced_attributes) {{
								 input: {
									 format: 'gdb',
									 file: File.join(File.dirname(__FILE__), "gps_files", "test.gdb")
								 },
								 output: {
									 format: 'gpx',
									 gpxver: '1.0',
									 file: File.join(File.dirname(__FILE__), "gps_files", "test3.gpx")
								 },
								 options: {
									 waypoints: true,
									 routes: true,
									 tracks: true
								 }
	}}

	describe '.convert unable_open_input' do
		it 'FileNotFoundException' do
			expect { subject.convert unable_open_input }.to raise_exception
		end
	end

	describe '.convert missing_attributes' do
		it 'MissingAttributesException' do
			expect { subject.convert unable_open_input }.to raise_exception
		end
	end

	describe '.convert input_only_attributes' do
		it 'returns path to converted file' do
			expect(subject.convert input_only_attributes).to eq(File.join(File.dirname(__FILE__), "gps_files", "test.gpx"))
			File.delete File.join(File.dirname(__FILE__), "gps_files", "test.gpx")
		end
	end

	describe '.convert io_attritubes' do
		it 'returns path to converted file' do
			expect(subject.convert io_attritubes).to eq(io_attritubes[:output][:file])
			File.delete io_attritubes[:output][:file]
		end
	end

	describe '.convert advanced_attributes' do
		it 'returns path to converted file' do
			expect(subject.convert advanced_attributes).to eq(advanced_attributes[:output][:file])
			File.delete advanced_attributes[:output][:file]
		end
	end
end
