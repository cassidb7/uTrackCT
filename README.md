# README
This app uses faktory for background jobs. This can be run via a docker container by using the following command

docker run --rm -it -p 127.0.0.1:7419:7419 -p 127.0.0.1:7420:7420 contribsys/faktory:latest

in a seperate tab to get the faktory_ruby_worker started fun the following command

bundle exec faktory-worker -q tag_generation -q url_shortener

To connect to the url shortening service it uses Firebase Dynamic Links and as such needs an api key.

The api key has been attached to the email and to add it to the applicaion run the command

bin/rails credentials:edit

and add the key in the following format:

firebase:
  api_key: "API_KEY"


Unfortunately I was unable to complete the final part of the exercise due to time constraints.
