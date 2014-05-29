require 'fileutils'

task :dist => :web do
  puts "Cleaning previous build"
  FileUtils.rm_r("dist/osx") if File.directory?("dist/osx")
  FileUtils.mkdir_p("dist/osx")
  puts "Copying node-webkit skeleton app"
  FileUtils.cp_r("/usr/local/lib/node_modules/nodewebkit/nodewebkit", "dist/osx/Headbang.app")
  puts "Copying app.nw"
  FileUtils.cp_r("build", "dist/osx/Headbang.app/Contents/Resources/app.nw")
  puts "Copying nw.icns"
  FileUtils.cp("resources/icon.icns", "dist/osx/Headbang.app/Contents/Resources/nw.icns")

  if File.exist?("vendor/ffmpegsumo.so")
    puts "Copying ffmpegsumo.so"
    FileUtils.cp("vendor/ffmpegsumo.so", "dist/osx/Headbang.app/Contents/Frameworks/node-webkit Framework.framework/Libraries")
  end

  system "open dist/osx/Headbang.app"
end

task :web do
  puts "Building assets"
  system "middleman build"
end
