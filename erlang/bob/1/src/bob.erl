-module(bob).

-export([response/1]).

is_char_uppercase(Char) when Char >= $A, Char =< $Z -> true;
is_char_uppercase(_) -> false.

is_char_lowercase(Char) when Char >= $a, Char =< $z -> true;
is_char_lowercase(_) -> false.

is_char_letter(Char) -> 
    is_char_lowercase(Char) orelse is_char_uppercase(Char).

is_string_whitespace(String) ->
    string:trim(String) =:= "".    

get_string_letters(String) ->
    lists:filter(fun is_char_letter/1, String).

is_string_yelling(String) ->
    Letters = get_string_letters(String),
    length(Letters) > 0 andalso lists:all(fun is_char_uppercase/1, Letters).

is_string_question(String) ->
    lists:last(string:trim(String)) =:= $?.

answer_non_question(String) ->
    case is_string_yelling(String) of
        true -> "Whoa, chill out!";
        false -> "Whatever."
    end.

answer_question(String) -> 
    case is_string_yelling(String) of
        true -> "Calm down, I know what I'm doing!";
        false -> "Sure."
    end.

answer_non_whitespace(String) ->
    case is_string_question(String) of
        true -> answer_question(String);
        false -> answer_non_question(String)
    end.

response(String) ->
    case is_string_whitespace(String) of
        true -> "Fine. Be that way!";
        false -> answer_non_whitespace(String)
    end.
