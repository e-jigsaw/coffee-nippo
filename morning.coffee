fs = require 'fs'
{exec} = require 'child_process'

zeroComp = (num)->
  num = num.toString()
  num = "0#{num}" if num.length is 1
  num

today = new Date()
month = zeroComp today.getMonth() + 1
date  = zeroComp today.getDate()

fs.writeFile "PATHTO/pages/#{today.getFullYear()}#{month}#{date}.md", '# 本日の業務内容\n\ntime  | description\n----- | ----\n\n# 所感\n', (err)->
  console.log '今日も1日パワフル全開で突き抜けよう( ･ㅂ･)و ̑̑'
  exec "open -a Atom PATHTO/pages/#{today.getFullYear()}#{month}#{date}.md", -> process.exit 0
