Sketchup::require 'sketchup'
Sketchup::require 'extensions'

module CircaDiem
  module ProjectTool
    unless file_loaded?(__FILE__)
      ex = SketchupExtension.new('Companion by Circa Diem', 'circadiem-companion/main')
      ex.description = 'SketchUp plugin to connect to use Circa Diem Companion projects.'
      ex.version     = '1.0.0'
      ex.copyright   = 'Circa Diem SAS'
      ex.creator     = 'Circa Diem SAS'
      Sketchup.register_extension(ex, true)
      file_loaded(__FILE__)
    end

  end # module CustomTool
end # module Examples

