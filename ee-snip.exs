joe = %{name: "joe", rate: 10}
sue = %{name: "sue", rate: 12}
emps = %{1 => joe, 2 => sue}

pay_stub = fn(card) -> 
  ee = emps[card.id]
  [id: card.id, name: ee.name]
end

regular_pay = fn(pay_stub, card) ->
  ee = emps[card.id]
  [ regular_pay: ee.rate*card.regular_hours] ++ pay_stub
end

ot1_pay = fn(pay_stub, card) ->
  ee = emps[card.id]
  [ ot1_pay: ee.rate*card.ot1_hours] ++ pay_stub
end