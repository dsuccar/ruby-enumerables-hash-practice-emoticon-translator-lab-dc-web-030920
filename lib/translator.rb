require "yaml"# require modules here
require 'pry'
def load_library(file_path)
 #  {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
 # "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
 # "bored"=>[":O", "(ΘεΘ;)"],
 # "confused"=>["%)", "(゜.゜)"],
 # "embarrased"=>[":$", "(#^.^#)"],
 # "fish"=>["><>", ">゜))))彡"],
 # "glasses"=>["8D", "(^0_0^)"]...

    emoticons = YAML.load_file(file_path)

    new_hash = {
        'get_meaning' => {},
        'get_emoticon' => {}
      }

        emoticons.each do |key,value|

        new_hash['get_emoticon'][value[0]] = value[1]
        new_hash['get_meaning'][value[1]] = key

      end

      new_hash
  #     {"get_meaning"=>
  # {"☜(⌒▽⌒)☞"=>"angel",
  #  "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
  #  "(ΘεΘ;)"=>"bored",
  # "get_emoticon" =>
  # {"0:)"=> (Japaneseemoji)
  # ...}

end
#  emoticons[key][1]
# => "☜(⌒▽⌒)☞"
#  key
# => "angel"
#  emoticons[key]
# => ["O:)", "☜(⌒▽⌒)☞"]
# [value[0]]
# => ["O:)"]
# [value[1]]
# => ["☜(⌒▽⌒)☞"]

def get_japanese_emoticon(file_path, emoticon)
  result = load_library(file_path)['get_emoticon'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  result = load_library(file_path)['get_meaning'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end
