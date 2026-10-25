# EsporteUniversitario

App iOS para quem quer conhecer as **atléticas universitárias** e os **campeonatos** do esporte universitário: busque atléticas, veja os esportes, horários e processos seletivos de cada uma, salve suas favoritas e acesse os campeonatos em um toque.

> 📸 _Screenshots em breve._

## Funcionalidades

- **Busca de atléticas** com `.searchable` e filtro por nome
- **Página da atlética**: universidade, cursos, descrição, eventos e um carrossel com os esportes (local, categoria, horários, premiações e datas de processo seletivo)
- **Contato direto** com a atlética pelo link cadastrado
- **Favoritas** salvas localmente com **Core Data**
- **Campeonatos** com acesso ao site oficial de cada um

## O que este projeto demonstra

- **Consumo de dados remotos** com `URLSession` e `async/await`, decodificando JSON com `Codable`
- **Persistência local** com Core Data (`NSPersistentContainer`, fetch, criação e remoção de entidades)
- **SwiftUI** com `TabView`, `NavigationLink`, busca nativa e componentização das telas
- Separação entre camada de dados (`Data/`), ViewModel (`ContentViewModel`) e Views

## Tecnologias

- Swift 5 · SwiftUI
- Core Data
- URLSession (async/await) + Codable

## Estrutura do projeto

```
EsportesUniversitarios/
├── ContentView/      # TabView principal e ContentViewModel
├── SearchScreen/     # Busca de atléticas
├── AtleticasPage/    # Detalhe da atlética e carrossel de esportes
├── FavoriteView/     # Atléticas favoritas (Core Data)
├── CampeonatoView/   # Lista de campeonatos
└── Data/             # Modelos Codable, requisições e CoreDataController
```

## Requisitos

- Xcode 16 ou superior
- iOS 18.5 ou superior
- Conexão com a internet (os dados das atléticas e dos campeonatos são carregados de um JSON remoto)

## Como rodar

1. Clone o repositório:
   ```bash
   git clone https://github.com/JonasFNMelo/EsporteUniversitario.git
   ```
2. Abra `EsportesUniversitarios/EsportesUniversitarios.xcodeproj` no Xcode.
3. Selecione um simulador de iPhone e execute (`⌘R`).

## Autoria

Projeto desenvolvido em equipe na Universidade Presbiteriana Mackenzie.

- [**Jonas Melo**](https://github.com/JonasFNMelo): camada de persistência com Core Data (`CoreDataController`) e `ContentViewModel`
