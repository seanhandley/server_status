module DateDecorator
  def formatted_date(date)
    date.strftime("%H:%m:%S %a #{ordinalize(date.day)} %B %Y")
  end
end