# Valorant API

## Descrição

Esta é uma API desenvolvida em Ruby on Rails, criada com o intuito de aprimorar os conhecimentos em Ruby e Ruby on Rails. A aplicação fornece informações detalhadas sobre os agentes (heróis) do jogo Valorant, obtendo dados atualizados através de crawlers em um site de estatísticas.

## Recursos

- Listagem de todos os agentes
- Informações detalhadas sobre um agente específico
- Atualizações automáticas das estatísticas por meio de crawlers

## Endpoints

- **Listagem de todos os agentes:**
  - `GET /agents`

- **Informações detalhadas sobre um agente específico:**
  - `GET /agent/:name`

    **Exemplo de Retorno:**
    ```json
    {
      "name": "astra",
      "winrate": 50.34,
      "pickrate": 1.01
    }
    ```

## Instalação e Execução Local

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/valorant-api.git

   bundle install
   rails db:migrate
   rails s
