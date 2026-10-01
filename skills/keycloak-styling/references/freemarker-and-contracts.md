# FreeMarker i kontrakty Keycloak

## Ograniczaj nadpisywanie szablonów

Stosuj następującą kolejność preferencji:

1. Skonfiguruj obsługiwane właściwości motywu lub zachowanie profilu użytkownika.
2. Nadpisz komunikaty.
3. Dodaj lub nadpisz style i zasoby.
4. Użyj obsługiwanych miejsc układu lub makr.
5. Nadpisz cały szablon tylko wtedy, gdy wcześniejsze rozwiązania nie pozwalają spełnić wymagania.

Każdy skopiowany szablon źródłowy staje się obowiązkiem podczas aktualizacji. Jeśli to praktyczne, zapisz jego źródłową wersję Keycloak w dokumentacji projektu lub kontekście kontroli wersji.

## Zachowaj kontrakt serwera

Zmieniając szablon, porównaj go z tym samym szablonem z dokładnej docelowej wersji Keycloak. Zachowaj poniższe elementy, chyba że wymagane zachowanie jawnie wymaga obsługiwanej zmiany:

- `action` i `method` formularza oraz wymagane pola ukryte;
- `name`, wartość, `autocomplete`, stan `disabled` i zachowanie `readonly` pola;
- adresy URL i ścieżki zasobów dostarczane przez serwer;
- renderowanie błędów pól i komunikatów globalnych;
- rozgałęzienia warunkowe zależne od konfiguracji realmu i stanu uwierzytelniania;
- ścieżki dostawców tożsamości, rejestracji, odzyskiwania, WebAuthn, OTP i wymaganych działań obecne w szablonie źródłowym;
- wartości związane z CSRF-em lub sesją udostępniane przez Keycloak;
- kolejność tabulacji, etykiety, opisy i zachowanie fokusu.

Nie wyprowadzaj zmiennej kontekstu z innego wydania Keycloak. Sprawdź wbudowany szablon źródłowy, typy narzędzia motywu lub dane kontekstu wykonawczego.

## Utrzymuj prezentacyjny charakter szablonów

- Używaj FreeMarkera do renderowania warunkowego i małych przekształceń prezentacyjnych.
- Przenoś powtarzalny znacznik do makr, jeżeli makro ma czytelny kontrakt wejściowy.
- Pozostaw złożone decyzje biznesowe po stronie serwera lub w istniejącej warstwie adaptera.
- Unikaj głęboko zagnieżdżonych dyrektyw. Nazywaj warunki pośrednie, gdy zwiększa to czytelność.
- Skupiaj szablony stron na kompozycji.
- Dodawaj krótkie komentarze tylko przy nieoczywistych ograniczeniach Keycloak lub odstępstwach istotnych podczas aktualizacji.

Nie twórz ogólnego makra z wieloma flagami logicznymi. Preferuj mniejsze makra semantyczne albo pozostaw unikalny znacznik w pliku strony.

## Stosuj poprawne kodowanie wyjścia i komunikaty

- Koduj wartości dynamiczne odpowiednio do kontekstu wyjściowego: tekstu, atrybutu, adresu URL lub skryptu.
- Nie używaj `?no_esc` ani podobnego surowego renderowania bez udokumentowanego, zaufanego i oczyszczonego kontraktu.
- Traktuj szczegóły błędów, nazwy użytkowników, wartości zapytań i wartości skonfigurowane w realmie jako niezaufane.
- Używaj kluczy komunikatów dla tekstów widocznych dla użytkownika.
- Zachowuj parametry komunikatów i formatowanie oczekiwane przez Keycloak.
- Nie osadzaj HTML-a w tłumaczeniach jako ogólnej metody renderowania; bieżąca obsługa komunikatów motywu logowania Keycloak oczekuje zwykłego tekstu poza jawnie udokumentowanymi wyjątkami.

## Obsługuj adresy URL i zasoby

- Używaj adresów akcji i nawigacji dostarczanych przez Keycloak.
- Używaj właściwego adresu lub ścieżki zasobu motywu dostarczanej przez kontekst szablonu.
- Nie składaj ręcznie endpointów uwierzytelniania ani adresów środowiska.
- Używaj bezwzględnych adresów zasobów dla obrazów w wiadomościach e-mail, gdy wymaga tego API Keycloak.
- Utrzymuj konfigurowalność linków zewnętrznych i sprawdzaj zamierzone zachowanie atrybutów `target` oraz `rel`.

## Stosuj dziedziczenie i właściwe pakowanie

- Rozszerzaj wbudowany motyw; nigdy go bezpośrednio nie edytuj.
- Utrzymuj `theme.properties` w minimalnej formie uwzględniającej wersję.
- Wskazuj style i skrypty za pomocą obsługiwanych właściwości motywu.
- Importuj wspólne zasoby świadomie. Nie zakładaj, że ścieżki z innego wydania Keycloak są poprawne.
- Preferuj wersjonowane archiwum do powtarzalnego wdrażania produkcyjnego, jeżeli pasuje do modelu dostarczania projektu.
- Instaluj motywy tylko z zaufanych źródeł i ograniczaj możliwość zapisu wdrożonych szablonów zaufanym operatorom.

## Lista kontrolna przeglądu

- Czy każde nadpisanie rozwiązuje problem, którego nie da się obsłużyć CSS-em, komunikatami lub konfiguracją?
- Czy do porównania użyto dokładnej wersji źródłowej?
- Czy zachowano wszystkie źródłowe rozgałęzienia bezpieczeństwa i stanów?
- Czy wartości zakodowano odpowiednio do kontekstu wyjściowego?
- Czy nazwy formularzy, akcje i adresy serwera pozostały niezmienione?
- Czy teksty dla użytkownika znajdują się w paczkach komunikatów?
- Czy osoba wykonująca przyszłą aktualizację szybko rozpozna lokalne zmiany w diffie?
