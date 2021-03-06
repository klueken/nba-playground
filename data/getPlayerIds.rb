require 'json'

input = File.read('stats/rebounding.json')
data = JSON.parse(input)

out = {"players" => Hash.new {|h,k| h[k] = Array.new }}

data["resultSets"][0]["rowSet"].each do |player|
    player_data = [player[0], player[1]]
    out["players"][player[4]] << player_data
end

File.open("player_id.json","w") do |f|
  f.write(JSON.pretty_generate(out))
end

puts("Created file \"player_id.json\"")
