defmodule FizzBuzz do
  def build(fileName) do

    File.read(fileName)
    |> handleFileRead()

  end

  defp handleFileRead({:error, reason}), do: {:error, "File not found. Reason: #{reason}"}
  defp handleFileRead({:ok, fileContent}) do
    result = fileContent
    |> String.split(",")
    |> Enum.map(&convertElement/1)

    {:ok, result}
  end

  defp convertElement(element) do
    element
    |> String.trim()
    |> String.to_integer()
    |> evaluateNumber()
  end

  defp evaluateNumber(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluateNumber(number) when rem(number, 3) == 0, do: :fizz
  defp evaluateNumber(number) when rem(number, 5) == 0, do: :buzz
  defp evaluateNumber(number), do: number

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
