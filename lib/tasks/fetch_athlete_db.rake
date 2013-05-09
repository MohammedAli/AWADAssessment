desc "Seed db with athlete data from BB"

task :fetch_athlete_data => :environment do
  require "net/http"
  require "uri"

  # Ditch the whole db
  Athlete.destroy_all

  lines = Net::HTTP.get('www.bbc.co.uk', '/news/special/2012/newsspec_3734/athletes_data.txt').lines
  lines.each do |sline|
    
    # Split (string) line into different fields (array)
    line = sline.split(/\t/)

    # Create a temporary hash to store these fields
    hash = { :sname => line[0], :fname => line[1],
      :height => line[2], :weight => line[3],
      :country => line[4], :code => line[6],
      :gender => line[7], :sport => line[8], :event => line[9]
    }

    athlete = Athlete.new(hash)
    if athlete.save
      puts "   ---> A new athlete has been added to the db:"
      puts "        %-20s %-15s %-5s %-5s %-10s %-5s %-5s %-10s %-10s" % [hash[:fname], hash[:sname], 
        hash[:height], hash[:weight], 
        hash[:country], hash[:code], 
        hash[:gender], hash[:sport], hash[:event]]
    else 
      puts "   ==== There were some errors processing this entry."
    end

  end # Loop end

  # Delete record with Table headers
  Athlete.find_by_fname("First name").destroy
end