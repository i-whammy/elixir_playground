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
end

defmodule StringPrefix do
  def prefix(str) do
    fn a -> "#{str} #{a}" end
  end
end
