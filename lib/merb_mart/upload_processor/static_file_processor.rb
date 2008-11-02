class MerbMart::StaticFileProcessor
  attr_accessor :temp_file, :raw_data

  def process
    case
    when @temp_file.nil? && @raw_data
      @location = store_file(save_to_disk(@raw_data))
    when @temp_file
      @location = store_file(@temp_file)
    else raise "unable to process your upload"
    end
  end
end