# Template Method Pattern
# Date: 19-Aug-2018
# Authors:
#          A01377162 Guillermo Pérez Trueba 
#          A01020507 Luis Ángel Lucatero Villanueva

#A class that creates different type of tables, used to 
#verify the <em>Template Method</em>
class TableGenerator
  
  #Creates a new instnces of a TableGenerator
  def initialize(header, data)
    @header = header
    @data = data
  end
  
  #Generates the tables
  def generate
    generate_header_row + (@data.map {|x| generate_row(x)}).join
  end
  
  #Generates the header row of the tables
  def generate_header_row
    (@header.map {|x| generate_header_item(x)}).join
  end
  
  #Generates the items of the tables
  def generate_item(item)
    item
  end
  
  #Generates a row of of the tables
  def generate_row(row)
    (row.map {|x| generate_item(x)}).join
  end
  
  #Generates the header items of the tables
  def generate_header_item(item)
    item
  end

end

#CSVTable class. Implements TableGenerator.
class CSVTableGenerator < TableGenerator
  
  #Overides the TableGenerator +generate_row+ method.
  def generate_row(row)
    "#{(row.map {|x| generate_item(x)}).join(',')}\n"
  end
  
  #Overides the TableGenerator +generate_header_row+ method.
  def generate_header_row
    generate_row(@header)
  end

end

#HTMLTable class. Implements TableGenerator.
class HTMLTableGenerator < TableGenerator
  
  #Overides the TableGenerator +generate+ method. 
  def generate
    "<table>\n" + generate_header_row + (@data.map {|x| generate_row(x)}).join + "</table>\n"
  end
  
  #Overides the TableGenerator +generate_row+ method.
  def generate_row(row)
    "<tr>#{(row.map {|x| "<td>#{generate_item(x)}"}).join("</td>")}</td></tr>\n"  
  end
  
  #Overides the TableGenerator +generate_header_row+ method.  
  def generate_header_row
    "<tr>#{(@header.map {|x| '<th>'+generate_item(x)}).join("</th>")}</th></tr>\n"  
  end

end

#AsciiDocTable class. Implements TableGenerator.
class AsciiDocTableGenerator < TableGenerator
  
  #Overides the TableGenerator generate method.
  def generate
    "[options=\"header\"]\n" + generate_header_row + (@data.map {|x| generate_row(x)}).join + "|==========\n"
  end
  
  #Overides the TableGenerator +generate_row+ method.
  def generate_row(row)
    "#{(row.map {|x| "|#{generate_item(x)}" }).join("")}\n"
  end
  
  #Overides the TableGenerator +generate_header_row+ method.
  def generate_header_row
    "|==========\n" + generate_row(@header)
  end

end