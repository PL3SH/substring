dictionary = %w[below down go going horn how howdy it i low own part partner sit]
def substrings(text, dictionary)
  text.downcase!
  #.union es uan manera resumida de que el regex use los strings del arreglo y les agrege un operador or (|) por lo que quedaria asi /below|down|go|going|horn|how|howdy|it|i|low|own|part|partner|sit/
  rex = Regexp.union(dictionary)
  p rex
  #escanea el string y usando el regex busca las coincidencias retorna un arreglo de strings de los que cumplieron con el regex
  matches = text.scan(rex)
  p matches
  #cuenta las coincidencias y devuelve un hash
  match_counts = matches.tally
     #aca debemos iterar sobre el arreglo para encontrar palabras que puedn ser 2 matches below = below=>1 & low=>1
  dictionary.each do |word|
      if text.include?(word)
        dictionary.each do |sub_word|
          if word.include?(sub_word) && word != sub_word
            match_counts[sub_word] = (match_counts[sub_word] || 0) + 1
          end
        end
      end
    end
    match_counts
  puts match_counts
end
substrings("Howdy partner, sit down! How's it going? below", dictionary)