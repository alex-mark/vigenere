module Vigenere

  @arr = ['А','Б','В','Г','Д','Е','Ж','З','И','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ы','Ь','Ю','Я']
  @text = "АХЧСУТЬХЬОЩНМЛХЕВЧКПБУЩТШФЩИОЧБЕФОХЕЮТЕИДЗТЖЗРЖВВУТСЫЛСРУАПИДЧКНШРЖЕГУИИЧУВЕШ"

  def Vigenere.encode(key, plain_text)
    key = key.upcase.split('')

    cipher_text = plain_text.upcase.split('').collect do |letter|
      if !@arr.include?(letter)
        cipher_letter = letter
      else
        #cipher_letter = Caesar.encode(key.first, letter)
        cipher_letter = @arr[Vigenere.encode_l(key.first, letter)]
        key << key.shift 
      end
      cipher_letter
    end

    return cipher_text.join    
  end

  def Vigenere.decode(key, cipher_text)
    key = key.upcase.split('')

    plain_text = cipher_text.split('').collect do |cipher_letter|
      if !@arr.include?(cipher_letter)
        letter = cipher_letter
      else
        letter = @arr[Vigenere.decode_l(key.first, cipher_letter)]
        key << key.shift 
      end
      letter
    end

    return plain_text.join
  end

  def Vigenere.index(letter)
    for i in 0..28
      if letter == @arr[i]
        return i
      end
    end
  end

  def Vigenere.encode_l(key_letter, letter)
    sum = Vigenere.index(key_letter) + Vigenere.index(letter)
    if sum < 29
      return sum
    else
      return sum - 29
    end
  end

  def Vigenere.decode_l(key_letter, letter)
    sub = Vigenere.index(letter) - Vigenere.index(key_letter)
    if sub < 29
      return sub
    else
      return sub + 29
    end
  end

  def Vigenere.check(text)
    i = 1
    while i < text.len
      pair = text[i-1] + text[i]
      if @arr.include?(pair)
        mas[pair] += 1
      else 
        mas[pair] = 1
    end
    mas.each |key, value|
      puts key + ' - ' + value
    end
end



puts "hi"
#puts Vigenere.encode('РУБИ', 'ОТЬЕЗДАДЕНЬДАВНОПРОСРОЧЕНПРОХОДИТИПОСЛЕДНИИСРОКОСМОТРЕНВНОВЬОБИТУПРОШЕНЗАБВЕНЬЮБРОШЕННЫИВОЗОК')
#puts Vigenere.encode('РУБИ', 'ПРОХОДИТИПОСЛЕДНИИСРОК')
#puts Vigenere.encode('РУБИ', 'ОСМОТРЕНВНОВЬОБИТУПРОШЕН')
#puts Vigenere.encode('РУБИ', 'ЗАБВЕНЬЮБРОШЕННЫИВОЗОК')

puts Vigenere.decode('РУБИ','ЯЖЮОЧЧБНХБЮНРХОЦАДПЩБВШОЮ')


