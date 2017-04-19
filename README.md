# README

# Setting up a Rails app
http://railsapps.github.io/installrubyonrails-mac.html
http://guides.rubyonrails.org/getting_started.html

# RVM
https://rvm.io/rvm/basics

rvm list


# Deploying your app to heroku
https://www.codecademy.com/articles/deploy-rails-to-heroku

# Generate your rspec specs:
rails generate rspec:integration projects

Running via Spring preloader in process 58507
      create  spec/requests/projects_spec.rb



#  Web URL:

https://tcasemgt.herokuapp.com/
http://www.mattboldt.com/heroku-staging-production-environments/
http://railsapps.github.io/rails-heroku-tutorial.html

# NEXT
# seeds
http://edgeguides.rubyonrails.org/active_record_migrations.html

## Testing in Rails
http://guides.rubyonrails.org/testing.html

# minitest framework vs Rspec


## Env: Staging, Dev , Prod
http://emaxime.com/2014/adding-a-staging-environment-to-rails.html
https://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html


# staging vs prod environment

git push production master

git push staging master

$ heroku config:set RAILS_ENV=staging --remote staging
$ heroku config:set RACK_ENV=staging --remote staging

heroku run rake db:migrate --remote staging
heroku run rake db:migrate --remote production

heroku restart app --remote staging

# reset postgre db on Staging and load db again
heroku pg:reset DATABASE --remote staging
heroku run rake db:migrate --remote staging


## RSpec
http://www.relishapp.com/
http://betterspecs.org/
https://everydayrails.com/2012/03/12/testing-series-rspec-setup.html
https://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html
https://robots.thoughtbot.com/how-we-test-rails-applications
https://robots.thoughtbot.com/rspec-integration-tests-with-capybara
https://www.sitepoint.com/learn-the-first-best-practices-for-rails-and-rspec/

http://betterspecs.org/

## vcr and Webmock - external API
http://asquera.de/blog/2015-03-30/testing-external-apis-in-ruby/
http://effectif.com/ruby/manor/faking-http-requests-during-testing
http://blog.carbonfive.com/2012/03/18/how-to-test-external-apis/

https://labs.kollegorna.se/blog/2015/04/build-an-api-now/
http://matthewlehner.net/rails-api-testing-guidelines/


## Wrapping API into a Gem
https://blog.engineyard.com/2014/wrapping-your-api-in-a-ruby-gem
https://gregmoreno.wordpress.com/2012/06/07/how-to-create-a-wrapper-gem-for-service-apis-part-1/


## Cucumber
https://watirmelon.blog/2011/01/21/my-simple-cucumber-watir-page-object-pattern-framework/
http://anthonyeden.com/2013/07/10/testing-rest-apis-with-cucumber-and-rack.html
http://www.baeldung.com/cucumber-rest-api-testing
http://gregbee.ch/blog/effective-api-testing-with-cucumber
http://www.baeldung.com/cucumber-rest-api-testing
https://wiki.jenkins-ci.org/display/JENKINS/Cucumber+Reports+Plugin



# BEST Cucumber so far for env.:
http://stackoverflow.com/questions/25649848/running-cucumber-tests-on-different-environments


## Coverage using SimpleCov
gem 'simplecov', :require => false


## Continuous Integration
https://wiki.jenkins-ci.org/display/JENKINS/Cucumber+Reports+Plugin

## Gem for REST api
## Mock Server for API Integration Testing
## Webmock
https://robots.thoughtbot.com/how-to-stub-external-services-in-tests
