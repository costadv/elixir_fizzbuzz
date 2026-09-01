defmodule FizzBuzz do
  def build(fileName) do

    File.read(fileName)
    |> handleFileRead(fileName)

  end

  def handleFileRead({:error, reason}, fileName), do: "File #{fileName} not found. Reason: #{reason}"
  def handleFileRead({:ok, fileContent}, _) do
    fileContent
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> IO.inspect()
    |> Enum.map(&fizzBuzz/1)
  end

  def fizzBuzz(number) do
    cond do
      Integer.mod(number, 3) + Integer.mod(number, 5) == 0 -> :FizzBuzz
      Integer.mod(number, 3) == 0 -> :Fizz
      Integer.mod(number, 5) == 0 -> :Buzz
      true -> number
    end

  end

end

#FizzBuzz.build("numbers.txt")
#|> IO.inspect()
