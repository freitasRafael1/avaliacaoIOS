// Dicionário de armazenamento: [Nome: [Email, Telefone, Idade]]
var pessoas: [String: [String]] = [:]

// Função para exibir o menu principal
func exibirMenu() {
    print("""
    
    ========================================
             SISTEMA DE CADASTRO
    ========================================
    [1] Incluir novo registro
    [2] Atualizar dados existentes
    [3] Remover registro
    [4] Consultar um contato
    [5] Listar todos os cadastros
    [6] Sair da aplicação
    ========================================
    Digite sua opção:
    """)
}

// 1. Incluir dados
func incluirPessoa() {
    print("-> Informe o nome:")
    guard let nome = readLine(), !nome.isEmpty else { return }
    
    if pessoas[nome] != nil {
        print("[! Atenção] Já existe um cadastro com este nome.")
        print(pessoas)
        return
    }
    
    print("-> Informe o e-mail:")
    guard let email = readLine() else { return }
    
    print("-> Informe o telefone:")
    guard let telefone = readLine() else { return }
    
    print("-> Informe a idade:")
    guard let idade = readLine() else { return }
    
    pessoas[nome] = [email, telefone, idade]
    print("[Sucesso] Registro incluído com êxito!")
    print(pessoas)
}

// 2. Alterar dados
func alterarPessoa() {
    print("-> Digite o nome do registro que deseja alterar:")
    guard let nome = readLine() else { return }
    
    if pessoas[nome] == nil {
        print("[! Erro] Registro não localizado.")
        print(pessoas)
        return
    }
    
    print("-> Novo e-mail:")
    guard let novoEmail = readLine() else { return }
    
    print("-> Novo telefone:")
    guard let novoTelefone = readLine() else { return }
    
    print("-> Nova idade:")
    guard let novaIdade = readLine() else { return }
    
    pessoas[nome] = [novoEmail, novoTelefone, novaIdade]
    print("[Sucesso] Dados atualizados com sucesso!")
    print(pessoas)
}

// 3. Apagar dados
func apagarPessoa() {
    print("-> Digite o nome do registro que deseja remover:")
    guard let nome = readLine() else { return }
    
    if pessoas[nome] == nil {
        print("[! Erro] Registro não localizado.")
        print(pessoas)
        return
    }
    
    pessoas.removeValue(forKey: nome)
    print("[Sucesso] Registro removido do sistema.")
    print(pessoas)
}

// 4. Exibir dados de uma pessoa específica
func exibirPessoa() {
    print("-> Digite o nome que deseja buscar:")
    guard let nome = readLine() else { return }
    
    if let dados = pessoas[nome] {
        print("""
        ----------------------------------------
        EXIBINDO REGISTRO: \(nome)
        ----------------------------------------
        E-mail  : \(dados[0])
        Telefone: \(dados[1])
        Idade   : \(dados[2])
        ----------------------------------------
        """)
    } else {
        print("[! Erro] Registro não localizado.")
    }
    print(pessoas)
}

// 5. Exibir dados de todas as pessoas
func exibirTodasPessoas() {
    if pessoas.isEmpty {
        print(">>> Nenhum registro cadastrado no momento.")
    } else {
        print("""
        ----------------------------------------
              LISTA GERAL DE CADASTROS
        ----------------------------------------
        """)
        for (nome, dados) in pessoas {
            print("Nome    : \(nome)")
            print("E-mail  : \(dados[0])")
            print("Telefone: \(dados[1])")
            print("Idade   : \(dados[2])")
            print("----------------------------------------")
        }
    }
    print(pessoas)
}

// Loop principal do programa
var rodando = true
while rodando {
    exibirMenu()
    guard let entrada = readLine(), let opcao = Int(entrada) else {
        print("[! Opção inválida] Por favor, digite um número entre 1 e 6.")
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
        print("Encerrando o programa. Até logo!")
        rodando = false
    default:
        print("[! Opção inválida] Escolha um valor válido do menu.")
    }
}