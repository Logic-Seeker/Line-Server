class LineNumber < ApplicationRecord

	def self.save_file_lines(filename)
		batch_size = 2000
		columns = [:content]
  	File.open(filename) do |file|
  		file.lazy.each_slice(batch_size) do |lines|
  			values = lines.split(/\n/).flatten.each_slice(1).to_a
  			LineNumber.import columns, values
  		end
  	end
		
	end
end
