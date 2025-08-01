-module(acronym).

-export([abbreviate/1]).


abbreviate(Phrase) ->
    lists:foldl(
        fun(Lexeme, Acronym) -> Acronym ++ get_acronym_letter(Lexeme) end,
        "",
        string:lexemes(Phrase, " -")
    ).

get_acronym_letter(Lexeme) ->
    case string:trim(Lexeme, both, "\n\t_") of
        [First | _] -> string:uppercase([First]);
        [] -> ""
    end.
