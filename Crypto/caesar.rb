# A simple ruby code for brute forcing the caesar's cipher

class Cryptscript
    attr_reader :plaintext

    def initialize(plaintext)
        @plaintext = plaintext.downcase
    end 
    
    def caesar_brute()
        #@plaintext = @plaintext.downcase
        letters = "abcdefghijklmnopqrstuvwxyz"
        dictionary = Hash.new
        rev_dictionary = Hash.new
        0.upto(25) do |i|
            dictionary[letters[i]] = i
            rev_dictionary[i] = letters[i]
        end
        n_plain = Array.new
        j = 0
        while j < (@plaintext.length)
            n_plain << dictionary[@plaintext[j]]
            j = j + 1
        end
        soln = ''
        0.upto(25) do |key|
            final_string = ''
            j=0
            n_plain.each do |j|
                final_string = final_string + rev_dictionary[(key+j).modulo(26)]
                j=j+1
            end
            soln = soln + final_string + "\n"
        end 
        return soln
    end

    def vigenere(text, key)
        @text = text.downcase
        @key = key.downcase 
        txt_length = text.length
        k_length = key.length
        res = (txt_length - (txt_length.div(k_length)*k_length)) 
        if res == 0
            key_match = key*(txt_length.div(k_length)) 
        else
            key_match = key*(txt_length.div(k_length)) + key[0..(res-1)]
        end
        letters = "abcdefghijklmnopqrstuvwxyz"
        dictionary = Hash.new
        rev_dictionary = Hash.new
        0.upto(25) do |i|
            dictionary[letters[i]] = i
            rev_dictionary[i] = letters[i]
        end
        n_text = Array.new 
        text.each_char do |elem|
            n_text << dictionary[elem]
        end
        n_key = Array.new 
        key_match.each_char do |val|
            n_key << dictionary[val]
        end 
        elemwise = []
        n_text.zip(n_key) do |x,y| 
            elemwise << x - y 
        end
        #puts elemwise
        soln = ''
        elemwise.each do |i|
            soln = soln + rev_dictionary[i.modulo(26)]
        end 
    
        return soln
    end

end


#puts (caesar_brute('rawley'))
