## cloudwalk-location-app
Este projeto é um projeto com diversos testes tanto de arquitetura de aplicativo mobile quanto de práticas técnicas.

## Nota

Para fins de apresentação, utilizei um **monorepo** com todos os repositórios necessários.

A proposta da arquitetura desse projeto é dividir o máximo possível as camadas e funcionalidades, a intenção é um fluxo de trabalho melhor e sem conflitos entre times pequenos.

## Contemplações

+ Multimodular escalável.
+ Clean Architecture e seus testes unitários em todas camadas.
+ Boas praticas de uso do Git, (Git Flow, Attomic commits, Semmantic commits).

## Futuras melhorias
+ Implementação robusta de navegação entre as features (módulos).
+ Criar repositório core-ui para criação de compontes compartilhados entre features (módulos).


## Arquitetura multimodular

A arquitetura foi cuidadosamente projetada para promover um desenvolvimento saudável e escalável, permitindo a colaboração entre diversos desenvolvedores ou equipes.

Para garantir o sucesso dessa arquitetura, existem alguns módulos-chave:

+ **Core**: Este módulo define regras e padrões que devem ser seguidos por todos os módulos e pelo cliente para a execução do projeto. Ele estabelece uma base sólida para o desenvolvimento consistente e coerente.

+ **Client**: Neste módulo, é estabelecida a conexão e são definidas todas as configurações necessárias para a execução das features.

+ **Navigator**: O módulo atua como um expositor de rotas entre diferentes funcionalidades do projeto. Aqui, cada equipe ou squad pode registrar as rotas que estão abertas e disponíveis para serem utilizadas por outras funcionalidades. Isso facilita a comunicação e a integração entre as partes do sistema.

+ **Feature**: Este módulo é dedicado a cada funcionalidade específica do projeto. Aqui, cada equipe tem a liberdade de escolher o padrão de desenvolvimento que melhor se adequa à sua feature. Isso permite a personalização e a adaptação de cada funcionalidade de acordo com suas necessidades e requisitos específicos.

**Imagem explicativa**: 

![alt](https://i.imgur.com/2ckAEWK.png)

## Configurações necessárias

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
3. Acessar pasta iOS
4. Executar o comando

```bash
arch --x86_64 pod install --repo-update
```



## License

[MIT](https://choosealicense.com/licenses/mit/)
