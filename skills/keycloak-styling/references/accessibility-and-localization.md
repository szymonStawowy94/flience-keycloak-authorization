# Dostępność i lokalizacja

## Stosuj strukturę semantyczną

- Używaj jednego znaczącego nagłówka strony i logicznej hierarchii nagłówków.
- Używaj punktów orientacyjnych tylko wtedy, gdy usprawniają nawigację.
- Używaj natywnych elementów `form`, `label`, `input`, `button` i `a`.
- Nadawaj każdej kontrolce formularza dostępną nazwę.
- Łącz tekst pomocy i błędu z właściwą kontrolką za pomocą odpowiednich relacji.
- Utrzymuj kolejność DOM-u zgodną z kolejnością odczytu i obsługi klawiaturą.
- Nie zastępuj etykiet placeholderami.

## Obsługuj błędy i statusy

- Zachowuj zarówno globalne podsumowanie błędów, jak i błędy poszczególnych pól, gdy proces je udostępnia.
- Po nieudanym wysłaniu świadomie przenoś fokus lub ogłaszaj zmianę, nie tworząc pułapki fokusu.
- Używaj żywych regionów tylko dla treści zmieniającej się po pierwszym renderowaniu.
- Twórz konkretne błędy i łącz je z odpowiednimi polami.
- Nie ujawniaj istnienia konta, gdy proces Keycloak celowo zapobiega enumeracji użytkowników.
- Utrzymuj rozróżnialność sukcesu, ostrzeżenia, informacji i błędu bez polegania wyłącznie na kolorze.

## Obsługuj klawiaturę i fokus

- Zapewniaj działanie każdego elementu interaktywnego za pomocą klawiatury.
- Utrzymuj widoczny wskaźnik `:focus-visible`.
- Nie używaj dodatniego `tabindex`.
- Nie ustawiaj automatycznego fokusu domyślnie, jeżeli powoduje problemy z klawiaturą ekranową, czytnikiem ekranu lub nawigacją po błędach.
- Przywracaj fokus po zamknięciu tymczasowego interfejsu.
- Unikaj niestandardowych kontrolek, gdy natywne elementy spełniają potrzebę.

## Obsługuj pola uwierzytelniania

- Zachowuj użyteczne tokeny `autocomplete` dostarczane przez docelowy szablon Keycloak.
- Dobieraj typy pól i tryby wprowadzania do rodzaju wartości.
- Zachowuj działanie menedżerów haseł.
- Nie blokuj wklejania do pól danych uwierzytelniających, OTP lub odzyskiwania bez jawnego, obsługiwanego wymagania.
- Nadawaj kontrolkom odkrywania hasła dostępną nazwę i stan.
- Jeśli istnieje niestandardowa logika, pozwalaj polom OTP obsługiwać typowe wklejanie i odstępy.

## Stosuj lokalizację

- Umieszczaj teksty widoczne dla użytkownika w paczkach komunikatów lub obsługiwanym systemie komunikatów.
- Wykorzystuj istniejące klucze komunikatów Keycloak, gdy ich znaczenie jest zgodne.
- Dodawaj komplet wpisów językowych dla zmienionego obszaru.
- Zachowuj parametry komunikatów i reguły interpolacji.
- Nie składaj zdań z osobno przetłumaczonych fragmentów.
- W razie potrzeby obsługuj liczbę mnogą przez mechanizm lokalizacyjny projektu.
- Nie umieszczaj znacznika w tłumaczeniach, chyba że udokumentowany kontrakt Keycloak jawnie na to pozwala.

## Dostosuj układ do języków

- Zakładaj, że etykiety i komunikaty mogą znacznie się wydłużyć.
- Unikaj stałych wysokości i wąskich stałych szerokości.
- Pozwalaj przyciskom i elementom nawigacji zawijać się bez zmiany znaczenia.
- Używaj logicznych właściwości CSS tam, gdzie ograniczają założenia związane z kierunkiem od lewej do prawej.
- Sprawdzaj kierunek od prawej do lewej, jeżeli projekt go obsługuje.
- Formatuj daty, liczby i nazwy za pomocą mechanizmów uwzględniających ustawienia regionalne, zamiast ręcznie składać tekst.
