# vigenere code

def vigenere(text, key)
    text = text.downcase
    key = key.downcase 
    txt_length = text.length
    k_length = key.length
    res = (txt_length - (txt_length.div(k_length)*k_length))
    #puts res 
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

#puts (vigenere('vpxzgiaxivwpubttmjpwizitwzt','cipher'))