# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Asset.delete_all

apparatus = ['EG29', 'EG53', 'EG54', 'EG61', 'EG62','BC12', 'BC13', 'BC14', '1201','DCEG71', 'L15', 'L19', 'L29', 'L63', 'L64', 'SQ29', 'Tanker 55', 'BG101', 'BG102', 'DCAR71','EG63', 'EG64','Safety 06', '1823', '1205', '1103', 'Arson'];

x=1;
apparatus.each do |name|

	if(x==4)
		x=1;
	end

	Asset.create(name: name, battalion_id: x);
	x+=1
end

Battalion.delete_all

batallion = [1,2,3]

batallion.each do |b|
	Battalion.create(name: b)
end


# populates scene types

SceneType.delete_all;

buildings_string = "1 story, 1, true
1 story w/ basement, 1, true
2 story, 2, false
2 story w/ basement, 2, true
3 story, 3, false
3 story w/ basement, 3, true
Single story - Industrial, 1, false
Multi-story - Industrial, 3, false
High rise (4+ stories) - Industrial, 20, false
Strip mall - Industrial, 3, false";

building_types = buildings_string.split("\n");

building_types.each do |type|
  building_types_doubleSplit = type.split(",");
	SceneType.create(name: building_types_doubleSplit[0], floor: building_types_doubleSplit[1], hasBasement: building_types_doubleSplit[2]);
end


Location.delete_all

name_string = "A
B
C
D
";

name_string2 = name_string.split("\n");

name_string2.each do |type|
	Location.create(name: type);
end

AssetRole.delete_all

role_string = "1st Engine
2nd Engine
1st Ladder
2nd Ladder
Rapid Intervention Team
Active RIT
";

role_string2 = role_string.split("\n");

role_string2.each do |type|
	AssetRole.create(name: type);
end

IncidentStrategy.delete_all

strat_string = "Offense
Defense
";

strat_string2 = strat_string.split("\n")
strat_string2.each do |s|
	IncidentStrategy.create(name:s)
end

Checkoff.delete_all

checkstring = "Primary Search
Secondary Search
All Clear
Utilities Contacted
Utilities Disconnected
Safety Officer Arrived
Fire Under Control
";

# typestring = "mayday
# incident
# ";

checkstring2 = checkstring.split("\n")
#typestring2 = typestring.split("\n")

# typestring2.each do |m|
# 	checkstring2.each do |n|


# 	end
# end

checkstring2.each do |m|
	Checkoff.create(name: m, checkofftype: "incident")
end




