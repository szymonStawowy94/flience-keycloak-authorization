# Kod frontendowy

## Stosuj progresywne ulepszanie

Pozostaw serwer jako źródło prawdy dla uwierzytelniania. Używaj kodu przeglądarkowego do poprawiania użyteczności, a nie do rozstrzygania poprawności uwierzytelnienia.

- Preferuj natywne zachowanie HTML-a dla formularzy, elementów rozwijanych, podpowiedzi walidacyjnych i fokusu.
- Zachowaj użyteczność głównej ścieżki wysłania formularza, gdy opcjonalny JavaScript zawiedzie, chyba że wybrana integracja Keycloak jawnie wymaga aplikacji klienckiej.
- Nie powielaj walidacji serwera jako niezależnego źródła prawdy.
- Zapobiegaj przypadkowemu wielokrotnemu wysłaniu za pomocą odwracalnego stanu interfejsu, a nie przez zmianę kontraktów serwera.
- Przywracaj użyteczny stan, gdy żądanie się nie powiedzie.

## Wyznacz granice JavaScriptu

- Utrzymuj jeden punkt wejścia na obszar motywu, chyba że system budowania definiuje już inny wzorzec.
- Wydzielaj moduły według zachowania, na przykład widoczności hasła, zarządzania fokusem lub stanu wysyłania.
- Przekazuj do funkcji elementy lub wąską konfigurację; nie pozwalaj każdemu modułowi przeszukiwać całego dokumentu.
- Traktuj wyniki zapytań DOM jako opcjonalne i bezpiecznie kończ działanie w widokach, w których kontrolka nie istnieje.
- Używaj delegowania zdarzeń tylko wtedy, gdy upraszcza dynamiczną zawartość.
- Usuwaj listenery w rozwiązaniach zarządzających cyklem życia widoku.
- Unikaj zmiennych globalnych i obsługi zdarzeń zapisanej bezpośrednio w znaczniku.
- Nie umieszczaj sekretów, tokenów ani wrażliwego kontekstu w logach, atrybutach danych, analityce lub pamięci klienta.

## Zachowaj czytelne granice modułów

- Utrzymuj surowy kontekst Keycloak przy punkcie wejścia i przekazuj współdzielonym modułom wąskie dane wejściowe.
- Preferuj kompozycję zamiast modułu z wieloma flagami trybu.
- Pozostaw rozgałęzienia właściwe dla widoku na stronie, chyba że tworzą stabilny, powtarzalny wzorzec.
- Zachowuj nazwy pól serwera i semantykę wysyłania formularza.
- Nie zastępuj zwykłego linku lub przycisku ogólnym elementem klikalnym.
- Unikaj powielania stanu: gdy to możliwe, wyprowadzaj stan prezentacji z kontekstu lub stanu formularza.

## Ograniczaj zależności

Dodawaj pakiet tylko wtedy, gdy:

- możliwości platformy lub istniejące narzędzia projektu nie zapewniają rozsądnie potrzebnego zachowania;
- działa on w docelowej przeglądarce i środowisku pakowania Keycloak;
- znany jest jego koszt rozmiaru paczki, bezpieczeństwa i utrzymania;
- nie powiela istniejącej zależności.

Przypinaj i aktualizuj zależności zgodnie z zasadami repozytorium. Nigdy nie ładuj zależności strony uwierzytelniania z niezaufanego CDN-u.

## Obsługuj błędy i logowanie

- Pokazuj użytkownikom konkretne, przetłumaczone informacje zwrotne.
- Zachowuj błędy pól i błędy globalne zwrócone przez serwer.
- Nie ujawniaj śladów stosu, wewnętrznych identyfikatorów, tokenów ani surowych treści odpowiedzi.
- Używaj logowania deweloperskiego oszczędnie i przed przekazaniem usuń wrażliwe lub hałaśliwe logi.
- Pozwalaj opcjonalnym ulepszeniom zawieść bez blokowania podstawowego formularza.
