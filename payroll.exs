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
end