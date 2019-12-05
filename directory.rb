def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  name = gets.chomp
  
  while !name.empty? do
    if name.length < 12
      students << {name: name, cohort: :november} # add the student hash to the array
      puts "Now we have #{students.count} students"
      
      name = gets.chomp
    else
      puts "Please enter a name that does not exceed 12 characters"
      name = gets.chomp
    end
  end
  
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end


def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students

print_header
print(students)
print_footer(students)