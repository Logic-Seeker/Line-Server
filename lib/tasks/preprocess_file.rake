namespace :preprocess_file do
  desc "Save lines of the file to database"

  task :save_file_lines, [:filename]  => [:environment] do |t, args|
  	LineNumber.save_file_lines(args.filename)
  	# batch_size = 2000
  	# File.open(args.filename) do |file|
  	# 	file.lazy.each_slice(batch_size) do |lines|
  	# 		byebug
  	# 	end
  	# end
  	# f = File.open(args.filename)
  	# f.each_line do |line|
  	# 	LineNumber.create(content: line)
  	# end
  	# line = ""
  	# f.each_char do |char|
  	# 	if char.match(/\n/)
  	# 		LineNumber.create(content: line)
  	# 		line = ""
  	# 	else
  	# 		line += char
  	# 	end
  	# end
  end

end
