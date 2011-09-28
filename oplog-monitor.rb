require 'rubygems'
require 'mongo'
db = Mongo::Connection.new("localhost",5151).db("local")
coll = db.collection('oplog.$main')
loop do
cursor = Mongo::Cursor.new(coll, :timeout => false, :tailable => true)
	while not cursor.closed?
	begin
      if doc = cursor.next_document	  
		  puts "Timestamp"
		  puts  doc["ts"]
		  puts "Record"
		  puts  doc["o"]
		  puts "Affected Collection"
		  puts doc["ns"]
	  end
	rescue
		puts ""
		break
	end
  end
end