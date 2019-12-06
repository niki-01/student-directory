@students = []

def input_students
  cohort_months = { "" => "N/A", "January" => :January, "February" => :February, 
  "March" => :March, "April" => :April, "May" => :May, "June" => :June, "July" => :July, 
  "August" => :August, "September" => :September, "October" => :October,  
  "November" => :November, "December" => :December}
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    puts "Please enter the student's cohort"
    cohort = cohort_months[gets.capitalize.chomp]
    while cohort == nil do
      puts "An error occured \nPlease enter the student's cohort"
      cohort = cohort_months[gets.capitalize.chomp]
    end
    @students << {name: name, cohort: cohort}
    if @students.count == 1
      puts "Now we have 1 student" 
    else 
      puts "Now we have #{@students.count} students"
    end
    puts "Please enter another name, or hit return to exit"
    name = gets.chomp
  end
end

def save_students 
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_by_cohort(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(53)
end

def print_by_cohort(students)
  puts "Which cohort would you like?"
  input = gets.capitalize.chomp
  header
  @students.each do |student|
    if student[:cohort] == input.to_sym
      puts student[:name].center(50)
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{@students.count} great student(s)".center(51)
end

interactive_menu