defmodule FizzBuzz do
  def build(fileName) do
    case File.read(fileName) do
      {:ok, file} -> file
      {:error, _} -> "File not found."
    end
  end

end

FizzBuzz.build("numbers.txt")
|> String.split(",")
|> Enum.map(fn x -> String.trim(x) end)
|> Enum.map(fn x -> String.to_integer(x) end)
|> IO.inspect()
