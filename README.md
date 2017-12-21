* Ruby version
	Ruby 2.4.0


Questions:

How does your system work? (if not addressed in comments in source)
	My system assumes that the ruby is already installed and goes on to install bundler and install all the required gems for the system when running build script. Database migration is also done here.
	Run script takes one argument which is the file full path if exist in different location or just the name if it is on the same location. We are aslo resetting the database for new file to serve. Rake task is called which is responsible for saving each line using activerecord-import gem for batch insert which greatly improved performance.
	And finally rails server is started.

	Now we can get the individual line by visiting http://localhost:3000/lines/[:line_number]

How will your system perform with a 1 GB file? a 10 GB file? a 100 GB file?
	Initially the performace for preprocessing was very bad as i was making insert for each line.
	I switched to batch read and insert which improved the performace and the records are by default indexed by primary key which is log(n) search time. So can handle the get request for even large file size easily. 
	https://www.speedshop.co/2015/07/29/scaling-ruby-apps-to-1000-rpm.html

How will your system perform with 100 users? 10000 users? 1000000 users?
	Rails use Puma as a default server which boost it's performance as it uses thread to handle request. We can however increse the dynos in the heroku or any other server to boosts it's performance.


What documentation, websites, papers, etc did you consult in doing this assignment?
	I followed many tips and tricks found in stack overflow and github repo to complete this assigment. I got general concept as i progressed and search for gem such as activerecord-import to greatly improve the preprossing of the file.

What third-party libraries or other tools does the system use? How did you choose each library or framework you used?
	I used maily Ruby on Rails to complete this assignment and gem activerecord-import.
	I went with Rails as i felt comfortable with it's implementation and activerecord-import do perform batch insert.

How long did you spend on this exercise? If you had unlimited more time to spend on this, how would you spend it and how 
would you prioritize each item?
	I spend about 6-7 hours in total. I would definitely make it more reuseable cause the system reset the database for each file provided. I would also maybe switch to sinatra if the system does not have any other functionalities besides this which is lighter version. I would definitely have complete test coverage.

If you were to critique your code, what would you have to say about it?
	It lacks test and maybe have some measure to stop resetting databse all the time even for the same file.
