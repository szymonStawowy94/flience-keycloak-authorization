# Aktualizacje

## Zachowaj dyscyplinę aktualizacji

Przypnij lub w inny sposób zapisz wersję Keycloak używaną do budowania motywu.

Podczas aktualizacji:

1. Przeczytaj wszystkie informacje migracyjne między bieżącą a docelową wersją, które wspominają motywy, szablony, komunikaty, profil użytkownika, PatternFly, interfejs konta lub logowania albo ścieżki zasobów.
2. Pozyskaj starą i nową wersję źródłową każdego lokalnie nadpisanego szablonu.
3. Porównaj wersję lokalną ze starym źródłem, aby rozpoznać zamierzone dostosowania.
4. Porównaj stare źródło z nowym, aby rozpoznać zmiany Keycloak.
5. Zastosuj ponownie tylko zamierzone dostosowania do nowej struktury źródłowej tam, gdzie nadal trzeba nadpisywać cały szablon.
6. Sprawdź importowane wspólne zasoby, nazwy motywów nadrzędnych, klucze komunikatów i założenia CSS-u.
7. Ponownie zbuduj i spakuj motyw względem docelowej wersji.

Preferuj usunięcie nadpisania, gdy nowsza konfiguracja Keycloak, punkty podpięcia CSS, konfiguracja profilu użytkownika lub punkty rozszerzeń mogą je zastąpić.

## Przygotuj raport ryzyka aktualizacji

Podsumuj:

- docelową wersję Keycloak;
- nadpisane szablony lub punkty wejścia;
- uwzględnione zmiany źródłowe;
- usunięte lub dodane nadpisania;
- sprawdzone ścieżki importowanych zasobów;
- wykonane kontrole i pozostałe luki.

Traktuj każdą pełną kopię szablonu źródłowego jako wysoki koszt aktualizacji. Traktuj dostosowania wyłącznie w CSS-ie i pojedyncze nadpisania komunikatów jako niższy koszt, nadal przeglądając zmiany źródłowego znacznika i komunikatów.

## Korzystaj z autorytatywnych źródeł

Przy zachowaniu zależnym od wersji korzystaj z aktualnej oficjalnej dokumentacji:

- Dostosowywanie motywów Keycloak: <https://www.keycloak.org/ui-customization/themes>
- Przewodnik aktualizacji Keycloak: <https://www.keycloak.org/docs/latest/upgrading/>

Wersja przypięta w projekcie i jej wbudowane źródła mają pierwszeństwo przed przykładami z dokumentacji `latest`.
