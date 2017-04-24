class Ash
  define_method(:initialize) do
    @keys = []
    @values = []
  end

  define_method(:store) do |key, value|
    if (@keys.include?(key))
      @values[@keys.index(key)] = value
    else
      @keys << key
      @values << value
    nil
  end

  define_method(:fetch) do |key|
    if @keys.include?(key)
      @values[@keys.index(key)]
    end
  end

  define_method(:has_key?) do |key|
    @keys.include?(key)
  end

  define_method(:has_value?) do |value|
    @values.include?(value)
  end

  define_method(:length) do
    @keys.length()
  end

  define_method(:keys) do
    @keys
  end

  define_method(:values) do
    @values
  end

  define_method(:merge!) do |merge_ash|
    merge_ash.keys.each_with_index do |key, i|
      if @keys.include?(key)
        @values[@keys.index(key)] = merge_ash.values[i]
      else
        @keys.push(key)
        @values.push(merge_ash.values[i])
      end
    end
    [@keys, @values]
  end

  define_method(:merge) do |merge_ash|
    return_array = [[].concat(@keys),[].concat(@values)]

    merge_ash.keys.each_with_index do |key, i|
      if return_array[0].include?(key)
        return_array[1][return_array[0].index(key)] = merge_ash.values[i]
      else
        return_array[0].push(key)
        return_array[1].push(merge_ash.values[i])
      end
    end
    return_array
  end
end
