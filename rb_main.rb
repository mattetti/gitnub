#
#  rb_main.rb
#  GitNub
#
#  Created by Justin Palmer on 3/1/08.
#  Copyright (c) 2008 Active Reload, LLC. All rights reserved.
#

require 'osx/cocoa'
require File.dirname(__FILE__) + '/mime-types/lib/mime/types.rb'

def rb_main_init  
  path = OSX::NSBundle.mainBundle.resourcePath.fileSystemRepresentation
  rbfiles = Dir.entries(path).select {|x| /\.rb\z/ =~ x}
  rbfiles -= [ File.basename(__FILE__) ]
  rbfiles.each do |path|
    require( File.basename(path) )
  end
end


if $0 == __FILE__ then
  rb_main_init
  OSX.NSApplicationMain(0, nil)
end
