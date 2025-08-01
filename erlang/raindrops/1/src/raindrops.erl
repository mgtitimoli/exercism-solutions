-module(raindrops).

-export([convert/1]).


convert(Number) ->
    NumberDivisorSounds = get_number_divisor_sounds(Number),
    case NumberDivisorSounds of
        [] -> integer_to_list(Number);
        _ -> NumberDivisorSounds
    end.
        
get_number_divisor_sounds(Number) ->
    maps:fold(
        fun(Divisor, DivisorSound, Sound) ->
            Sound ++
            get_number_divisor_sound_if_divisible(
                Number,
                Divisor,
                DivisorSound
            )
        end,
        "",
        get_all_divisor_sounds()
    ).

get_number_divisor_sound_if_divisible(Number, Divisor, DivisorSound) ->
    case Number rem Divisor of
        0 -> DivisorSound;
        _ -> ""
    end.

get_all_divisor_sounds() ->
    #{
        3 => "Pling",
        5 => "Plang",
        7 => "Plong"
    }.