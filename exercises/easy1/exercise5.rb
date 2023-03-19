# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

names = ['Nqn Ybirynpr', 'Tenpr Ubccre', 'Nqryr Tbyqfgvar', 'Nyna Ghevat',
         'Puneyrf Onoontr', 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
         'Wbua Ngnanfbss', 'Ybvf Unvog', 'Pynhqr Funaaba', 'Fgrir Wbof',
         'Ovyy Tngrf', 'Gvz Orearef-Yrr', 'Fgrir Jbmavnx', 'Xbaenq Mhfr',
         'Fve Nagbal Ubner', 'Zneiva Zvafxl', 'Lhxvuveb Zngfhzbgb',
         'Unllvz Fybavzfxv', 'Tregehqr Oynapu']

module Rot13
  LOWERCASE = ('a'..'z').to_a

  def self.decrypt(cypher_text)
    cypher_text.chars.map do |char|
      next char unless char =~ /[a-zA-Z]/
      index = LOWERCASE.index(char.downcase) - 13
      char =~ /[A-Z]/ ? LOWERCASE[index].upcase : LOWERCASE[index]
    end.join
  end
end

puts(names.map { |name| Rot13.decrypt name })
