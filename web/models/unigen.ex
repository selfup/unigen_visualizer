defmodule Unigen do
  @moduledoc """
    Builds singular universe
  """

  @spec planes(number) :: List[Map]
  def planes(n) do
    Enum.to_list 0..n |> Enum.map(fn x ->
      Enum.to_list 0..n |> Enum.map(fn y ->
        Enum.to_list 0..n |> Enum.map(fn z ->
          Generator.generate(x, y, z)
        end)
      end)
    end)
  end

  @spec build(number) :: List[Map]
  def build(limit) do
    planes(limit)
    |> List.flatten
    |> Enum.map(&(Analyzer.set_charge(&1)))
    |> Analyzer.field_charge(limit)
  end
end
