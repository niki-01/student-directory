def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  name = gets.chomp
  
  while !name.empty? do
    puts "Please enter the student's favourite hobby"
    hobby = gets.chomp
    hobby = "N/A" if hobby.empty? == true
    puts "Please enter the student's country of birth"
    country = gets.chomp
    country = "N/A" if country.empty? == true
    puts "Please enter the student's cohort"
    cohort = gets.chomp
    cohort = "N/A" if cohort.empty? == true
    students << {name: name, hobby: hobby, country: country, cohort: cohort}
    puts "Now we have #{students.count} student(s)"
    puts "Please enter another name, or hit return to exit"
    
    name = gets.chomp
  end
  
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(53)
end

def print(students)
count = 0
  until count >= students.length
    puts "#{students[count][:name]} (Hobby: #{students[count][:hobby]}) (Country: #{students[count][:country]}) (Cohort: #{students[count][:cohort]})"
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student(s)".center(51)
end

students = input_students

print_header
print(students)
print_footer(students)