Evaluation.destroy_all
Student.destroy_all
Batch.destroy_all
User.destroy_all

puts "Creating users"
user_arien  = User.create!(name:"Arien", email:"arien@codaisseur.com", password:"123abc")
user_wouter = User.create!(name:"Wouter", email:"wouter@codaisseur.com", password:"123abc")

puts "Creating batches"
batch_14 = Batch.create!(name:"CA#14", start_date:Date.new(2018,1,8), end_date:Date.new(2018,3,9))
batch_15 = Batch.create!(name:"CA#15", start_date:Date.new(2018,2,12), end_date:Date.new(2018,4,13))

puts "Creating students batch 14"
s_14_1 = Student.create!(name:"Oscar",
  image_url:"http://content.presspage.com/uploads/1369/1920_orlando.jpg",
  batch_id:batch_14.id)
s_14_2 = Student.create!(name:"Zjan",
  image_url:"https://stadclickt.nl/wp-content/uploads/2017/07/The-Student-Hotel-Groningen-10.jpg",
  batch_id:batch_14.id)
s_14_3 = Student.create!(name:"Irina",
  image_url:"https://www.loveme.com/images/p120484-1.jpg",
  batch_id:batch_14.id)
s_14_4 = Student.create!(name:"Renato",
  image_url:"http://publish.illinois.edu/ae-lambros/files/2017/10/renato.jpg",
  batch_id:batch_14.id)

puts "Creating students batch 15"
s_15_1 = Student.create!(name:"Rishi",
  image_url:"https://cdn.shopify.com/s/files/1/1637/3773/products/Rishi_Sharma_1024x1024.JPG",
  batch_id:batch_15.id)
s_15_2 = Student.create!(name:"Lillian",
  image_url:"http://www.taiwaneseamerican.org/100people/wp-content/uploads/2011/02/cheng.lillian2.jpg",
  batch_id:batch_15.id)
s_15_3 = Student.create!(name:"Danijel",
  image_url:"https://danijelzekanovic.files.wordpress.com/2015/05/mr-me.jpg",
  batch_id:batch_15.id)


# Create evaluations
scores = ["green", "yellow", "red"]

puts "Creating Evaluations " + batch_14.name + " ... "
batch_id = batch_14.id
# xdate    = batch_14.start_date.to_date
xdate    = Date.today - 15
while xdate < Date.today do
  if !xdate.sunday? && !xdate.saturday?
    print xdate, "-"
    Evaluation.create!(date: xdate,
      score: scores[rand(0..scores.length-1)], remarks: "remark",
      batch_id: batch_id, student_id:s_14_1.id)
    Evaluation.create!(date: xdate,
      score: scores[rand(0..scores.length-1)], remarks: "remark",
      batch_id: batch_id, student_id:s_14_2.id)
    Evaluation.create!(date: xdate,
      score: scores[rand(0..scores.length-1)], remarks: "remark",
      batch_id: batch_id, student_id:s_14_3.id)
    Evaluation.create!(date: xdate,
      score: scores[rand(0..scores.length-1)], remarks: "remark",
      batch_id: batch_id, student_id:s_14_4.id)
  end
  xdate = xdate + 1
end

puts " "
puts "Creating Evaluations " + batch_15.name + " ... "
batch_id = batch_15.id
# xdate    = batch_15.start_date.to_date
xdate    = Date.today - 15
while xdate < Date.today do
  if !xdate.sunday? && !xdate.saturday?
    print xdate, "-"
    Evaluation.create!(date: xdate,
      score: scores[rand(0..scores.length-1)], remarks: "remark",
      batch_id: batch_id, student_id:s_15_1.id)
    Evaluation.create!(date: xdate,
      score: scores[rand(0..scores.length-1)], remarks: "remark",
      batch_id: batch_id, student_id:s_15_2.id)
    Evaluation.create!(date: xdate,
      score: scores[rand(0..scores.length-1)], remarks: "remark",
      batch_id: batch_id, student_id:s_15_3.id)
  end
  xdate = xdate + 1
end

# match = Match.new
# (-days..-1).each do |d|
#   new_date = Date.today + d
#   if !(new_date.sunday? || new_date.saturday?)
#     print "+"
#     match.create_matches(new_date)
#   end
# end
