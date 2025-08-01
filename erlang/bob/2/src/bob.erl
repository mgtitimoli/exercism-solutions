-module(bob).

-export([response/1]).

is_yelling(String) ->
    string:uppercase(String) =:= String andalso not (string:lowercase(String) =:= String).

is_question(String) ->
    lists:last(String) =:= $?.

answer_non_question(String) ->
    case is_yelling(String) of
        true -> "Whoa, chill out!";
        false -> "Whatever."
    end.

answer_question(String) -> 
    case is_yelling(String) of
        true -> "Calm down, I know what I'm doing!";
        false -> "Sure."
    end.

answer_non_whitespace(String) ->
    case is_question(String) of
        true -> answer_question(String);
        false -> answer_non_question(String)
    end.

response(String) ->
    Trimmed = string:trim(String),
    case Trimmed of
        [] -> "Fine. Be that way!";
            _ -> answer_non_whitespace(Trimmed)
    end.
