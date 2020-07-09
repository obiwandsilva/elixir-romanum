defprotocol Converter do
  def convert(value)
end

defimpl Converter, for: BitString do
    def convert(value) do
        :bitstring
    end
end

defimpl Converter, for: Integer do
    def convert(value) do
        :integer
    end
end
