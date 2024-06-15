programa {
  inclua biblioteca Util --> U   //Biblioteca Util
  const inteiro quant = 25       //Constante para definir tamanho dos vetores
  cadeia data_entrada[quant], nome_proprietario[quant], equipamento[quant], defeito[quant]                   //Vetores para itens a consertar
  cadeia data_conserto[quant], nome_dono[quant], equipamento_consertado[quant], nome_profissional[quant]     //Vetores para itens consertados
  cadeia busca, enter  //variaveis de leitura
  caracter opcao       //variaveis de leitura
  inteiro total = 0, ponteiro = 0, i = 0, ponteiro_consertados = 0, porcentagem_consertados = 0, porcentagem_manutencao = 0
  real preco[quant]    //variavel para pre�o do servi�o dos itens consertados
  logico encontrado = falso

  funcao inicio() //limpa tela e chama funcao menu
   {
     limpa()
     menu()
    }

  funcao menu() //menu geral
    {
      limpa()
      escreva("1 - Cadastrar novo equipamento\n")
      escreva("2 - Executar manuten��o no pr�ximo equipamento\n")
      escreva("3 - Apresentar a fila dos equipamentos para atendimento\n")
      escreva("4 - Consultar o pr�ximo equipamento a ser atendido\n")
      escreva("5 - Buscar equipamento\n")
      escreva("6 - Exibir status da fila\n")
      escreva("7 - Apresentar os equipamentos consertados\n")
      escreva("8 - Buscar equipamentos consertados\n")
      escreva("9 - Sair do sistema\n\n")

      escreva("Informe a op��o desejada: ")
      leia(opcao)

      escolha(opcao)
      {
        caso '1':
        {
          cadastra_equipamento()  //Chama funcao cadastra_equipamento
          pare
        }
        caso '2':
        {
          manutencao_equipamento() //Chama funcao manutencao_equipamento
          pare
        }
        caso '3':
        {
          exibe_fila() //Chama funcao exibe_fila
          pare
        }
        caso '4':
        {
          consulta_equipamento() //Chama funcao consulta_equipamento
          pare
        }
        caso '5':
        {
          buscar_equipamento() //Chama funcao buscar_equipamento
          pare
        }
        caso '6':
        {
          exibir_status() //Chama funcao exibir_status
          pare
        }
        caso '7':
        {
          equipamentos_consertados() //Chama funcao equipamentos_consertados
          pare
        }
        caso '8':
        {
          busca_consertado() //chama funcao busca_consertado
          pare
        }
        caso '9':
        {
          sair() //chama funcao sair
          pare
        }
        caso contrario:
        {
          limpa()
          escreva("\n\nOp��o Invalida!\n")  //Mensagem de erro
          U.aguarde(2000)
          menu()
          pare
        }
      }
    }

  funcao cadastra_equipamento() //adiciona equipamento a fila de manuten��o
    {
      limpa()
      se(ponteiro<quant)
      {
        escreva("Informe a data atual: ")
        leia(data_entrada[ponteiro])
        escreva("Informe o nome do proprietario: ")
        leia(nome_proprietario[ponteiro])
        escreva("Informe o equipamento: ")
        leia(equipamento[ponteiro])
        escreva("Informe o defeito: ")
        leia(defeito[ponteiro])
        ponteiro++
        U.aguarde(500)
        limpa()
        escreva("Equipamento adicionado com sucesso a fila para manuten��o")
      }
      senao
      {
        escreva("Limite de equipamentos atingido!")
      }
      retorna()
    }

  funcao manutencao_equipamento()//dinamica de fila, primeiro equipamento da lista passa para lista de consertados, fun��o "realiza manuten��o" do 1 item da fila"
    {
      limpa()
      se(ponteiro==0)
      {
        escreva("N�o h� equipamentos para realizar manuten��o")
      }
      senao
      {
        escreva("Informe a data atual: ")
        leia(data_conserto[ponteiro_consertados])
        escreva("Informe o valor cobrado pelo servi�o: R$")
        leia(preco[ponteiro_consertados])
        escreva("Informe o nome do responsavel pela manuten��o: ")
        leia(nome_profissional[ponteiro_consertados])
        equipamento_consertado[ponteiro_consertados] = equipamento[0]
        nome_dono[ponteiro_consertados] = nome_proprietario[0]
        ponteiro_consertados++
        para(i=0;i<ponteiro-1;i++)
        {
          data_entrada[i] = data_entrada[i+1]
          nome_proprietario[i] = nome_proprietario[i+1]
          equipamento[i] = equipamento[i+1]
          defeito[i] = defeito[i+1]
        }
        ponteiro--
      }
      retorna()
    }

  funcao exibe_fila()//exibe fila de equipamentos para manuten��o
    {
      limpa()
      se(ponteiro==0)
      {
        escreva("N�o h� itens na fila de manuten��o!")
      }
      senao
      {
        para(i=0;i<ponteiro;i++)
        {
          escreva((i+1)," - ",equipamento[i],"(Defeito Relatado: ",defeito[i],") - ",data_entrada[i],"- Proprietario: ",nome_proprietario[i],"\n")
          U.aguarde(100)
        }
      }
      retorna()
    }

  funcao consulta_equipamento()//consulta proximo equipamento na fila de manuten��o
    {
      limpa()
      se(ponteiro==0)
      {
        escreva("N�o itens na fila de manuten��o!")
      }
      senao
      {
        i = 0
        escreva(equipamento[i],"(Defeito Relatado: ",defeito[i],") - ",data_entrada[i],"- Proprietario: ",nome_proprietario[i],"\n")
      }
      retorna()
   }

  funcao buscar_equipamento()//busca equipamento dentro da fila de manuten��o
    {
      encontrado = falso
      limpa()
      se(ponteiro==0)
      {
        escreva("N�o itens na lista de manuten��o!")
      }
      senao
      {
        escreva("Qual equipamento voc� busca: ")
        leia(busca)

        para(i=0;i<ponteiro;i++)
        {
          se(equipamento[i]==busca)
          {
            escreva(equipamento[i],"(Defeito Relatado: ",defeito[i],") - ",data_entrada[i],"- Proprietario: ",nome_proprietario[i],"\n")
            encontrado = verdadeiro
          }
        }
        se(encontrado == falso) // Se n�o encontra pelo equipamento, tenta buscar pelo nome do proprietario
        {
          limpa()
          escreva("N�o conseguimos encontrar o equipamento, qual seria o nome do proprietario?\n")
          leia(busca)
          para(i=0;i<ponteiro;i++)
          {
            se(nome_proprietario[i]==busca)
            {
              escreva(equipamento[i],"(Defeito Relatado: ",defeito[i],") - ",data_entrada[i],"- Proprietario: ",nome_proprietario[i],"\n")
              encontrado = verdadeiro
            }
          }
        }
        se(encontrado == falso)
        {
          limpa()
          escreva("Registro n�o encontrado")
        }
      }
      retorna()
    }

  funcao exibir_status()// exibe status de itens a fazer, prontos e total
    {
      limpa()
      se((ponteiro + ponteiro_consertados) == 0)
      {
        total = 0
        porcentagem_consertados = 0
        porcentagem_manutencao = 0
        escreva("Total de entradas: ",total,"\n")
        escreva("Consertados: ",ponteiro_consertados," equipamentos - ",porcentagem_consertados,"%\n")
        escreva("Em fila para manuten��o: ",ponteiro," equipamentos - ",porcentagem_manutencao,"%\n")
      }
      senao
      {
        total = ponteiro + ponteiro_consertados
        porcentagem_consertados = (ponteiro_consertados/total)*100
        porcentagem_manutencao = (ponteiro/total)*100
        escreva("Total de entradas: ",total,"\n")
        escreva("Consertados: ",ponteiro_consertados," equipamentos - ",porcentagem_consertados,"%\n")
        escreva("Em fila para manuten��o: ",ponteiro," equipamentos - ",porcentagem_manutencao,"%\n")
      }
      retorna()
    }

  funcao equipamentos_consertados()//lista equipamentos prontos
    {
      limpa()
      se(ponteiro_consertados==0)
      {
        escreva("N�o h� itens na lista de equipamentos prontos!")
      }
      senao
      {
        para(i=0;i<ponteiro_consertados;i++)
        {
          escreva((i+1)," - ",equipamento_consertado[i]," - Responsavel Manuten��o: ",nome_profissional[i]," - ",data_conserto[i],"- Proprietario: ",nome_dono[i],"\n")
          U.aguarde(100)
        }
      }
      retorna()
    }

  funcao busca_consertado()// busca equipamento dentro da lista de itens prontos
    {
      encontrado = falso
      limpa()
      se(ponteiro_consertados==0)
      {
        escreva("N�o h� itens prontos!")
      }
      senao
      {
        escreva("Qual equipamento voc� busca: ")
        leia(busca)

        para(i=0;i<ponteiro_consertados;i++)
        {
          se(equipamento_consertado[i]==busca)
          {
            escreva((i+1)," - ",equipamento_consertado[i]," - Responsavel Manuten��o: ",nome_profissional[i]," - ",data_conserto[i],"- Proprietario: ",nome_dono[i],"\n")
            encontrado = verdadeiro
          }
        }
        se(encontrado == falso) // Se n�o encontra pelo equipamento, tenta buscar pelo nome do proprietario
        {
          limpa()
          escreva("N�o conseguimos encontrar o equipamento, qual seria o nome do proprietario?\n")
          leia(busca)
          para(i=0;i<ponteiro_consertados;i++)
          {
            se(nome_dono[i]==busca)
            {
              escreva((i+1)," - ",equipamento_consertado[i]," - Responsavel Manuten��o: ",nome_profissional[i]," - ",data_conserto[i],"- Proprietario: ",nome_dono[i],"\n")
              encontrado = verdadeiro
            }
          }
        }
        se(encontrado == falso)
        {
          limpa()
          escreva("Registro n�o encontrado")
        }
      }
      retorna()
    }

  funcao sair() //encerra o programa, anima��o contagem regressiva
    {
      limpa()
      escreva("Finalizando sistema em 3...")
      U.aguarde(1000)
      limpa()
     escreva("Finalizando sistema em 2...")
     U.aguarde(1000)
     limpa()
     escreva("Finalizando sistema em 1...")
     U.aguarde(1000)
     limpa()
    }

  funcao retorna() //Retorna ao menu
      {
        U.aguarde(500)
        escreva("\n\nPRESSIONE [ENTER] PARA RETORNAR AO MENU")
        leia(enter)
        menu()
      }
}
