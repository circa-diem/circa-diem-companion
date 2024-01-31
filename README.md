# circa-sketchup

Sketchup.write_default('circadiem_companion', 'url', 'http://localhost/imports/create')
$LOAD_PATH << "/Users/jeanj/Projects/circa-diem/circa-diem-companion"
require 'circadiem-companion.rb'          

# Auto texture comp

mod = Sketchup.active_model
sel = mod.selection
  #sel.first.definition.entities.each do |s|
  s = sel.first.definition.entities.first
  puts s.definition.name
  s.definition.entities.grep(Sketchup::Face).each do |q|
    q.material = mod.materials.at("CD_4_plum")
    q.back_material = mod.materials.at("CD_4_plum")
    #q.back_material = mod.materials.at("CD_5_plywood_edge")
    #end
end

Sketchup.write_default('circa_diem', 'url', 'https://circa-diem.com/sketchup')
zip -X circadiem-companion.rbz circadiem-companion.rb circadiem-companion/* lib/**/* lib/*