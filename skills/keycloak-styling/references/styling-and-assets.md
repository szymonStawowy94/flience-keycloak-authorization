# Stylowanie i zasoby

## Zbuduj mały system stylowania

Preferuj płytką kaskadę:

1. tokeny lub właściwości niestandardowe;
2. reset i fundamenty ograniczone do motywu;
3. układ;
4. komponenty i stany;
5. rzadkie wyjątki właściwe dla stron.

Definiuj powtarzalne wartości tylko raz:

```css
:root {
  --auth-color-text: #1f2937;
  --auth-color-surface: #ffffff;
  --auth-space-2: 0.5rem;
  --auth-space-4: 1rem;
  --auth-radius-control: 0.375rem;
}
```

Używaj neutralnych nazw tokenów opisujących przeznaczenie, a nie konkretnego odbiorcę lub kampanię. Wykorzystaj istniejący system tokenów, jeżeli projekt go posiada.

## Kontroluj zakres i specyficzność

- Jeśli to możliwe, ogranicz fundamenty motywu stabilną klasą korzenia.
- Stosuj krótkie selektory oparte na klasach.
- Unikaj identyfikatorów w stylach, głębokich łańcuchów potomków i `!important`.
- Nie polegaj na przypadkowym zagnieżdżeniu źródłowego DOM-u, jeżeli możesz dodać stabilną klasę lokalną.
- Reprezentuj stan atrybutami lub jawnymi modyfikatorami, takimi jak `[aria-invalid="true"]`, `[disabled]` lub `.field--error`.
- Zachowaj selektory używane przez Keycloak jako punkty podpięcia zachowania.

Używaj warstw kaskady tylko wtedy, gdy pozwalają na to obsługiwane przeglądarki i istniejące narzędzia projektu.

## Buduj responsywny układ

- Zaczynaj od wąskich obszarów roboczych.
- Unikaj stałej wysokości i szerokości kart, które mogą ucinać tłumaczenia.
- Używaj płynnych ograniczeń, takich jak `min()`, `max()`, `clamp()` i `max-inline-size`.
- Pozwalaj zawijać długie adresy e-mail, nazwy realmów, komunikaty błędów i przetłumaczone etykiety.
- Obsługuj powiększenie i zwiększony rozmiar tekstu bez przewijania poziomego przy typowych wąskich szerokościach.
- Uwzględniaj klawiatury ekranowe i małą wysokość obszaru roboczego.
- Nie zapisuj kolejności źródłowej właściwej tylko dla komputerów, gdy zmienia się kolejność wizualna.

## Styluj stany interakcji

Styluj co najmniej:

- stan domyślny, `hover`, `active` i `focus-visible`;
- stan `disabled` i `readonly`;
- błąd pola i błąd globalny;
- ładowanie lub oczekiwanie, gdy widok je obsługuje;
- zaznaczenie lub bieżący element, gdy ma zastosowanie.

Nigdy nie komunikuj błędu ani zaznaczenia wyłącznie kolorem. Utrzymuj widoczny fokus co najmniej tak wyraźny jak pozostałe elementy języka wizualnego.

Uwzględniaj:

- `prefers-reduced-motion`;
- `prefers-color-scheme`, gdy motyw obsługuje tryb ciemny;
- tryb wymuszonych kolorów lub wysokiego kontrastu, gdy ma zastosowanie.

Animacja nie może opóźniać działań uwierzytelniania ani ukrywać zmian stanu.

## Obsługuj zasoby

- Przechowuj zasoby motywu w katalogach zasobów motywu lub wyznaczonym katalogu źródłowym.
- Wskazuj zasoby przez adresy dostarczane przez Keycloak lub istniejące narzędzie budowania, zamiast zgadywać ścieżki względem wdrożenia.
- Dla prostych ikon i logo preferuj SVG, jeśli jest dozwolone; nadawaj dostępne nazwy tylko obrazom przekazującym informację.
- Używaj pustego tekstu alternatywnego dla obrazów dekoracyjnych.
- Optymalizuj wymiary i formaty obrazów.
- Nie osadzaj dużych zasobów jako base64 w szablonach ani stylach.
- Deklaruj fonty zapasowe i ograniczaj liczbę niestandardowych grubości.
- Przed dodaniem plików potwierdź licencje fontów i zasady pakowania.

### Animacje i Lottie

- Traktuj animację jako dekoracyjne, opcjonalne ulepszenie: nie może opóźniać formularza ani komunikatu o błędzie.
- Do motywu dołączaj tylko wymagany, wersjonowany plik playera oraz plik animacji; nie kopiuj całego katalogu `node_modules`.
- Uwzględniaj `prefers-reduced-motion` i zapewnij bezpieczny stan, gdy player lub animacja się nie załadują.
- Keycloak przeładowuje strony między ekranami. Nie obiecuj ciągłości klatki Lottie między widokami; wybierz statyczny zasób, brak fallbacku albo opóźnione uruchomienie wyłącznie po ocenie rzeczywistego odbioru.

## Sprawdź jakość CSS-u

- Uruchom istniejący formatter.
- Wyszukaj powielone wartości wpisane na stałe, które powinny być tokenami.
- Po zmianie szablonów sprawdź nieużywane selektory.
- Upewnij się, że żaden selektor przypadkowo nie wpływa na konsolę administracyjną, konsolę konta ani inny typ motywu.
- Sprawdź stany przy obsłudze klawiaturą, powiększeniu, wąskim układzie i długim przetłumaczonym tekście.
