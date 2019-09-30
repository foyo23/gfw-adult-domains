html_file = File.open( "gfwlist_adult.html" )
file_data = html_file.readlines.map( &:chomp )     # remove the new line characters.

print file_data, "\n\n\n"

output_file = File.open( "gfwlist_adult.json", "w" )
all_exclude_domain = []

#str = "adffg http://www.test.com   http://www.ruby-lang.org/ja/      http://www.rails.org/"

file_data.each {
  |str| 
  #print str, "\n"

  #reg1 = Regexp.new( /[\w][\w-]*\.(?:com\.cn|com|cn|co|net|org|gov|cc|biz|info)(\/|$)/ )
  reg1 = Regexp.new( /[\w][\w-]*\.(?:com\.cn|com|cn|co|net|org|gov|cc|biz|info)/ )

  r = str.scan( reg1 )

  r.each { |d|
      if !all_exclude_domain.include?( d )
        all_exclude_domain << d
        #output_file.write "\"domain: ", d, "\",\n"
        output_file.write d, "\n"
        print "domain: ", d, ",\n"
      end
  }
}


print "total exclude domains: ", all_exclude_domain.length, "\n"

html_file.close
output_file.close
