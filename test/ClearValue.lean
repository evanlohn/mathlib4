import Mathlib.Tactic.ClearValue

example {a b : Nat} (h : a = b) : a = b := by
  let c := a + b
  clear_value c
  have d := a + c
  fail_if_success clear_value d

  let e := 1
  let f := 2
  let g := d
  let h := 4 + c
  have _i := e + f + g + h
  clear_value e f g
  fail_if_success clear_value e
  fail_if_success clear_value e f h
  fail_if_success clear_value h f e
  fail_if_success clear_value h _i
  fail_if_success clear_value _i h
  clear_value h
  assumption
