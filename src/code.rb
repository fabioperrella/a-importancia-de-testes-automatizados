def lalapopo(number)
  # introduzi um bug trocando o ">= 10" por "> 10"
  if number > 10 && number <= 15
    return false
  end

  if number % 2 == 0
    true
  else
    false
  end
end