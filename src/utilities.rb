# To define string for error handling of integers and floats
class String
    def numeric?
      Float(self) != nil rescue false
    end
    def is_i?
        /\A[-+]?\d+\z/ === self
    end
end

# To define class for error handling
class NonNumericArgumentError < StandardError
end

class NonIntegerArgumentError < StandardError
end

# Arguments for error handling

def validate_numarg (num) 
    raise NonNumericArgumentError if !num.numeric?
    num
end

def validate_intarg (num)
    raise NonIntegerArgumentError if !num.is_i?
    num
end

# method to display the tables. this uses terminal-table gem, please see terminal-table gem for more documentation
def report(rows)
    table = Terminal::Table.new :headings => ['Exercise', 'Set', 'Weight', 'Reps'], 
    :title => "Exercise Log #{DateTime.now.strftime "%d/%m/%Y"}",
    :rows => rows
    puts `clear`    
    puts table
end

# method to display the history. this uses terminal-table gem, please see terminal-table gem for more documentation
# this is not yet implemented, there have to be changes on user flow to implement history
def history_report(rows)
    table = Terminal::Table.new :headings => ['Date','Exercise', 'Set', 'Weight', 'Reps'], 
    :title => "Exercise Log History",
    :rows => rows   
    puts table
end

