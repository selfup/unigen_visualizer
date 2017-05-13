defmodule Unigen do
  @moduledoc """
    Builds singular and clusters of universes
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

  @spec generate(number) :: :ok
  def generate(limit) do
    %{charge: charge, universe: universe} = build(limit)
    IO.puts "#{length(universe)} - #{charge}\n"
  end
end
