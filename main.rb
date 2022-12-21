require_relative './student'
require_relative './classroom'
require_relative './book'
require_relative './rental'

S1 = Student.new('Classroom 1', 17, 'James')
S2 = Student.new('Classroom 2', 16, 'John')

C1 = Classroom.new('Classroom 1')
p S1.classroom
p C1.students.count

S1.classroom = C1
p C1.students.count

C1.add_students(S2)
p C1.students.count
p S2.classroom.label

B1 = Book.new('The Power of Now', 'Eckhart Tolle')
R1 = Rental.new('2020-01-01', S1, B1)

p R1.book.title
p R1.person.name

p B1.rentals.count
p S1.rentals.count
