require Faker
alias ExChan.{Board, Thread, Post, Repo, Setting, BoardSetting, ThreadSetting}

# Settings
board_nsfw = Repo.insert! %Setting{key: "board.nsfw", type: "boolean", default_value: "false", description: "Determines if a board is Not Safe For Work"}
thread_locked = Repo.insert! %Setting{key: "thread.locked", type: "boolean", default_value: "false", description: "Determines if a thread is locked"}

# Boards
random = Repo.insert! %Board{slug: "b", name: "random"}
technology = Repo.insert! %Board{slug: "g", name: "technology"}

# Board Settings
Repo.insert! %BoardSetting{board: random, setting: board_nsfw, value: "true"}

# Threads
cheeses = Repo.insert! %Thread{board: random}

Repo.insert! %Post{
  thread: cheeses,
  ip_address: "192.168.1.101",
  captcha_verification: "NOT_A_ROBOT",
  attachment: "https://i.imgur.com/NLUXK3F.jpg",
  body: "Post your cheeses!"
}

for _ <- 1..53 do
  Repo.insert! %Post{
    thread: cheeses,
    ip_address: Faker.Internet.ip_v4_address,
    captcha_verification: "NOT_A_ROBOT",
    attachment: Faker.Internet.image_url,
    body: Faker.Lorem.paragraph(%Range{first: 1, last: 4})
  }
end

elixir_general = Repo.insert! %Thread{board: technology}

Repo.insert! %Post{
  thread: elixir_general,
  ip_address: "192.168.1.1",
  captcha_verification: "NOT_A_ROBOT",
  attachment: "https://i.imgur.com/48wKSIE.png",
  body: "ELIXIR GENERAL!\n\nElixir is pretty cool! What do you all think?"
}

for _ <- 1..20 do
  Repo.insert! %Post{
    thread: elixir_general,
    ip_address: Faker.Internet.ip_v4_address,
    captcha_verification: "NOT_A_ROBOT",
    attachment: Faker.Internet.image_url,
    body: Faker.Lorem.paragraph(%Range{first: 1, last: 4})
  }
end

# Thread Settings
Repo.insert! %ThreadSetting{thread: cheeses, setting: thread_locked, value: "true"}
