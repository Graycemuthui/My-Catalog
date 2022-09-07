module LabelModule
  def read_labels
    if @labels.empty?
      puts 'No labels has been added yet, please add it.'
    else
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) #{label.title} #{label.color}"
      end
    end
  end
  #   def add_label
  #     puts 'Enter the title of the label:'
  #     title = gets.chomp
  #     puts 'Enter the color of the label:'
  #     color = gets.chomp
  #     label = Label.new(title, color)
  #     puts 'Label created successfully!'
  #     @labels << label
  #   end
end
