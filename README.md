# Purpose

To import your facebook messages (downloaded via the [Download Your Information](https://www.facebook.com/settings?tab=your_facebook_information) facebook feature)
and explore the data.
 
 ![Stats](https://i.imgur.com/UVb8V1y.png)

## Status

This is very much a work in progress, and is not intended for public consumption. 
Setup requires some knowledge of Ruby on Rails, and I can't vouch for the quality of the code!

There's a very real chance facebook will change the schema of their message json files which may break the import feature.

## Setup

Assuming you already have Ruby installed (preferably via rbenv):

```bash
git clone git@github.com:Obversity/fbmessages.git
cd fbmessages
bundle
rails db:create
rails db:migrate
rails server
``` 

Hopefully this should get your rails server running.

## Usage

Open your rails console and import a conversation.

```ruby
# grab the path to the json file you wish to load
path = "~/Downloads/facebook_data/messages/inbox/IlseMartinez__oZTkl76Kw/message.json"
MessageImporter.new(path).import
```

This may take a very long time, as it's currently written to be safe to run multiple times, using `find_or_initialize_by`.  

Once it's loaded, visit [http://localhost:3000](http://localhost:3000) and begin browsing!

## Todo

In no particular order:
- ~~word cloud~~
  - basic version done but could do with some love
- time of day / day of week stats
- response time stats
- get images working in chat
- fix encoding issues on import
- build out some kind of sane interface for browsing people and conversations
- speed up import process using [activerecord-import](https://github.com/zdennis/activerecord-import) or similar gem
