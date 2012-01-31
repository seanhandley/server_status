module DateDecorator
  def formatted_date(date)
    date.strftime("%-I:%M %p %a #{ordinalize(date.day)} %B %Y")
  end
end