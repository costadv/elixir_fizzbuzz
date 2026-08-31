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
    #|> Enum.map(fn x -> String.trim(x) end)
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> IO.inspect()
  end

end

FizzBuzz.build("numbers.txt")
