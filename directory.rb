def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def list_filter(students_list)
  puts "Would you like to filter your student list?"
  reply = yes_or_no_reply

  if (reply == "yes")
    return students_filter(students_list)
  else
    return students_list
  end
end

def yes_or_no_reply
  while true
    puts "Please only enter 'yes' or 'no'"
    reply = gets.chomp.downcase

    if (reply == "no") || (reply == "yes")
      break
    end
  end

  reply
end

def students_filter(students_list)
  filtered_students_list = []
  puts "Would you like the students names to start with a specific letter?"
  reply = yes_or_no_reply

  if (reply == "yes")
    filtered_students_list = student_names_starting_letter(students_list)
    students_list = filtered_students_list
  end

  puts "Would you like to display student names with 12 or less characters?"
  reply = yes_or_no_reply

  if (reply == "yes")
    filtered_students_list = student_names_with_12_chars(students_list)
  end

  filtered_students_list
end

def student_names_starting_letter(students_list)
  students_list_filtered = []
  puts "Please specify the letter for the student names to start with"
  reply = gets.chomp.downcase
  students_list.each do |student|
    if student[:name].downcase.to_s.start_with?(reply)
      students_list_filtered.push(student)
    end
  end

  students_list_filtered
end

def student_names_with_12_chars(students_list)
  students_list_filtered = []

  students_list.each do |student|
    if student[:name].length < 12
      students_list_filtered.push(student)
    end
  end

  students_list_filtered
end

 # students = input_students

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

filtered_students = list_filter(students)
# nothing happens until we call the methods
print_header
print(filtered_students)
print_footer(filtered_students)
