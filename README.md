# Turing Scavenger Hunt

This application was created for the use of Turing School Software and Design. Each cohort would
go on a scavenger hunt on the second day of school as a team building exercise. This tradition has since been retired.

The way the application works:

* The admin chooses how many teams will be participating, and enters a telephone number for each team.

* Each team then gets a text message prompting them to enter their team name and gives them a link to their team page where they
will see their first clue.

* The team has to go to the location described in the clue, take a picture and upload it to their page. The admin can then accept it
or deny it. If accepted they will get the next clue, if not accepted they will be prompted to try again.

* The admin can end the hunt at any time and call all teams back to base for a taco bar.

The thing I like most about this application is that it uses websockets that listen for change events so the admin never has
to refresh their page to see a submission and the teams will see the response to their submission the instant the admin clicks accept or reject.
