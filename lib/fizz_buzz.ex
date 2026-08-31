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
  end

end

FizzBuzz.build("numbers.txt")
