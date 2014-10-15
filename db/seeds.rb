# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Asset.delete_all

apparatus = ['EG29', 'EG53', 'EG54', 'EG61', 'EG62', 'EG63', 'EG64', 'DCEG71', 'L15', 'L19', 'L29', 'L63', 'L64', 'SQ29', 'Tanker 55', 'BG101', 'BG102', 'DCAR71','Safety 06', '1823', '1205', '1103', 'Arson', 'BC12', 'BC13', 'BC14', '1201'];


apparatus.each do |name|

	Asset.create(name: name);

end

# populates scene types

SceneType.delete_all;

buildings_string = "1 story
1 story w/ basement
2 story
2 story w/ basement
3 story
3 story w/ basement
Single story - Industrial
Multi-story - Industrial
High rise (4+ stories) - Industrial
Strip mall - Industrial";

building_types = buildings_string.split("\n");

building_types.each do |type|
	SceneType.create(name: type);
end


Location.delete_all

name_string = "North
South
East
West
";

name_string2 = name_string.split("\n");

name_string2.each do |type|
	Location.create(name: type);
end

AssetRole.delete_all

role_string = "Attacking
Defending
";

role_string2 = role_string.split("\n");

role_string2.each do |type|
	AssetRole.create(name: type);
end





