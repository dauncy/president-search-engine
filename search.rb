require_relative 'list.rb'
list = getList
@presidents = list.split("\n")
  
presidents_hash = { }

Tuple = Struct.new(:full_name, :presidency, :start_char, :end_char)
    
@presidents.each_with_index do |president, i|
    presidents_hash[president] = { }
    presidents_hash[president]["term"] = i + 1 
    last_name = president.split(" ")[-1]

    if presidents_hash[last_name] == nil
        presidents_hash[last_name] = [president]
    else 
        presidents_hash[last_name] << president
    end

end 
    

def locate(str, presidents_hash)
  original_str = str
  list_of_tuples = [ ]
  @presidents.each_with_index do |president, index|
        if str.include?("#{president}") 
            start_char = str.index("#{president}")
            n_char =  president.length
            end_char = start_char + n_char
            found_president = Tuple.new(
                president, 
                index + 1, 
                start_char, 
                end_char 
            )
            list_of_tuples << found_president
            str.slice!("#{president}")
        end 
    end 
  
   presidents_hash.each do |key, value|
        if str.include?(key)
            start_char = original_str.index(key)
            presidents = presidents_hash[key]
          
            presidents.each do |president|
                found_president = Tuple.new(
                    president,
                    presidents_hash[president]["term"],
                    start_char,
                    start_char + key.length
                 )
                 
                list_of_tuples << found_president
                str.slice!("#{key}")
            end 
        end 
    end 
      
    distance_hash = { }
    words = str.split(" ")
        # puts words
    words.each do |word| 
        presidents_hash.each do |key, v|
           i = 0
           count = 0
           while i < word.length do 

                if word[i] != key[i]
                count += 1
                end 

                i +=1
            end 
            
            if word.length != key.length
                num = word.length - key.length
                count += num.abs()
            end 
        
            distance_hash[key] = count
        end 
            distance_hash.each do |k, v|
                if distance_hash[k] < 3
                    start_char = word.index(k)
              
                    presidents = presidents_hash[k]

                    presidents.each do |president|
                        found_president = Tuple.new(
                            president,
                            presidents_hash[president]["term"],
                            original_str.index(word),
                            original_str.index(word) + word.length
                        )
                        list_of_tuples << found_president
                    end 
                end
            end
    end 
  puts list_of_tuples
end 








locate("When was George Washington and Richard Nixon president Obama and Buch John Adams Monrox", presidents_hash )


