# Lokalizacja i weryfikacja motywu

## Kiedy stosować

Przeczytaj tę referencję, gdy motyw dodaje języki, zmienia treści w więcej niż jednym języku albo dotyka przełącznika języka.

## Konfiguracja motywu i realmu

Użyj natywnego mechanizmu Keycloak. Dla typu motywu `login` utrzymuj paczki w następującej lokalizacji:

```text
<theme>/login/
  theme.properties
  messages/
    messages_pl.properties
    messages_en.properties
```

- Dodaj wszystkie wspierane języki do `locales` w `theme.properties`.
- W każdym bundle utrzymuj etykiety przełącznika, na przykład `locale_pl` i `locale_en`.
- Używaj `${msg("key")}` w FTL dla tekstów widocznych dla użytkownika. Pozostaw wbudowane klucze Keycloak, gdy ich znaczenie jest zgodne.
- Nie zapisuj bundle w `resources/messages`; Keycloak oczekuje katalogu `messages` bezpośrednio pod typem motywu.
- Przełącznik renderuj tylko z `locale.supported` i URL-i dostarczonych przez Keycloak. Nie buduj ręcznie URL-i z `kc_locale`.

Lokalizacja jest odtwarzalna tylko wraz z konfiguracją realmu. Przy zmianie języków sprawdź eksport realmu pod kątem:

- `internationalizationEnabled`,
- `supportedLocales`,
- `defaultLocale`,
- przypisanego motywu login.

Eksport przy starcie Keycloak zwykle importuje realm tylko do pustej bazy. Nie zakładaj, że nadpisze istniejący realm; dla aktualizacji wybierz jawny proces administracyjny lub API.

## Kontrola kompletności

Przed przekazaniem zmiany:

1. Porównaj klucze użyte w `msg(...)` z każdym dodanym bundle i sprawdź brakujące wpisy.
2. Wyszukaj teksty widoczne dla użytkownika wpisane na stałe w FTL i JavaScripcie. Pozostaw tylko dane kontraktowe, takie jak stabilne `value` opcji.
3. Zweryfikuj składnię zmienionego JavaScriptu i wykonaj `git diff --check`.
4. Jeżeli lokalny Keycloak jest dostępny, wyrenderuj każdy zmieniony widok w każdym języku. Sprawdź `html[lang]`, tekst przełącznika i brak błędów FreeMarkera.
5. Sprawdź najdłuższy tekst w wąskim układzie, komunikat błędu i stan bez JavaScriptu.

Jeśli flow wymaga PKCE, action tokenu albo aktywnej sesji, wykorzystaj istniejący scenariusz testowy projektu. Nie osłabiaj klienta ani polityk realmu wyłącznie po to, aby wyrenderować widok testowy.
