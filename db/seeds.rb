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
s_14_1 = Student.create!(name:"Oscar", batch_id:batch_14.id)
s_14_2 = Student.create!(name:"Zjan", batch_id:batch_14.id)
s_14_3 = Student.create!(name:"Irina", batch_id:batch_14.id)
s_14_4 = Student.create!(name:"Renato", batch_id:batch_14.id)

puts "Creating students batch 15"
s_15_1 = Student.create!(name:"Rishi", batch_id:batch_15.id)
s_15_2 = Student.create!(name:"Lilian", batch_id:batch_15.id)
s_15_3 = Student.create!(name:"Danijel", batch_id:batch_15.id)


# Create evaluations
scores = ["green", "yellow", "red"]

puts "Creating Evaluations " + batch_14.name + " ... "
batch_id = batch_14.id
xdate    = batch_14.start_date.to_date
while xdate < Date.today do
  print xdate, "-"
  Evaluation.create!(date: xdate, score: "yellow", remarks: "remark",
    batch_id: batch_id, student_id:s_14_1.id)
  Evaluation.create!(date: xdate, score: "yellow", remarks: "remark",
    batch_id: batch_id, student_id:s_14_2.id)
  Evaluation.create!(date: xdate, score: "yellow", remarks: "remark",
    batch_id: batch_id, student_id:s_14_3.id)
  Evaluation.create!(date: xdate, score: "yellow", remarks: "remark",
    batch_id: batch_id, student_id:s_14_4.id)
  xdate = xdate + 1
end

puts " "
puts "Creating Evaluations " + batch_15.name + " ... "
batch_id = batch_15.id
xdate    = batch_15.start_date.to_date
while xdate < Date.today do
  print xdate, "-"
  Evaluation.create!(date: xdate, score: "yellow", remarks: "remark",
    batch_id: batch_id, student_id:s_15_1.id)
  Evaluation.create!(date: xdate, score: "yellow", remarks: "remark",
    batch_id: batch_id, student_id:s_15_2.id)
  Evaluation.create!(date: xdate, score: "yellow", remarks: "remark",
    batch_id: batch_id, student_id:s_15_3.id)
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
