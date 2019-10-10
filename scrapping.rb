require "csv"

 Information = Struct.new(:number_client,:duration,:name)

 class Parser

  def parsing
   file = "task_2.csv"
   @arr_of_rows =CSV.read(file)
   clearing
   get_uniq_names
   get_values
  end

  def clearing()
   @arr_of_rows -= [@arr_of_rows[0]]  #delete headers
   @arr_of_rows.map{|a| a.delete_at 1} #delete the second column
  end

  def get_uniq_names()
   @names =[]
   @arr_of_rows.each{|a| @names+=a[2].split(',')} #get all names
   @names=@names.uniq #get unique names
  end

  def get_values()
   nodes = []
   (0..@arr_of_rows.length-1).each do |c|
   nodes += [
     Information.new(@arr_of_rows[c][0],@arr_of_rows[c][1],@arr_of_rows[c][2])
    ]
   end
   get_total_array(nodes)
  end

   def get_total_array(nodes)
    @total =[]
    nodes = nodes.uniq &:number_client #get unique value
    @names.each do |name|
     sum = 0
     nodes.each{|c| if c[:name]==name; sum+=c[:duration].to_i; end} #math total duration
     @total += [sum => name] #creating array of hashes
    end
    puts @total
   end

 end
 start = Parser.new
 start.parsing






