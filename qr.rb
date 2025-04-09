# Write your solution here!
puts "What kind of QR code would like to generate"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
require "rqrcode"
input = gets.chomp
input = input.to_i
if input==1
  pp "What is the URL you would like to encode"
  url = gets.chomp
  pp "What would you like to call the PNG"
  name = gets.chomp
  qrcode = RQRCode::QRCode.new(url)
  png = qrcode.as_png({:size=>500})
  IO.binwrite("#{name}.png",png.to_s)
  exit

elsif input==2
  pp "What is the name of the Wifi?"
  wifi = gets.chomp
  pp "What is the password?"
  password = gets.chomp
  pp "What would you like to call the PNG"
  name = gets.chomp
  qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi};P:#{password};;")
  png = qrcode.as_png({:size=>500})
  IO.binwrite("#{name}.png",png.to_s)
  exit

elsif input==3
  pp "What is the phone number you want to text?"
  number = gets.chomp
  pp "What is the text?"
  password = gets.chomp
  pp "What would you like to call the PNG"
  name = gets.chomp
  qrcode = RQRCode::QRCode.new("SMSTO:#{number}:#{password}")
  png = qrcode.as_png({:size=>500})
  IO.binwrite("#{name}.png",png.to_s)
  exit

elsif input==4
  pp "Goodbye"
  exit
else
  pp "Didnt recognize, try again"
  exit
end
  