-module(bob).

-export([response/1]).

response(String) ->
    Trimmed = string:trim(String),
    case Trimmed of
        [] -> "Fine. Be that way!";
            _ -> response(is_question(Trimmed), is_yelling(String))
    end.

response(true, true) -> "Calm down, I know what I'm doing!";
response(true, false) -> "Sure.";
response(false, true) -> "Whoa, chill out!";
response(false, false) -> "Whatever.".

is_question(String) ->
    lists:last(String) =:= $?.

is_yelling(String) ->
    string:uppercase(String) =:= String andalso not (string:lowercase(String) =:= String).
