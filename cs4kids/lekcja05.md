---
layout: page
title: Lekcja 5
---

# Tablice i pętle for/foreach

W poprzednim rozdziale poznaliśmy funkcje oraz nauczyliśmy się, jak dzięki nim pisać "czystszy kod". 
W tym rozdziale poznamy konstrukcje, które pozwalają na przetwarzanie dużej ilości danych.

## Tablice 

Jak już wiemy, jednym z podstawowych konstrukcji, które pozwalają naszemu programowi na zapisywanie danych w pamięci komputera są zmienne (mają one swój typ, nazwę oraz pozwalają na przechowywanie wartości). Typy które poznaliśmy dotychczas, pozwalają na zapisywanie jednej wartości - takiej jak liczba, napis itp. Na przykład:

```csharp
var nazwaUcznia = "Jan Kowalski";
```

W kodzie powyżej utworzyliśmy zmeinną o nazwie "nazwaUcznia", typie `string` (typ ten został określony przez kompilator, dlatego że przypisaliśmy do tej zmiennej *literał* o typie string) i przypisaliśmy do tej zmiennej wartość "Jan Kowalski".
Co jednak, kiedy chcemy zapisać nazwy wszystkich uczniów w całej klasie? Moglibyśmy utworzyć np. 30 zmiennych i do każdej z nich zapisać imię i nazwisko innej osoby. Jednak to byłoby dość niewygodne - mielibyśmy aż 30 zmiennych i musielibyśmy później zajmować się każdą zmienną osobno. Wygodniejsze byłoby stworzenie jednej konstrukcji, która pozwalałaby zapisanie nazw wszystkich uczniów w klasie. Z pomoca przychodzą nam **tablice**.


### Czym jest tablica w języku C#, jak je się tworzy i używa?

Tablica jest *strukturą danych* (czyli konstrukcją, która pozwala na przechowywanie danych), która zawiera pewną liczbę zmiennych określonego typu (zwanych "elementami tablicy"). Możemy dostawać się do tych zmeinnych (czyli odczytywać lub zapisywać ich wartości) poprzez tak zwane *indeksy*. 

### Jak stworzyć tablicę

Spójżmy na przykład:

```csharp
string[] nazwyUczniow = new string[30];
```

możemy to samo  zapisać krócej przy użyciu słówka `var`:

```csharp
var nazwyUczniow = new string[30];
```

Powyższe przykłady są one równoważne, czyli robią to samo. Zalecane jest stosowanie sposobu drugiego - czyli ze słówkiem var - chyba że chcemy tylko "zadeklarować" samą tablicę (czyli jedynie ją "zapowiedzieć" ale jeszcze jej nie tworzyć):

```csharp
string[] nazwyUczniow; // zadeklarowaliśmy nową tablice, ale jej jeszcze nie możemy 
						// używać bo jej nie stworzyliśmy 

nazwyUczniow = new string[30]; // ok, teraz tablica jest stworzona i przypisana
						// do indentyfikatora "nazwyUczniow"
```

Przypatrzmy się po kolei co musimy napisać, żeby stworzyć tablicę (według sposobu ze słówkiem `var`):

1) piszemy słówko `var`
2) wymyślamy nazwę dla naszej tablicy (reguły tworzenia nazwy dla tablic są takie same jak dla nazw zmiennych)
3) używamy operator przypisania '=',
4) Po prawej stronie operatora przypisania używamy słówka "new" (z angielskiego "nowy")
5) określamy jaki będzie typ elementów tablicy  - w naszym przykładzie `string`
6) otwieramy nawias "prostokątny" - `[`
7) piszemy jaka będzie długość danej tablicy, czyli ile maksymalnie elementów chcemy przechowywać w naszej tablicy (w naszym przykładzie - 30 - zakładamy że w klasie może być maksymalnie 30 osób..)
8) zamykamy "nawias prostokątny" - `]`
9) Stawiamy średnik - `;`

Ok, udało nam się utworzyć naszą pierwszą tablicę. Posiada ona 30 elementów, w których możemy przechowywać napisy. Zaraz po utworzeniu, każdy z elementów będzie już nawet miał przypisaną domyślną (wstępną) wartość:

- dla typu `string` jest to wartość `null` czyli "wartość pusta",
- dla typów liczbowych (całkowitych, rzeczywistych) doyślną wartością jest zero,
- dla typu logicznego `bool` jest to wartość `false`.

Spróbuj sam utworzyć swoje tablice, na przykład:
 - tablicę liczb całkowitych o nazwie "ważneDaty" w której będzie można  przechowywać ważne daty (lata) w historii Polski 😊
 - tablicę liczb rzeczywistych (`double`) w której będziemy mogli przechowywać ceny różnych gier - sam wymyśl nazwę dla tej tablicy.

### Dostęp do elementów tablicy

Ok, tablica jest stworzona. Teraz dowiedzmy się, w jaki sposób możemy skorzystać z tej tablicy - czyli, jak możemy dostać się do elementów tablicy. Służą do tego tak zwane "indeksy", czyli "numery" każdego elementu: każdy element posiada swój własny numer. W języku C# numerowanie elementów tablicy zawsze zaczyna się ok zera (czyli pierwszy element tablicy ma *indeks* 0, drugi element tablicy ma indeks 1, .. trzydziesty element tablicy ma indeks 29).

Popatrzmy na przykład:

```csharp
nazwyUczniow[0] = "Jan Kowalski";
nazwyUczniow[1] = "Adam Nowak";
```

W powyższym przykładzie zapisaliśmy do dwóch elementów tablicy (pierwszego i drugiego, czyli: do elementu o indeksie 0 i indeksie 1) wartości.

A tak odczytujemy z elementy tablicy:

```csharp
var nazwaUcznia = nazwyUczniow[1];
```

Indeksem elementu tablicy jest liczba całkowita. Może to być *literał* tak w przykładzie powyżej, ale może to być również np. zmienna typu całkowitego:

```csharp
var indeksWTablicy = 2;
nazwyUczniow[indeksTablicy] = "Anna Kowalska"; // zapisujemy do elementu o indeksie 2
```

Może to być również wyrażenie, którego wartością jest liczba całkowita;

```csharp
var n = 5;
nazwyUczniow[n * 2 - 1] = "Aleksandra Nowak"; // zapisujemy do elementu o indeksie ..
									// ..9 (bo 5 * 2 - 1 = 9)
```

Elementy tablicy w języku C# są zmiennymi i możemy ich używać tak samo jak poznane dotychczas zmienne. Możemy więc np. użyć element tablicy w wyrażeniu i/lub jako parametr podczas wywoływania funkcji.

```csharp
Console.WriteLine("Witaj " + nazwyUczniow[0]);
```


### Inicjalizacja tablicy

Poznaliśmy już jeden sposób tworzenia tablicy (przy użyciu słówka `new` oraz podanie rozmiaru tablicy). W C# możemy też tworzyć tablice i jednocześnie przypisując wartości jej elementom. Popatrzmy na przykład:

Sposób 1:
```csharp
var tytulyGier = new string[] {"FIFA 23", "Fortnite"};
```

Sposób 2:
```csharp
string[] tytulyGier = {"FIFA 23", "Fortnite"};
```

Oba sposoby są jednoznaczne (robią to samo):
 - tworzą tablicę o elementach typu `string` i  nazwie "tytulyGier",
 - rozmiar tablicy będzie wynosić 2 (ponieważ inicjalizując tablicę podajemy 2 napisy),
 - do elementu o indeksie 0 przypisana zostanie wartość "FIFA 23" a do indeksu o numerze 1 - wartość "Fortnite".

Krótko mówiąc jest to skrócony zapis kodu który inaczej możemy zapisać tak:

```csharp
var tytulyGier = new string[2];
tytulyGier[0] = "FIFA 23";
tytulyGier[1] = "Fortnite";
```

### Długość tablicy

W języku C# długość tablicy podajemy zawsze, kiedy tablicę tworzymy (albo bezpośrednio, albo też - jeśli korzystamy z inicjalizatora tablicy - pośrednio, wymianiając elementy tablicy). Często jednak potrzebujemy wiedzieć jaki jest rozmiar tablicy już po jej stworeniu. Na przykład - będziemy tego potrzebować, pisząc funkcję, której parametrem będzie typ tablicowy: podczas pisania tej funkcji nie wiemy jeszcze jaka konkretna tablica zostanie użyta jako parametr wywołanai funkcji. Na szczęście każda tablica ma `właściwość` o nazwie `Length` (z angielskiego - długość). Możemy z niej skorzystać poprzez odwołanie "nazwaTablicy.Length". Popatrzmy na przykład:

```csharp
void NapiszCzyTablicaMaCoNajmniej5Elementow(int[] tablica)
{
	if (tablica.Length >= 5)
	{
		Console.WriteLine("Tablica ma 5 elementów lub więcej.");
	}
	else
	{
		Console.WriteLine("Tablica ma mniej niż 5 elementów.");		
	}
}

var tablica1 = new int[10];
var tablica2 = new int[3];

NapiszCzyTablicaMaCoNajmniej5Elementow(tablica2);
NapiszCzyTablicaMaCoNajmniej5Elementow(tablica1);

```

Jesteś w stanie zgadnąć jaki będzie wynik uruchomienia tego programu?

## Pętle "for" i "foreach"

Ok, tablice już mamy opanowane. Przejdźmy teraz do poznania pewnej konstrukcji, które używamy bardzo często ze strukturami danych takimi jak tablce - pętle for i foreach.
Tak na prawdę pętla nie jest dla nas pojęciem całkiem nowym. Już w rozdziale 3 poznaliśmy konstrukcję, za pomocą której możemy zrobić pętlę - instrukcję `while`. Wykorzystaliśmy ją do napisania gry "Zgadula". Jeśli nie pamiętasz - wróć do rozdziału 3 i przypomnij sobie.

### for

Intrukcja `for` jest bardzo podobna do `while`, jednak posiada ona kilka elementów które sprawiają, że jest wygodniejsza w użyciu ze strukturami danych takimi jak tablice. Przyjrzyjmy się przykładowi:

```csharp
var liczbyParzyste = new int[10];
for (int i=0; i < liczbyParzyste.Length; i++)
{
    liczbyParzyste[i] = i * 2;
    Console.WriteLine(liczbyParzyste[i]);
}
```

W przykłądzie powyżej:
1) najpierw tworzymy 10-elementową tablicę liczb całkowitych o nazwię `liczbyParzyste`
2) następnie tworzymy pętle for w następujący sposób:
	1) używamy słóka `for`,
	2) otwieramy nawias,
	3) wewnątrz nawiasu mamy trzy fragmenty (oddzielone od siebie dwoma średnikami)
		1) w pierwszym fragmencie możemy stworzyć i zainicjalizować zmienną (lub zmienne), którą możemy używać wewnątrz pętli,
		2) w drugim - podajemy tzw. warunek logiczny - tak długo jak warunek ten będzie spełniony (czyli będzie miałwartość `true`) - blok kodu pętli będzie wykonywany,
		3) w trzecim - możemy wpisać instrukcję, która będzie wykonywana po każdym wykonaniu bloku kodu pętli (czyli po każdym tzw. przebiegu pętli),
	4) zamykamy nawias,
	5) Otwieramy blok kodu pętli - nawiasem klamrowym `{` ,
	6) Piszemy kod, który chcemy, żeby wykonywał się wewnątrz pętli
	7) Zamykamu blok kodu pętli - nawiasem klamrowym `}` .

Spróbuj przeanalizować ten fragment kodu i przewidzieć jaki będzie wynik jego wykonania!

Uwaga: jak wspomniałem wcześniej - instrukcje while i for są bardzo do siebie podobne. W zasadzie wszystko co można zrobić za pomocą `while`, da się rónież zrobić za pomocą `for` jak również na odwrót. To którą pętlę zastosujesz - zależy od wygody:
1) jeśli chcemy stworzyć pętle po to, żeby wykonać jakiś kod dla wszystkich ele,emtó struktury takiej jak tablica - wygodniejszy będzie `for`,
2) jeśli chcemy stworzyć pętle po to, żeby wykonywać jakiś kod tak długo aż nastąpi jakieś wydarzenie (ale nie wiemy z góry kiedy ono nastąpi) - wygodniejszy będzie `while`.

### foreach

Instrukcją podobną do `for` jest `foreach`. Jest ona jego nieco uproszczoną wersją -prostszą w zapisie, ale dającą nieco mniej możliwości. Sprawdźmy na przykładzie:

```csharp
var koloryTeczy = new string[] {"czerwony", "pomarańczowy", "żółty", "niebieski", "fioletowy" };
foreach (var kolor in koloryTeczy)
{
    Console.WriteLine("Tęcza ma kolor: " + kolor);
}
```

Foreach używamy głównie wtedy, iedy chcemy odczytać wszystkie elementy tablicy i coś z nimi zrobić (nie potrzebujemy znać indeksów tych elementów, blok kodu pętli będzie wykonany dla każdego elementu jeden raz).

## Zadanie

TBD
