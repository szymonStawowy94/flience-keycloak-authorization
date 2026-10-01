---
name: keycloak-styling
description: Implementowanie, refaktoryzowanie i przeglądanie przenośnych motywów oraz widoków interfejsu Keycloak z czytelnym podziałem na pliki, bezpieczną obsługą szablonów, dostępnym stylowaniem, lokalizacją i odpornością na aktualizacje. Używaj podczas pracy z natywnymi motywami FreeMarker, plikami theme.properties, widokami logowania, konta i wiadomości e-mail, CSS-em lub JavaScriptem motywu oraz istniejącymi narzędziami do tworzenia motywów.
version: 1.1.0
author: j.olcha@pleodigital.com
scope: SHARED
category: Frontend
tags:
  - keycloak
---

# Keycloak Styling

Buduj widoki Keycloak, które zachowują poprawne działanie uwierzytelniania, a jednocześnie pozostają łatwe w rozwijaniu i aktualizowaniu w różnych, niepowiązanych projektach.

## Kiedy pominąć skill

Pomiń ten skill przy zmianach konfiguracji realmów, dostawców tożsamości, polityk uwierzytelniania i aplikacji klienckich, jeżeli zadanie nie obejmuje plików, zasobów ani narzędzi motywu Keycloak.

## Przebieg pracy

1. Zbadaj repozytorium przed zaproponowaniem struktury.
   - Ustal docelową wersję Keycloak na podstawie konfiguracji projektu lub plików wdrożeniowych.
   - Rozpoznaj sposób implementacji: natywny FreeMarker, pakowany provider albo rozwiązanie hybrydowe.
   - Odczytaj istniejące polecenia budowania, formatowania i pakowania motywu.
   - Znajdź źródłowy szablon lub komponent odpowiadający każdemu nadpisywanemu widokowi.
2. Określ najmniejszą potrzebną zmianę.
   - Preferuj właściwości motywu, paczki komunikatów, CSS i istniejące punkty rozszerzeń zamiast zastępowania szablonów.
   - Nadpisuj tylko te szablony lub komponenty, które są niezbędne do uzyskania oczekiwanego zachowania.
   - Zachowaj akcje formularzy Keycloak, nazwy pól, adresy URL, rozgałęzienia stanów i renderowanie związane z bezpieczeństwem.
3. Zaplanuj granice plików przed implementacją.
   - Oddziel kompozycję strony od współdzielonego interfejsu, reguł prezentacji, zachowań, tłumaczeń i zasobów.
   - Stosuj poprawne konwencje istniejącego repozytorium; poprawiaj granice stopniowo zamiast narzucać nową architekturę.
   - Przeczytaj [project-structure.md](references/project-structure.md), aby poznać zasady struktury i podziału kodu.
4. Zaimplementuj zmianę według właściwych wskazówek.
   - Przy pracy z natywnymi plikami `.ftl` przeczytaj [freemarker-and-contracts.md](references/freemarker-and-contracts.md).
   - Przy pracy z CSS-em, tokenami, responsywnością i zasobami przeczytaj [styling-and-assets.md](references/styling-and-assets.md).
   - Przy pracy z JavaScriptem działającym w przeglądarce przeczytaj [frontend-code.md](references/frontend-code.md).
   - Przy pracy z semantyką, klawiaturą, komunikatami i ustawieniami regionalnymi przeczytaj [accessibility-and-localization.md](references/accessibility-and-localization.md).
5. Oceń wpływ na przyszłe aktualizacje.
   - Przeczytaj [upgrades.md](references/upgrades.md).
   - Porównuj zmodyfikowane pliki źródłowe przy każdej zmianie docelowej wersji Keycloak.
   - Preferuj usunięcie nadpisania, gdy może je zastąpić obsługiwana konfiguracja lub punkt rozszerzeń.
6. Zweryfikuj każdą zmianę motywu.
   - Uruchom istniejący build lub polecenie pakowania motywu.
   - Jeżeli repozytorium udostępnia lokalny sposób uruchomienia Keycloak, ręcznie sprawdź zmieniony stan formularza z błędem serwera oraz bez włączonego JavaScriptu.
   - Jeżeli którejś kontroli nie można wykonać, podaj przyczynę w raporcie.
7. Zdaj raport z wyniku.
   - Wymień objęte zmianą widoki i stany.
   - Podaj uruchomione polecenia oraz kontrole, których nie udało się wykonać.
   - Wskaż nowe i zachowane nadpisania źródeł Keycloak, ponieważ zwiększają koszt aktualizacji.

## Zasady bez wyjątków

- Traktuj zachowanie Keycloak i walidację po stronie serwera jako źródło prawdy; kod klienta może poprawiać UX, ale nie może stanowić granicy bezpieczeństwa.
- Nie wymyślaj zmiennych szablonów, pól kontekstu komponentów, parametrów formularzy ani adresów URL. Weryfikuj je względem docelowej wersji i warstwy integracyjnej projektu.
- Nie edytuj wbudowanych motywów Keycloak. Rozszerzaj je albo pakuj osobny motyw.
- Nie wpisuj na stałe nazw realmów, identyfikatorów klientów, adresów środowisk, adresów przekierowań, tłumaczonych tekstów, sekretów ani reguł biznesowych konkretnego projektu.
- Nie renderuj danych użytkownika ani wartości serwerowych jako zaufanego HTML-a, chyba że kontrakt docelowej wersji Keycloak jawnie gwarantuje ich oczyszczenie.
- Nie usuwaj podsumowań błędów, błędów pól, wymaganych pól ukrytych, atrybutów dostępności, obsługi języków ani rozgałęzień warunkowych tylko po to, aby uprościć znacznik.
- Nie dodawaj zależności, narzędzia budowania ani metodyki CSS, jeżeli repozytorium już ich nie używa lub użytkownik jawnie o to nie poprosił.

## Dobór referencji

| Zadanie | Przeczytaj |
| --- | --- |
| Organizacja lub dzielenie kodu motywu | [project-structure.md](references/project-structure.md) |
| Edycja `.ftl`, makr, komunikatów, akcji lub adresów URL | [freemarker-and-contracts.md](references/freemarker-and-contracts.md) |
| Dodawanie lub refaktoryzacja CSS-u, tokenów, fontów, ikon lub obrazów | [styling-and-assets.md](references/styling-and-assets.md) |
| Dodawanie JavaScriptu działającego w przeglądarce | [frontend-code.md](references/frontend-code.md) |
| Przegląd dostępności lub lokalizacji | [accessibility-and-localization.md](references/accessibility-and-localization.md) |
| Przygotowanie lub przegląd aktualizacji Keycloak | [upgrades.md](references/upgrades.md) |

Wczytuj tylko referencje potrzebne do wykonania zadania. Instrukcje konkretnego repozytorium i docelowa wersja Keycloak mają pierwszeństwo przed ogólnymi przykładami.
