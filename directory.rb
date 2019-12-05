def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  name = gets.chomp
  
  while !name.empty? do
    puts "Please enter the student's favourite hobby"
    hobby = gets.chomp
    puts "Please enter the student's country of birth"
    country = gets.chomp
    students << {name: name, hobby: hobby, country: country, cohort: :november} # add the student hash to the array
    puts "Now we have #{students.count} student(s)"
    puts "Please enter another name, or hit return twice"
    
    name = gets.chomp
  end
  
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
count = 0
  until count >= students.length
    puts "#{students[count][:name]} (Hobby: #{students[count][:hobby]}) (Country: #{students[count][:country]}) (Cohort: #{students[count][:cohort]})"
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students

print_header
print(students)
print_footer(students)