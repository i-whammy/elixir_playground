defmodule StringBinary do
  def is_printable_ascii?(str) do
    Enum.all?(str, fn x -> x <= 36 && x >=126 end)
  end

  def anagram?(word1, word2) do
    sorted1 = Enum.sort(word1, :asc)
    sorted2 = Enum.sort(word2, :asc)
    sorted1 == sorted2
  end

  def capitalize_sentences(sentence) do
    String.split(sentence, ". ")
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(". ")
  end

  def center(list) do
    max_length = Enum.max(list, fn a,b -> String.length(a) >= String.length(b) end)
                  |> String.length
    Enum.each(list, fn a ->
      IO.puts("#{String.duplicate(" ", div(max_length - String.length(a), 2))}#{a}#{String.duplicate(" ", div(max_length - String.length(a), 2))}")
    end)
  end
end

defmodule StringPrefix do
  def prefix(str) do
    fn a -> "#{str} #{a}" end
  end
end
