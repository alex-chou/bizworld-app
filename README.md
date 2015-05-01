BizWorld: Assessment Platform
===
* BizWorld First Interview Video: http://youtu.be/86k3TqS-VzA
* BizWorld Heroku App: https://bizworld-app.herokuapp.com
* BizWorld TravisCI: https://travis-ci.org/cs169-bizworld/bizworld-app

## To setup rails app
Run ```cd . && bin/setup``` from project root to set things up.

## TravisCI
### Travis Configurations
* Travis configuration file is [here](.travis.yml)
* Travis Gemfile is [here](Gemfile-travis)
* Currently runs [migrations](db/migrate), [cucumber](features) and [rspec](spec) tests
