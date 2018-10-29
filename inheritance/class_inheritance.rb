class Employee
  
  attr_reader :salary
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end
  
end

class Manager < Employee
  attr_reader :employees
  
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
    @employees.each do |employee|
      if employee.class == Manager
        @employees += employee.employees
      end
    end
  end
  
  
  
  def bonus(multiplier)
    total_salary = 0
    @employees.each do |employee|
      total_salary += employee.salary
    end
    total_salary * multiplier
  end
  
end

if __FILE__ == $PROGRAM_NAME
  david = Employee.new("David", "TA", 10000, "Darren") 
  shawna = Employee.new("Shawna", "TA", 12000, "Darren") 
  darren = Manager.new("Darren", "TA", 78000, "Ned", [david, shawna]) 
  ned = Manager.new("Ned", "TA", 1000000, nil, [darren])
  
  p ned.bonus(5)
  p darren.bonus(4)
  p david.bonus(3)

end 