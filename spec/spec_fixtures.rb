Account.fixture {{
  :customer => Customer.gen
}}

Address.fixture {{
  :first_name   => Random.word(:max => 50),
  :last_name    => Random.word(:max => 50),
  :address1     => Random.address,
  :postal_code  => "%05d" % rand(100_000) + "-%04d" % rand([0, 1_000].random),
  :company      => (1..4).random.of {Random.word(:max => 25)}.join(' '),
  :telephone    => Random.phone_number,
  :address2     => Random.address,
  :city         => Random.word(:max => 50),
  :country      => country = Country.gen,
  :state        => State.gen(:country => country)
}}

Country.fixture {{
  :code => Random.country_code,
  :name => Random.word(:max => 100, :unique => true)
}}

Customer.fixture {{
  :username => Random.word(:max => 50, :unique => true)
}}

Order.fixture {{
  :order_number => rand(100_000),
  :tax          => rand * rand(1_000)
}}

State.fixture {{
  :country  => Country.gen,
  :name     => name = Random.word,
  :abbr     => name[0, 10]
}}