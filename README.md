# ChatEngine
Chat Engine for real time chat between users

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'chat_engine'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install chat_engine
```
then run
```bash
$ rails g chat_engine:install
```
for generating channel javascript
```bash
$ rails g chat_engine:channels
```
after generating channels do the following
Add toastr to application.css and application.js:

*= require toastr in application.css

//= require toastr in application.js


add following association in your user model
```bash
  has_many :chat_subscribers, as: :subscriber, class_name: 'ChatEngine::ChatSubscriber'
  has_many :chats, through: :chat_subscribers, class_name: 'ChatEngine::Chat'
  has_many :messages, as: :sender, class_name: 'ChatEngine::Message'
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
