defmodule Employee do
  defstruct id: 0, name: "", rate: 0
end

defmodule Timecard do
  defstruct id: 0, regular_hours: 0, ot1_hours: 0, ot2_hours: 0
end

defmodule Pay do
  def timecards do
    [
      %Timecard{id: 1, regular_hours: 40, ot1_hours: 0, ot2_hours: 0},
      %Timecard{id: 2, regular_hours: 40, ot1_hours: 10, ot2_hours: 5}
    ]
  end

  @joe  %{name: "joe", rate: 10}
  @sue  %{name: "sue", rate: 12}
  @emps %{1 => @joe, 2 => @sue}

  def pay_timecard(card) do
    ee = @emps[card.id]

    pay_stub = [id: card.id, name: ee.name]

    regular_pay = fn(pay_stub) ->
      [ regular_pay: ee.rate*card.regular_hours ] ++ pay_stub
    end

    ot1_pay = fn(pay_stub) ->
      [ ot1_pay: ee.rate*card.ot1_hours] ++ pay_stub
    end

    ot2_pay = fn(pay_stub) ->
      [ ot2_pay: ee.rate*card.ot2_hours] ++ pay_stub
    end

# this guy can see card and ee and does not need them

    base_pay = fn(pay_stub) ->
      [ base_pay: pay_stub[:regular_pay] + pay_stub[:ot1_pay] + pay_stub[:ot2_pay]]  ++ pay_stub
    end

    pay_stub 
      |> regular_pay.() 
      |> ot1_pay.()
      |> ot2_pay.()
      |> base_pay.()
  end

end