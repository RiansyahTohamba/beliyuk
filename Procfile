web: bin/rails server
#disable comment on gemfile and config/application.rb for sidekiq
#and feature send email on order_controller
mailWorker: bundle exec sidekiq -c 1 -q default -q mailers
