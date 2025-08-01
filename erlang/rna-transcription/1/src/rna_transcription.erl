-module(rna_transcription).

-export([to_rna/1]).


to_rna(Dna) ->
    DnaRnaTranscriptions = get_dna_rna_transcriptions(),
    lists:map(
        fun(DnaNucleotide) ->
            maps:get(DnaNucleotide, DnaRnaTranscriptions)
        end,
        Dna
    ).

get_dna_rna_transcriptions() ->
    #{
      $G => $C,
      $C => $G,
      $T => $A,
      $A => $U
    }.