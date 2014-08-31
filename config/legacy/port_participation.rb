c = content.split('),(')
c[0] = c[0][1..-1]
c[-1] = c[-1][1..-3]
res = c.map {|a| a.split(',')}
res.each {|rec|
  next if rec[7].to_i == 0
  s = "model = Registration.new({user_id: #{rec[1].to_i}"
  s += ", session_id: #{rec[7].to_i}"
  s += ", participated: '#{case rec[6][1..-2] when 'y' then 'T' else 'F' end}'"
  s += ", shown_up: '#{case rec[5][1..-2] when 'y' then 'T' else 'F' end}'"
  s += "})\n"
  s += "model.save(:validate => false)"
  open('db/seeds/production/partip.rb', 'a') { |f|
    f.puts s
  }
  s = "model = Assignment.new({user_id: #{rec[1].to_i}"
  s += ", experiment_id: #{rec[2].to_i}"
  s += ", invited: '#{case rec[3][1..-2] when 'y' then 'T' else 'F' end}'"
  s += "})\n"
  s += "model.save(:validate => false)"
  open('db/seeds/production/partip.rb', 'a') { |f|
    f.puts s
  }
}