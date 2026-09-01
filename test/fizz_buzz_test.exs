defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns a converted list" do
      expectedResponse =
        {:ok,
         [1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz, :fizzbuzz, :fizz, :buzz, :fizzbuzz]}

      assert FizzBuzz.build("numbers.txt") == expectedResponse
    end

    test "when an invalid file is provided, returns an error" do
      expectedResponse = {:error, "File not found. Reason: enoent"}
      assert FizzBuzz.build("invalid.txt") == expectedResponse
    end
  end
end
