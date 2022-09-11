# Movies

## Desafio Técnico
Este teste é destinado aos candidatos que almejam se tornarem Desenvolvedores Mobile na TokenLab.

## Especificações
 O desafio consiste em elaborar um aplicativo que obtenha os dados desta API, apresentando-os de forma simples e acessível, seguindo os padrões de usabilidade da plataforma.
O aplicativo deve ter no mínimo duas telas. Na primeira deve ser mostrada uma lista dos filmes (com imagem e título, ou só imagem). Ao selecionar um filme desta lista, o usuário deve ser redirecionado para uma tela de detalhes, onde mais informações devem ser exibidas. Você não precisa mostrar todas as informações que a API te der sobre os filmes.
Obrigatoriedades:
- Você precisa manter o usuário informado de que a aplicação está baixando/processando os dados.
- Utilize algum padrão de arquitetura de software (MVP, MVVM, MVC, Clean Architecture, etc).
- Todo o código deve ser enviado para algum repositório git remoto público (Github, Bitbucket, etc).
- Utilize alguma biblioteca de terceiro para realizar as chamadas HTTP. Você é livre para utilizar quantas bibliotecas quiser em seu projeto.

## Implementação
- O aplicativo foi implementado usando Flutter, um framework escrito em Dart.
- Princípios SOLID foram aplicados.
- Domain Driven Design como abordagem de modelagem de software.
- Padrão Model-View-Controller.
- Value Listenable Builder (Value Notifier) como gerenciamento de estado.
- Desenvolvimento Orientado a Testes.

## Características

- O aplicativo é capaz de obter uma lista de filmes e suas informações da API dada.
- Esta lista de filmes é mostrada na tela principal (Home View) em ordem com algumas informações.
- A lista com as informações é salva no armazenamento interno do telefone e pode ser acessada offline, desde que o primeiro download tenha sido feito.
- Quando o usuário clica em um tile, ele é levado para uma nova tela (Detailed View) com informações mais detalhadas sobre aquele filme.
- Existe uma tela de carregamento que avisa o usuário sobre o status de carregamento dos filmes.
- Foi implementado uma snackbar que avisa o usuário sobre possíveis problemas.
- O aplicativo avisa o usuário sobre o status da conexão, caso esteja offline.
- Todas as medidas utilizadas no projeto utilizam a tela como referência e utilizam uma porcentagem dela. Portanto, independente do tamanho da tela, o aplicativo pode ter a proporcionalidade preservada. A classe Scale foi implementada.

## Outras informações
- Foram implementados 30 testes unitários.
- UI/UX não era o foco. Preferi demonstrar meu conhecimento de arquitetura e testes. Usei injeção de dependência, dependência de interface e outras coisas mais complexas para demonstrar a aplicação dos princípios SOLID. Claro que a aplicação é bastante simples, e uma arquitetura mais simples seria perfeitamente adequada.

## Tech

O aplicativo Movies usa vários projetos de código aberto para funcionar corretamente, dentre elas, as mais importantes:

- [FlutterModular] - Flutter_modular foi construído usando o motor do modular_core que é responsável pelo sistema de injeção de dependência e gerenciamento de rotas. O sistema de roteamento emula uma árvore de módulos, assim como o Flutter faz em suas árvores de widgets. Portanto, podemos adicionar um módulo dentro de outro criando links para o módulo pai.

- [Mocktail] - O Mocktail se concentra em fornecer uma API simples e familiar para criar simulações no Dart (com segurança nula) sem a necessidade de simulações manuais ou geração de código.

- [Hive] - O Hive é um banco de dados de valor-chave leve e extremamente rápido escrito em Dart puro.
- [DartZ] - Essa é a maneira de implementar um bom tratamento de erros no Flutter. O termo bom significa que o aplicativo tem um tratamento de erros mais avançado para ajudar o usuário a entender se há algo errado ao usar o aplicativo.

- [Cached Network Image] - Uma biblioteca Flutter para mostrar imagens da Internet e mantê-las no diretório de cache.


## Running App

Movies requer o Flutter para rodar.

Selecione seu emulador favorito, pode ser iOS ou Android.
Abra a pasta que contém o main.dar e clique em rodar.

```sh
flutter run
```

[FlutterModular]: <https://pub.dev/packages/flutter_modular>
[Mocktail]: <https://pub.dev/packages/mocktail>
[Hive]: <https://pub.dev/packages/hive>
[DartZ]: <https://pub.dev/packages/dartz>
[Cached Network Image]: <https://pub.dev/packages/cached_network_image>

