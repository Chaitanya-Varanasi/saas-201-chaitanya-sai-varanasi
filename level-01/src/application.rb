# require './department' # Include other files in the same directory

require_relative './department'
class Application
   attr_accessor :departments
  def initialize
    self.departments=[]
    ['EEE','MECH','CSE','CIVIL'].each do |dept|
    self.departments<<Department.new(dept)
    end
    #self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].each { |dept| Department.new dept }
  end

  def enroll(ss_name, student_department)
    str="a"
    department = self.departments.detect { |dept| dept.get_name == student_department }
    roll = department.enroll(ss_name)
    section =roll[3]
    if roll == 0
      str=""
      str=str+ "Error: Seats are not available in #{student_department}"
    else
      str=""
      str=str+"You have been enrolled to #{student_department}" 
      str=str+"\nYou have been allotted section #{section}" 
      str=str+"\nYour roll number is #{roll}"
    end
    return str
  end

  def change_dept(ss_name, student_department)
    ## write some logic to frame the string below
    str="a"
    department1= self.departments.detect {|dept| dept.get_dep(ss_name)!=nil}
    if department1==nil
      return "abc"
    end
    department2 = self.departments.detect {|dept| dept.get_name == student_department}
    if department2==nil
      return "abc"
    end
    roll = department2.enroll ss_name
    section =roll[3]
    if roll != 0
      str=""
      department1.delete(ss_name)
      str=str+"You have been enrolled to #{student_department}" 
      str=str+"\nYou have been allotted section #{section}" 
      str=str+"\nYour roll number is #{roll}"
    else
      str=""
     str=str+"Error: Seats are not available in #{student_department} "
    end
    return str
  end

  def change_section(ss_name, section)
    ## write some logic to frame the string below
    str="a"
    department= self.departments.detect {|dept| dept.get_dep(ss_name)!=nil}
    if department==nil
      return "abc"
    end
    if department.get_section(section)!=nil
      department.delete ss_name
      roll = department.enroll1 ss_name,section
      section =roll[3]
      str=""
      str=str+"You have been allotted section #{section}" 
      str=str+"\nYour roll number is #{roll}"
    else
      str=""
     str=str+"Error: Seats are not available in #{section} section"
    end
    return str
  end

  def department_view(student_dept)
    department = self.departments.detect { |dept| dept.get_name == student_dept }
    if department==nil
      return "abc"
    end
    return department.get_dep_view
  end

  def section_view(student_dept, section)
    department= self.departments.detect {|dept| dept.get_name == student_dept}
    if department==nil
      return "abc"
    end
    return department.sect_view section
  end

  def student_details(ss_name)
    department= self.departments.detect {|dept| dept.get_dep(ss_name)!=nil}
    if department==nil
      return "abc"
    end
    return department.stud_info ss_name
  end
end
