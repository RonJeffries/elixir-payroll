joe = %{name: "joe", rate: 10}
sue = %{name: "sue", rate: 12}
emps = %{1 => joe, 2 => sue}

pay = fn(card) ->
  ee = emps[card.id]
  [id: card.id, name: ee.name, base_pay: ee.rate*card.regular_hours]
end