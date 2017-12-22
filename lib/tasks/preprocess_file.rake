namespace :preprocess_file do
  desc "Save lines of the file to database"

  task :save_file_lines, [:filename]  => [:environment] do |t, args|
    
    #option 1
  	# LineNumber.save_file_lines(args.filename)
  	

    #option 2
    redis = Redis::Namespace.new("line_server", :redis => Redis.new)
    if redis.keys.any?
      redis.del(redis.keys)
    end
    file = File.open(args.filename)
    file.each_line.with_index(1) do |line,index|
      redis.set(index,line.chomp)
    end
    

  end
end
