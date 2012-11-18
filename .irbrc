begin
  require 'rubygems'
  require 'ap'
  require 'wirble'
  #require 'pp'
  #require 'irb/completion'

  IRB.conf[:AUTO_INDENT] = true
  IRB.conf[:USE_READLINE] = true

  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

def cls
  system('cls')
end


puts ("Yes! Configuration is loaded!")
