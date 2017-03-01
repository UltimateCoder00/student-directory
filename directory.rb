def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  puts "Please enter the students hobbies"
  hobbies = gets.chomp

  puts "Please enter the students Country of Birth"
  country_of_birth = gets.chomp

  puts "Please enter the students height"
  height = gets.chomp

  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, CountryOfBirth: country_of_birth, height: height}
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
  number = 0
  string1 = "No   "
  string2 = "Name"
  string3 = "Cohort"
  string4 = "Hobbies"
  # string5 = "Country of Birth"
  # string6 = "Heigth"

  max_name_length = 0
  max_cohort_length = 0
  max_hobbies_length = 0
  # max_cob_length = 0

  students.each do |student|
    if max_name_length < student[:name].length
      max_name_length = student[:name].length
    end

    if max_cohort_length < student[:cohort].length
      max_cohort_length = student[:cohort].length
    end

    if max_hobbies_length < student[:hobbies].length
      max_hobbies_length = student[:hobbies].length
    end

    # if max_cob_length < student[:CountryOfBirth].length
      # max_cob_length = student[:CountryOfBirth].length
    # end
  end

  puts string1 + string2 + " "*(max_name_length - string2.length) + "   " + string3 + " "*(max_cohort_length - string3.length + 8) + "   " + string4 + " "*(max_hobbies_length - string4.length) + "   "
  puts "--------------------------------------------------------------------------"
  until (number == students.length) do
    puts "#{"%02d" % (number + 1)}   " + "#{students[number][:name]}," + " "*(max_name_length - students[number][:name].length) + "  #{students[number][:cohort]} cohort,"  + " "*(max_cohort_length - students[number][:cohort].length) + "   #{students[number][:CountryOfBirth]},"
    # puts "Country of Birth: #{students[number][:CountryOfBirth]},"
    # puts "Height: #{students[number][:height]}"
    number += 1
  end

  # Prints list of students using each method
  # students.each_with_index do |student, index|
    # puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  # end
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
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Serial Killer", CountryOfBirth: "USA", height: 1.78},
  {name: "Darth Vader", cohort: :november, hobbies: "Galactic Colonization", CountryOfBirth: "Mexico", height: 1.86},
  {name: "Nurse Ratched", cohort: :november, hobbies: "Nursing", CountryOfBirth: "USA", height: 1.98},
  {name: "Michael Corleone", cohort: :november, hobbies: "Mafia", CountryOfBirth: "Canada", height: 1.71},
  {name: "Alex DeLarge", cohort: :november, hobbies: "Killer", CountryOfBirth: "UK", height: 1.82},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: "Wizard", CountryOfBirth: "France", height: 1.77},
  {name: "Terminator", cohort: :november, hobbies: "Target Elimination", CountryOfBirth: "Germany", height: 1.69},
  {name: "Freddy Krueger", cohort: :november, hobbies: "Nightware Killer", CountryOfBirth: "Spain", height: 1.75},
  {name: "The Joker", cohort: :november, hobbies: "Attack Batman", CountryOfBirth: "Brazil", height: 1.74},
  {name: "Joffrey Baratheon", cohort: :november, hobbies: "King", CountryOfBirth: "India", height: 1.91},
  {name: "Norman Bates", cohort: :november, hobbies: "Psycho", CountryOfBirth: "China", height: 1.85}
]

filtered_students = list_filter(students)
# nothing happens until we call the methods
print_header
print(filtered_students)
print_footer(filtered_students)
