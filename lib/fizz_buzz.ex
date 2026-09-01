defmodule FizzBuzz do
  def build(fileName) do

    File.read(fileName)
    |> handleFileRead(fileName)

  end

  def handleFileRead({:error, reason}, fileName), do: "File #{fileName} not found. Reason: #{reason}"
  def handleFileRead({:ok, fileContent}, _) do
    fileContent
    |> String.split(",")
    |> IO.inspect()
    |> Enum.map(&convertElement/1)
  end

  def convertElement(element) do
    element
    |> String.trim()
    |> String.to_integer()
    |> evaluateNumber()
  end

  def evaluateNumber(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  def evaluateNumber(number) when rem(number, 3) == 0, do: :fizz
  def evaluateNumber(number) when rem(number, 5) == 0, do: :buzz
  def evaluateNumber(number), do: number

  #def fizzBuzz(number) do
  #  cond do
  #    Integer.mod(number, 3) + Integer.mod(number, 5) == 0 -> :fizzBuzz
  #    Integer.mod(number, 3) == 0 -> :fizz
  #    Integer.mod(number, 5) == 0 -> :buzz
  #    true -> number
  #  end
  #
  #end

end

#FizzBuzz.build("numbers.txt")
#|> IO.inspect()
