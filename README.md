# Server status app [![Build Status](https://secure.travis-ci.org/seanhandley/server_status.png)](http://travis-ci.org/seanhandley/server_status)

A status application to show current live issues, planned maintenance and past resolved events.

Live testing area here: [http://mbserverstatus.heroku.com/](http://mbserverstatus.heroku.com/)

* To get going:

    `$ bundle install`

    `$ rake db:create`

    `$ rake db:migrate`

    `$ rake db:seed`

* To run tests:

    `$ rake db:test:prepare`

    `$ rspec spec`

* Default username and password is 'melbourne_support' and 'password'.
* Simplecov is used to output coverage
