require 'json'

module PersonOpp
  def persist_person_teacher(person_type, name, specialization, age, id)
    new_person = { 'type' => person_type, 'name' => name, 'specialization' => specialization, 'age' => age, 'id' => id }
    people_data = File.read('people.json')
    @people = JSON.parse(people_data)
    @people << new_person
    File.write('people.json', JSON.pretty_generate(@people))
  end

  def persist_person_student(person_type, name, age, parent_permission, id)
    new_person = { 'type' => person_type, 'name' => name, 'age' => age, 'parent_permission' => parent_permission,
                   'id' => id }
    people_data = File.read('people.json')
    @people = JSON.parse(people_data)
    @people << new_person
    File.write('people.json', JSON.pretty_generate(@people))
  end

  def create_person
    print 'Which do you want to create? A student (press 1) or a teacher (press 2)?: '
    choice = gets.chomp.to_i
    case choice
    when 1
      register_student
    when 2
      register_teacher
    else
      puts 'Incorect choice, choose a number between 1-2'
      create_person
    end
  end

  def register_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Classroom: (C1,C2): '
    classroom = gets.chomp

    has_permission = permission?

    student = Student.new(classroom, age, name: name, parent_permission: has_permission)
    @people << student unless @people.include?(student)
    persist_person_student(student.type, name, age, has_permission, student.id)

    puts "\n Student '#{name}' aged '#{age}' with the classroom '#{classroom}' created Successfully 👍"
  end

  def register_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name: name)
    @people << teacher unless @people.include?(teacher)
    persist_person_teacher(teacher.type, name, specialization, age, teacher.id)

    puts "\n Teacher '#{name}' aged '#{age}' with the specialization '#{specialization}' created Successfully 👍"
  end

  def permission?
    print 'Has parent permission [Y/N]: '
    permission = gets.chomp

    case permission
    when 'n', 'N'
      false
    when 'y', 'Y'
      true
    else
      puts "\nIncorect choice, please press 'n'/'N' for false and 'y'/'N' for true"
    end
  end
end
