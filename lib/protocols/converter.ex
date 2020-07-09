defprotocol Converter do
  def convert(value)
end

defimpl Converter, for: BitString do
    def convert(value) do
        IO.puts("BitString")
    end
end

defimpl Converter, for: Integer do
    def convert(value) do
        IO.puts("Integer")
    end
end
