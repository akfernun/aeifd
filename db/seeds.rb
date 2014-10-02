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
Industrial
Single story
Multi-story
High rise (4+ stories)
Strip mall";

building_types = buildings_string.split("\n");

building_types.each do |type|
	SceneType.create(name: type);
end





