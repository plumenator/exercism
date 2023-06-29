import std/[algorithm, sequtils, sugar]

type
  Student* = object
    name*: string
    grade*: int

  School* = object
    students*: seq[Student]

proc roster*(school: School): seq[string] =
  ## Returns the names of every student in the `school`, sorted by grade then name.
  var sorted_students = school.students.sorted(proc (x, y: Student): int =
    result = cmp(x.grade, y.grade)
    if result == 0:
      result = cmp(x.name, y.name))
  sorted_students.map(proc (x: Student): string = x.name)

proc addStudent*(school: var School, name: string, grade: int) =
  ## Adds a student with `name` and `grade` to the `school`.
  ##
  ## Raises a `ValueError` if `school` already contains a student named `name`.
  if school.students.anyIt(it.name == name):
    raise newException(ValueError, "exists already")
  else:
    school.students.add(Student(name: name, grade: grade))

proc grade*(school: School, grade: int): seq[string] =
  ## Returns the names of the students in the given `school` and `grade`, in
  ## alphabetical order.
  var students = collect:
    for student in school.students:
      if student.grade == grade:
        student.name
  students.sorted
