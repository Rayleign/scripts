#!/usr/bin/env ruby

if ARGV.size==0
    app='qq'
else
    app=ARGV[0]
    if ARGV.size>1
        action=ARGV[1]
    else
        action='on'
    end
end

path= File.dirname(__FILE__)

if app=='all'
    s=`cd #{path} && ls *.scpt|grep -v commom|grep -v foxmail|grep -v iterm`.split("\n")
    for scrp in s
        system "osascript #{path}/#{scrp} #{action}"
    end
    system "osascript #{path}/iterm.scpt #{action}"
else
    system "osascript #{path}/#{app}.scpt #{action}"
end 
