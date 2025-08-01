-module(acronym).

-export([abbreviate/1]).


abbreviate(Phrase) ->
    lists:foldl(
        fun(Lexeme, Acronym) -> Acronym ++ get_acronym_letter(Lexeme) end,
        "",
        string:lexemes(Phrase, " -")
    ).

get_acronym_letter(Lexeme) ->
    case sanitize_lexeme(Lexeme) of
        [First | _] -> string:uppercase([First]);
        [] -> ""
    end.

sanitize_lexeme(Lexeme) ->
    string:trim(Lexeme, both, "\n\t_").