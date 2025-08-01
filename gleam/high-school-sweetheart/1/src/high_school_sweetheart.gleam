import gleam/io
import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  name
    |> string.trim
    |> string.slice(_, 0, 1) 
}

pub fn initial(name: String) {
  name
    |> first_letter
    |> string.uppercase
    |> string.append(_, ".")
}

pub fn initials(full_name: String) {
  full_name
    |> string.split(_, " ")
    |> list.map(_, initial)
    |> string.join(_, " ")
}

pub fn pair(full_name1: String, full_name2: String) {
"
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **\n"
<>
"**     "
<>
initials(full_name1)
<>
"  +  "
<>
initials(full_name2)
<>
"     **\n"
<>
" **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}