############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Payroll Application
#  Date:         September 29th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Payroll deduction calculator for the crimson permanent assurance
#
############################################################





# Prompt for employee's name

print "Enter Employee's name: "

# Assign variable for employee's name, remove carriage return, and capitalize.

employee_name = gets.split.map(&:capitalize).join(' ')

# Prompt for number of hours worked in a week

print "Enter number of hours worked in a week: "

# Assign variable for hours worked, remove carriage return, to_float

hours_worked = gets.to_f

# Prompt for hourly pay rate

print "Enter hourly pay rate: "

# Assign variable for hourly pay rate

hourly_pay_rate = gets.chomp

# Test for cash symbol to see if they entered a $ in their response

if hourly_pay_rate.include? "$"
  hourly_pay_rate = hourly_pay_rate.delete!("$").to_f
else
  hourly_pay_rate = hourly_pay_rate.to_f
end

# Prompt for federal tax withholding rate

print "Enter federal tax withholding rate: "

# Assign variable for federal tax withholding rate

federal_tax_rate = gets.chomp

# Test for decimal point to see if they entered integer or floating point for federal withholding rate

if federal_tax_rate.include? "."
  federal_tax_rate = federal_tax_rate.to_f
  federal_tax_display = federal_tax_rate.to_f * 100
else
  federal_tax_display = federal_tax_rate.to_f
  federal_tax_rate = federal_tax_rate.to_f / 100
end

# Prompt for state tax withholding rate

print "Enter state tax withholding rate: "

# Assign variable for state tax withholding rate

state_tax_rate = gets.chomp

# Test for decimal point to see if they entered integer or floating point for state withholding rate

if state_tax_rate.include? "."
  state_tax_rate = state_tax_rate.to_f
  state_tax_display = state_tax_rate.to_f * 100
else
  state_tax_display = state_tax_rate.to_f
  state_tax_rate = state_tax_rate.to_f / 100
end

# Print Employee Name:

puts
puts "Employee Name: #{employee_name}"

# Print Hours Worked:

puts "Hours Worked: #{hours_worked}"

# Print Pay Rate:

puts "Pay Rate: $#{hourly_pay_rate}"

# Print Gross Pay:

gross_pay = hours_worked * hourly_pay_rate
puts "Gross Pay: $#{gross_pay}"

# Assign withholding variables

federal_withholdings = gross_pay * federal_tax_rate
state_withholdings = gross_pay * state_tax_rate
total_deductions = federal_withholdings + state_withholdings

# Print Deductions rounded to two decimal places

puts "Deductions:"
puts "   Federal Withholding (#{federal_tax_display}%): $#{federal_withholdings.round(2)}"
puts "   State Withholding (#{state_tax_display}%): $#{state_withholdings.round(2)}"
puts "   Total Deduction: $#{total_deductions.round(2)}"

# Print Net Pay:

net_pay = gross_pay - total_deductions
puts "Net Pay: $#{net_pay.round(2)}"