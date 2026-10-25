<div align="center">

<img src="docs/icon.png" width="130" alt="EsporteUniversitario app icon" style="border-radius: 28px;"/>

# EsporteUniversitario

### Every university athletic association, one tap away. 🏆

EsporteUniversitario — published on the App Store as **UniEsportes** — brings Brazil's
university sports scene into a single native iOS app.
Search athletic associations (*atléticas*), see which sports each one plays, when they
train and when tryouts happen, save your favorites, and jump straight to the
championships they compete in.

<br/>

[![Download on the App Store](https://img.shields.io/badge/Download_on_the-App_Store-0D96F6?style=for-the-badge&logo=apple&logoColor=white)](https://apps.apple.com/br/app/uniesportes/id6747092775)
[![Platform](https://img.shields.io/badge/iOS-18.5+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-0052CC?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![Core Data](https://img.shields.io/badge/Core_Data-3693F3?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/documentation/coredata)

</div>

---

## 📑 Table of Contents

- [About](#-about)
- [Features](#-features)
- [How It Works](#-how-it-works)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Authors](#-authors)

---

## 📖 About

University athletic associations (*atléticas*) are a huge part of student life in Brazil,
but their information is scattered across Instagram profiles, group chats and flyers.
EsporteUniversitario gathers it in one place: who the associations are, which university
and courses they represent, which sports they compete in, where and when they train, and
when tryouts (*processos seletivos*) happen.

The catalog of associations and championships is loaded from remote JSON, so the content
can be updated without shipping a new version of the app.

UniEsportes is **live on the App Store** — [download it here](https://apps.apple.com/br/app/uniesportes/id6747092775).

---

## 🚀 Features

- **🔎 Search** — find any athletic association by name with native SwiftUI search.
- **🏟️ Association page** — university, courses, description, events and a direct **Contact** button.
- **⚽ Sports carousel** — every sport the association plays, each with its own SF Symbol; tap one to see location, category, training schedule, awards and tryout dates.
- **⭐ Favorites** — save associations locally and find them again in the Favorites tab.
- **🏆 Championships** — the main university championships, each opening its official website.

---

## ⚙️ How It Works

1. On launch, the app fetches the associations and championships catalogs over the network.
2. The **Pesquisar** (search) tab lists every association; tap one to open its page.
3. On the association page, browse the sports carousel and tap **Favoritar** to save it.
4. Favorites are persisted on the device and shown in the **Favoritos** tab.
5. The **Campeonatos** tab lists championships and opens each one's website.

Under the hood, `Json` and `Tjson` fetch the catalogs with `URLSession` and `async/await`
and decode them into `Codable` models. Favorites go through `CoreDataController`, a
singleton wrapping an `NSPersistentContainer`, exposed to the views by `ContentViewModel`.

---

## 🛠️ Tech Stack

| Area | Tech |
|------|------|
| UI | SwiftUI |
| Networking | URLSession (async/await) · Codable |
| Persistence | Core Data |
| Architecture | MVVM |

---

## 📂 Project Structure

```
EsportesUniversitarios/
├── EsporteUniversitarioApp.swift   # App entry
├── ContentView/                    # TabView + ContentViewModel
├── SearchScreen/                   # Association search
├── AtleticasPage/                  # Association page, sports carousel and details
├── FavoriteView/                   # Saved associations
├── CampeonatoView/                 # Championships list
├── Data/                           # Codable models, network requests, CoreDataController
└── Assets.xcassets/                # Association logos, colors, icons
```

---

## 🎯 Getting Started

### Requirements

- Xcode 16+
- iOS 18.5+
- Internet connection (the catalogs are loaded from remote JSON)

### Run

```bash
git clone https://github.com/JonasFNMelo/EsporteUniversitario.git
cd EsporteUniversitario
open EsportesUniversitarios/EsportesUniversitarios.xcodeproj
```

Then pick an iPhone simulator and run (`⌘R`).

---

## 👥 Authors

Built at **Universidade Presbiteriana Mackenzie**.

<table width="100%">
  <tr>
    <td align="center" width="33%">
      <a href="https://github.com/camilatoniato"><img src="https://github.com/camilatoniato.png" width="80" alt="Camila Toniato"/></a>
      <br/><sub><b>Camila Toniato</b></sub><br/>
      <a href="https://github.com/camilatoniato"><img src="https://skillicons.dev/icons?i=github" alt="GitHub"/></a>
      <a href="https://www.linkedin.com/in/camilatoniato/"><img src="https://skillicons.dev/icons?i=linkedin" alt="LinkedIn"/></a>
    </td>
    <td align="center" width="33%">
      <a href="https://github.com/JoaoPioltini"><img src="https://github.com/JoaoPioltini.png" width="80" alt="João Pioltini"/></a>
      <br/><sub><b>João Pioltini</b></sub><br/>
      <a href="https://github.com/JoaoPioltini"><img src="https://skillicons.dev/icons?i=github" alt="GitHub"/></a>
    </td>
    <td align="center" width="33%">
      <a href="https://github.com/JonasFNMelo"><img src="https://github.com/JonasFNMelo.png" width="80" alt="Jonas Melo"/></a>
      <br/><sub><b>Jonas Melo</b></sub><br/>
      <a href="https://github.com/JonasFNMelo"><img src="https://skillicons.dev/icons?i=github" alt="GitHub"/></a>
      <a href="https://www.linkedin.com/in/jonas-melo-/"><img src="https://skillicons.dev/icons?i=linkedin" alt="LinkedIn"/></a>
    </td>
  </tr>
</table>
