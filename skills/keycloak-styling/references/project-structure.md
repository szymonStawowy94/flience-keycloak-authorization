# Struktura projektu i granice plików

## Spis treści

- Zacznij od istniejącego zestawu narzędzi
- Rozdziel odpowiedzialności
- Struktura natywnego motywu
- Reguły podziału
- Nazewnictwo
- Pliki generowane i zależności

## Zacznij od istniejącego zestawu narzędzi

Rozpoznaj typ motywu i granicę procesu budowania przed przenoszeniem plików:

- W natywnych motywach zwykle organizuj pliki pod ścieżką `<theme-name>/<type>/`.
- W pakowanych motywach umieszczaj tę samą strukturę pod katalogiem `theme/` wewnątrz archiwum.
- Niektóre repozytoria zawierają zarówno pliki źródłowe, jak i wygenerowane artefakty motywu. Przed edycją ustal, które pliki są źródłem prawdy.

Nie kopiuj przykładowego drzewa bez analizy. Zachowaj konwencje repozytorium, jeżeli nie powodują konkretnego problemu z utrzymaniem.

## Rozdziel odpowiedzialności

Stosuj następujące granice:

- **Strona lub widok:** składaj jeden stan procesu Keycloak i łącz kontekst serwera z interfejsem.
- **Układ:** utrzymuj wspólną ramę dokumentu lub strony, punkty orientacyjne i współdzielone miejsca na zawartość.
- **Fragment lub makro:** renderuj powtarzalny wzorzec interfejsu o wąskim kontrakcie wejściowym.
- **Funkcja pomocnicza:** wykonuj małe przekształcenie prezentacyjne, które nie należy do kompozycji strony.
- **Style:** utrzymuj reguły i stany wizualne, a nie logikę uwierzytelniania.
- **Zachowanie:** utrzymuj opcjonalne interakcje przeglądarkowe i progresywne ulepszanie.
- **Komunikaty:** utrzymuj teksty dla użytkownika i tłumaczenia.
- **Zasoby:** utrzymuj obrazy, ikony i fonty wskazywane przez ścieżki zasobów motywu.

Nie łącz w jednym pliku niepowiązanego znacznika stron, dużych bloków stylów, tłumaczeń i zachowania przeglądarkowego.

## Struktura natywnego motywu

Stosuj strukturę podobną do poniższej tylko wtedy, gdy dane pliki są potrzebne:

```text
<theme-name>/
└── login/
    ├── theme.properties
    ├── template.ftl
    ├── login.ftl
    ├── error.ftl
    ├── messages/
    │   ├── messages_en.properties
    │   └── messages_<locale>.properties
    └── resources/
        ├── css/
        │   └── styles.css
        ├── js/
        │   └── login.js
        ├── img/
        └── fonts/
```

## Reguły podziału

Wydziel kod, gdy zachodzi co najmniej jeden warunek:

- Ten sam wzorzec występuje w co najmniej dwóch widokach.
- Blok ma własną interakcję lub kontrakt dostępności.
- Plik strony łączy adaptację kontekstu z dużą ilością znacznika.
- Plik trudno zrecenzować, ponieważ przeplatają się w nim niepowiązane zmiany.

Pozostaw kod lokalnie, gdy jego wydzielenie:

- Tworzyłoby jednoliniowe przekierowanie bez wyraźniejszego kontraktu.
- Ukrywałoby rozgałęzienie właściwe dla Keycloak, które trzeba porównywać ze źródłem.
- Wymagałoby wielu luźno powiązanych parametrów logicznych.
- Łączyłoby niepowiązane widoki przedwcześnie uogólnioną abstrakcją.

Preferuj kilka spójnych modułów zamiast monolitu lub dziesiątek drobnych fragmentów.

## Nazewnictwo

- Nazywaj strony zgodnie z nazwami procesów lub szablonów Keycloak, gdy ułatwia to porównanie ze źródłem.
- Nazywaj współdzielone elementy interfejsu według roli, na przykład `FormField`, `Alert` lub `AuthLayout`, a nie wyglądu, takiego jak `BlueBox`.
- Nazywaj klasy CSS według komponentu i stanu. W fundamentach wielokrotnego użytku unikaj nazw realmów, klientów, kampanii i odbiorców.
- Nazywaj zmienne i właściwości zgodnie z ich znaczeniem. Unikaj skrótów, chyba że są utrwalonymi terminami Keycloak.

## Pliki generowane i zależności

- Nigdy nie edytuj ręcznie wygenerowanego wyniku motywu.
- Zapisuj wygenerowany wynik w repozytorium tylko wtedy, gdy projekt już stosuje taką praktykę.
- Dodawaj zależności rzadko i tylko wtedy, gdy przynoszą powtarzalną wartość.
- Przy małych interakcjach preferuj możliwości platformy.
- Oddziel konfigurację budowania od kodu widoków.
