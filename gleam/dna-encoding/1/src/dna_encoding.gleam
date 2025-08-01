import gleam/list
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide_value: Int) -> Result(Nucleotide, Nil) {
  case nucleotide_value {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  list.fold(dna, <<>>, fn(data, nucleotide) {
    <<data:bits, encode_nucleotide(nucleotide):size(2)>>
  })
}

fn decode_rec(dna: BitArray, nucleotides: List(Nucleotide)) {
  case dna {
    <<nucleotide_value:2, dna_rest:bits>> -> {
      nucleotide_value
        |> decode_nucleotide
        |> result.try(fn(nucleotide) {
             decode_rec(dna_rest, [nucleotide, ..nucleotides])
           })
    }
    <<>> -> Ok(list.reverse(nucleotides))
    _ -> Error(Nil)
  }
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  decode_rec(dna, [])
}
