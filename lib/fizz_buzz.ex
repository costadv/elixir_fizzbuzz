defmodule FizzBuzz do
  def build(fileName) do
    #case File.read(fileName) do
    #  {:ok, file} -> file
    #  {:error, _} -> "File not found."
    #end

    File.read(fileName)
    |> handleFileRead()

  end

  def handleFileRead({:error, reason}), do: "File not found. Reason: #{reason}"
  def handleFileRead({:ok, fileContent}) do
    fileContent
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> IO.inspect()
    |> Enum.map(fizzbuzz())
  end

  def fizzBuzz(number) do
    cond do
      Integer.mod(number, 3) + Integer.mod(number, 5) == 0 -> "FizzBuzz"
      Integer.mod(number, 3) == 0 -> "Fizz"
      Integer.mod(number, 5) == 0 -> "Buzz"
      true -> number
    end

  end

end

FizzBuzz.build("numbers.txt")
