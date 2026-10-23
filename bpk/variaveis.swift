// Dicionário para armazenar os dados: [Nome: [Email, Telefone, Idade]]
var pessoas: [String: [String]] = [:]

// Função para exibir o menu principal
func exibirMenu() {
    print("""
    
    Escolha uma opção:
    1. Incluir dados de uma pessoa
    2. Alterar dados de uma pessoa
    3. Apagar dados de uma pessoa
    4. Exibir dados de uma pessoa
    5. Exibir dados de todas as pessoas
    6. Finalizar o programa
    """)
}

// 1. Incluir dados
func incluirPessoa() {
    print("Digite o nome da pessoa:")
    guard let nome = readLine(), !nome.isEmpty else { return }
    
    // Não permitir repetição de nome
    if pessoas[nome] != nil {
        print("Já existe uma pessoa com esse nome.")
        print(pessoas)
        return
    }
    
    print("Digite o email da pessoa:")
    guard let email = readLine() else { return }
    
    print("Digite o telefone da pessoa:")
    guard let telefone = readLine() else { return }
    
    print("Digite a idade da pessoa:")
    guard let idade = readLine() else { return }
    
    pessoas[nome] = [email, telefone, idade]
    print("Pessoa adicionada com sucesso!")
    print(pessoas)
}

// 2. Alterar dados
func alterarPessoa() {
    print("Digite o nome da pessoa que deseja alterar:")
    guard let nome = readLine() else { return }
    
    if pessoas[nome] == nil {
        print("Pessoa não encontrada.")
        print(pessoas)
        return
    }
    
    print("Digite o novo email da pessoa:")
    guard let novoEmail = readLine() else { return }
    
    print("Digite o novo telefone da pessoa:")
    guard let novoTelefone = readLine() else { return }
    
    print("Digite a nova idade da pessoa:")
    guard let novaIdade = readLine() else { return }
    
    pessoas[nome] = [novoEmail, novoTelefone, novaIdade]
    print("Dados da pessoa alterados com sucesso!")
    print(pessoas)
}

// 3. Apagar dados
func apagarPessoa() {
    print("Digite o nome da pessoa que deseja apagar:")
    guard let nome = readLine() else { return }
    
    if pessoas[nome] == nil {
        print("Pessoa não encontrada.")
        print(pessoas)
        return
    }
    
    pessoas.removeValue(forKey: nome)
    print("Pessoa removida com sucesso!")
    print(pessoas)
}

// 4. Exibir dados de uma pessoa específica
func exibirPessoa() {
    print("Digite o nome da pessoa que deseja exibir:")
    guard let nome = readLine() else { return }
    
    if let dados = pessoas[nome] {
        print("Dados de \(nome):")
        print("Email: \(dados[0])")
        print("Telefone: \(dados[1])")
        print("Idade: \(dados[2])")
    } else {
        print("Pessoa não encontrada.")
    }
    print(pessoas)
}

// 5. Exibir dados de todas as pessoas
func exibirTodasPessoas() {
    if pessoas.isEmpty {
        print("Nenhuma pessoa cadastrada.")
    } else {
        print("Dados de todas as pessoas cadastradas:")
        for (nome, dados) in pessoas {
            print("Nome: \(nome)")
            print("Email: \(dados[0])")
            print("Telefone: \(dados[1])")
            print("Idade: \(dados[2])")
        }
    }
    print(pessoas)
}

// Loop principal do programa
var executar = true
while executar {
    exibirMenu()
    guard let entrada = readLine(), let opcao = Int(entrada) else {
        print("Opção inválida. Tente novamente.")
        continue
    }
    
    switch opcao {
    case 1:
        incluirPessoa()
    case 2:
        alterarPessoa()
    case 3:
        apagarPessoa()
    case 4:
        exibirPessoa()
    case 5:
        exibirTodasPessoas()
    case 6:
        print("Programa finalizado.")
        executar = false
    default:
        print("Opção inválida. Escolha um número de 1 a 6.")
    }
}