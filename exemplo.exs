#teste.txt
#isso é um teste
File.read("testee.txt")
|> IO.inspect(label: "TESTE COM BANG")

IO.puts("\n\n")

File.read!("testee.txt")
|> IO.inspect(label: "TESTE SEM BANG")
