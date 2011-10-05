# feeder

[![Build Status](https://secure.travis-ci.org/AlSquire/feeder.png)](http://travis-ci.org/AlSquire/feeder)

There is this site, goodanime.net, which I keep an eye on for new anime episodes and annoyingly doesn't provide an RSS stream.
So I made this little ruby app, using [nokogiri](https://github.com/tenderlove/nokogiri) to parse their HTML front page and [sinatra](https://github.com/sinatra/sinatra) to serve the RSS, and I deployed it to [Heroku](http://heroku.com).

There is very little code, no persistance (I let the RSS client do that). Not a very interesting app unless you have the exact same need, or if you just want a sinatra setup with guard-test/travis.