# #!/usr/bin/env coffee

fs = require 'fs'
nm = require 'nodemailer'

smtp = nm.createTransport 'SMTP',
  service: 'Gmail'
  auth:
    user: 'MAIL'
    pass: 'PASS'

zeroComp = (num)->
  num = num.toString()
  num = "0#{num}" if num.length is 1
  num

today = new Date()
month = zeroComp today.getMonth() + 1
date  = zeroComp today.getDate()

fs.readFile "PATHTO/pages/#{today.getFullYear()}#{month}#{date}.md", {encoding: 'utf8'}, (err, md)->
  smtp.sendMail
    from: 'FROM'
    to: 'TO'
    subject: "TITLE(#{today.getFullYear()}/#{month}/#{date})"
    text: "#{md}\n\n(この日報は激ヤバ鬼便利日報システムによって送信されました)"
  , (err, res)->
    console.log res
    process.exit 0
