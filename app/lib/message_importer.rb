#
# USAGE:
#
# Takes a json facebook messages download file
#
#   path = "/Users/bill/Downloads/facebook_data-BillJPearce/messages/inbox/IlseMartinez__oZTkl76Kw/message.json"
#   MessageImporter.new(path).import
#
# May take a very long time to run. For long conversations,
# consider batching all of this if possible, e.g.
#
# - build list of unique participants and put them in hash
# - build messages
# - batch save them?
#
# Might need an "unsafe mode" that doesn't do a find_or_initialize_by when creating messages?
#
class MessageImporter
  attr_accessor :file_path

  def initialize(path)
    self.file_path = path
  end

  def import
    file = File.read(file_path)
    json = JSON.parse(file)

    participants_json = json["participants"]
    conversation      = Conversation.find_or_create_by(title: json["title"])
    participants = {}
    participants_json.each do |participant_json|
      person      = Person.find_or_create_by(name: participant_json["name"])
      participant = Participant.find_or_create_by(conversation: conversation, person: person)
      participants[person.name] = participant
    end

    messages_json = json["messages"]
    messages_json.each do |message_json|
      begin
        participant = participants[message_json["sender_name"]]
        if participant.blank?
          person      = Person.find_or_create_by(name: message_json["sender_name"])
          participant = Participant.find_or_create_by(conversation: conversation, person: person)
          participants[person.name] = participant
        end
        sent_at     = DateTime.strptime((message_json["timestamp_ms"]/1000).to_s, "%s")
        content     = message_json["content"]
        message     = participant.messages.find_or_initialize_by(content: content, sent_at: sent_at)
        message.conversation = conversation
        message.message_type = message_json["type"]
        message.save!
      rescue => e
        puts "Couldn't import message #{message_json}"
      end
    end
  end
end
