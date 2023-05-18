## cloudwalk-location-app
<p align="center">
  <img src="https://i.imgur.com/GWsaTdW.png">
  <img src="https://i.imgur.com/OhLB6Iq.gif">
</p>

## Nota

Para fins de apresentação, utilizei um **monorepo** com todos os repositórios necessários.

A proposta da arquitetura desse projeto é dividir o máximo possível as camadas e funcionalidades, a intenção é um fluxo de trabalho melhor e sem conflitos entre times pequenos.

Pelo pouco tempo para conclusão desse projeto não foi possível ser fiel ao **Gitflow** para conclusão das tarefas, sendo assim. Será feito um exemplo de [#Issue](/../../issues/1) para demonstração de conhecimento.


## Contemplações

+ Multi-modular escalável.
+ Clean Architecture e seus testes unitários em todas camadas.
+ Boas praticas de uso do Git. (Gitflow, Atommic commits, Semmantic commits)

## Futuras melhorias
+ Implementação robusta de navegação entre as features.
+ Adicionar Git Workflows para garantia da integridade e saúde do projeto.
+ Criar repositório core-ui para criação de componentes compartilhados entre features.

## Arquitetura Multi-modular

A arquitetura foi cuidadosamente projetada para promover um desenvolvimento saudável e escalável, permitindo a colaboração entre diversos desenvolvedores ou equipes.

Para garantir o sucesso dessa arquitetura, existem alguns módulos-chave:

+ **Core**: Este módulo define regras e padrões que devem ser seguidos por todos os módulos e pelo cliente para a execução do projeto. Ele estabelece uma base sólida para o desenvolvimento consistente e coerente.

+ **Client**: Neste módulo, é estabelecida a conexão e são definidas todas as configurações necessárias para a execução das features.

+ **Navigator**: O módulo atua como um expositor de rotas entre diferentes funcionalidades do projeto. Aqui, cada equipe ou squad pode registrar as rotas que estão abertas e disponíveis para serem utilizadas por outras funcionalidades. Isso facilita a comunicação e a integração entre as partes do sistema.

+ **Feature**: Este módulo é dedicado a cada funcionalidade específica do projeto. Aqui, cada equipe tem a liberdade de escolher o padrão de desenvolvimento que melhor se adequa à sua feature. Isso permite a personalização e a adaptação de cada funcionalidade de acordo com suas necessidades e requisitos específicos.

**Imagem explicativa**: 

![alt](https://i.imgur.com/w1mcqmg.png)

## Feature Home

Essa feature tem como única responsabilidade navegar o usuário para **feature-location**. Nesse exemplo é possível observar como é feito a navegação de uma feature para outra.

Foi utilizado um padrão de Clean Architecture, porém sem suas camadas de domínio e data, pois temos apenas visualização e execução de um único evento que não se classifica como um **usecase**.

A ideia geral da feature é ser capaz de conectar diversas features diferentes e também ter suas próprias responsabilidades como por exemplo: pré-visualização de dados.

## Feature Location

Tem como objetivo técnico ser a feature exemplo de toda arquitetura, nela utilizamos Clean Architecture.

A base para escolha da arquiteturas escolhida foi a flexibilidade, ou seja este módulo pode facilmente se adaptar a alterações (mudança de contrato, mudança completa de tela, mudança de comportamento de armazenamento de dados), outro ponto importante é que ela é facilmente testada de forma unitária nas suas principais camadas.

## Git/Github

Para seguir as boas praticas atuais de desenvolvimento alguns padrões de desenvolvimento foram seguidos.

Toda alteração no código deve vir de uma Issue aberta ou de um software de gerenciamento de tarefas.

Os commits sempre que possíveis devem utilizar do semmantic/conventional commit pra manter uma linha clara e de fácil entendimento do que estava sendo feito através dos commits.

Os commits sempre que possíveis devem seguir o padrão de Atomics Commit (sem deixar coisas pela metade).

## Configurações necessárias para execução do projeto

Navegue até a pasta do repositório do projeto e depois acesse o seguinte arquivo:

**iOS**:
```
client/ios/Runner/AppDelegate.swift
```

**Android**:
```
client/android/app/src/main/AndroidManifest.xml
```

E coloque sua **ApiKEY**

**iOS**:

```bash
GMSServices.provideAPIKey("ApiKEY")
```

**Android**:

```bash
<meta-data android:name="com.google.android.geo.API_KEY" 
android:value="ApiKEY"/>
```

## Antes de executar o projeto
Caso for testar o aplicativo em iOS e estiver com uma máquina Apple com arquitetura **ARM**, seguir esses passos antes de inicializar o projeto:

1. Abrir seu terminal
2. Ir até a pasta do seu projeto
3. Acessar a a pasta client
4. Acessar pasta iOS
5. Executar o comando

```bash
arch --x86_64 pod install --repo-update
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
