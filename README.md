# feeder

[![Build Status](https://secure.travis-ci.org/AlSquire/feeder.png)](http://travis-ci.org/AlSquire/feeder)

There is this site, [goodanime.net](http://www.goodanime.net), which I keep an eye on for new anime episodes and annoyingly doesn't provide an RSS stream.
So I made this little ruby app, using [nokogiri](https://github.com/tenderlove/nokogiri) to parse their HTML front page and [sinatra](https://github.com/sinatra/sinatra) to serve the RSS, then deployed it to [Heroku](http://heroku.com).

There is very little code, it's just HTML parsing, there is no persistence (I let the RSS client do that). Not a very interesting app unless you have the same kind of need, or if you just want a sinatra setup with [guard-minitest](https://github.com/guard/guard-minitest) / [travis-ci](http://travis-ci.org/AlSquire/feeder).