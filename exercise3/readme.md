## Losowanie pytań

Napisz klasę reprezentującą pulę pytań.

### Wymagania

* do puli można dodawać pytania
* można pobrać z puli następne pytanie
* można ustawić limit pytań czyli ile pytań ma zwrócić pula n.p.: do puli dodano 100 pytań, ale quiz ma wylosować tylko trzy z nich
* limit pytań nie może być większy niż ilość pytań w quizie
** co jeżeli najpierw ustawię limit, a potem dodam mniej pytań niż wynosi limit?
* jeżeli nie ustawiono limitu pytań to jest równy ilości pytań w quizie
* quiz zwraca pytania losowo, bez powtórzeń
** jak przetestować losowanie? 
*** TODO sprawdzić czy mogę podstawić mock tablicy pytań, żeby upewnić się, że wołany jest na niej sort
*** TODO można rozdzielić funkcję losującą od klasy Quiz, ale jak przetestować funkcję losującą?
* można zresetować quiz, żeby zacząć losowanie od nowa
* limit pytań nie powinien się zmienić po zresetowaniu quizu 

### RFC

* pytań powinna zwracać pytania losowo, ale tak, żeby dwa pytania z jednej kategorii nie występowały jedno po drugim