def make_change_recursive_slow(amount, coins)
  return [] if coins.empty?
  # coins_count = []

  shortest_so_far = nil

  coins.each do |coin|
    new_amount = amount
    new_coins_count = []
    coin_was_used = false
    if new_amount / coin > 0
      new_coins_count << coin
      new_amount -= coin
      coin_was_used = true
    end

    if coin_was_used
      new_coins_count += make_change_recursive_slow(new_amount, coins)
    else
      new_coins_count += make_change_recursive_slow(new_amount, coins[1..-1])
    end

    if shortest_so_far.nil? || new_coins_count.length < shortest_so_far.length
      shortest_so_far = new_coins_count
    end

  end

  shortest_so_far
end

def make_change(amount, coins)
  return nil if coins.empty?
  return [] if amount <= 0

  shortest_so_far = nil
  coins_count = []

  if amount >= coins[0]
    with_biggest_coin  = [coins[0]] + make_change(amount - coins[0], coins)
  end
  scrap_biggest_coin = make_change(amount, coins[1..-1])

  unless scrap_biggest_coin.nil?
    if with_biggest_coin.nil? || scrap_biggest_coin.length < with_biggest_coin.length
      coins_count += scrap_biggest_coin
    else
      coins_count += with_biggest_coin
    end
  end

  coins_count
end
