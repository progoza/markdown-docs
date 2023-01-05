---
layout: page
title: Lekcja 3
---

# Operatory, wyrażenia i podstawowe instrukcje sterujące

W poprzednim rozdziale dowiedzieliśmy się, czym są zmienne, ich typy i w jaki sposób możemy zapisywać do zmiennych wartości. Dowiedzieliśmy się również, że przy użyciu zmiennych liczbowych i operatorów możemy wykonywać obliczenia.

W tym rozdziale dowiesz się znacznie więcej o operatorach. Nauczysz się, jak wykonywać bardziej zaawansowane operacje na zmiennych przy ich użyciu.

## Operatory, czyli „znaczki” pozwalające wykonać operacje na zmiennych

Wiemy już, że przy pomocy zmiennych możemy wykonywać różne operacje a jednym ze sposobów pozwalających na wykonywanie tych operacji są operatory. Dwa operatory już poznaliśmy, ale teraz dowiemy się o nich nieco więcej oraz poznamy kilka kolejnych operatorów. Poniżej przedstawione są często używane operatory oraz typy wartości, które potrafią one „obsłużyć”:

1) znak dodawania „+”. Operator ten możemy zastosować żeby  
	1) dodać wartości liczb całkowitych (w wyniku otrzymujemy wartość będącą liczbą całkowitą),
	2) dodać wartości liczb rzeczywistych (w wyniku otrzymujemy wartość będącą liczbą rzeczywistą),
	3) połączyć ze sobą dwa ciągi znaków (napisy) w jeden, długi napis (czyli w wyniku również otrzymujemy wartość typu string),
2) znak odejmowania „-”, Operator ten możemy zastosować żeby:
	1) odejmować wartości liczb całkowitych (w wyniku otrzymujemy liczbę całkowitą),
	2) odejmować wartości liczb rzeczywistych (w wyniku otrzymujemy liczbę rzeczywistą),
3) znak mnożenia „*”, pozwala na:
	1) mnożenie wartości liczb całkowitych (wynik: liczba całkowita),
	2) mnożenie wartości liczb rzeczywistych (wynik: liczba rzeczywista),
4) znak dzielenia „/” pozwala na:
	1) obliczenie wyniku dzielenia liczb całkowitych (wynik: liczba całkowita),
	2) obliczenie wyniku dzielenia liczb rzeczywistych (wynik: liczba rzeczywista),
5) znak „reszta z dzielenia” – „%” – pozwala na:
	1) obliczenie reszty z dzielenia liczb całkowitych (wynik: liczba całkowita),
	2) można też zastosować do liczb rzeczywistych, ale używa się to bardzo rzadko.

Przykładowe użycie operatorów:

```csharp
var liczbaJablek = 5;

var liczbaGruszek = 3;

var liczbaPomaranczy = 2;

var liczbaOwocow = liczbaJablek + liczbaGruszek + liczbaPomaranczy; // = 10

var wagaNetto = 3.45;

var wagaOpakowania = 0.5;

var wagaBrutto = wagaNetto + wagaOpakowania; // = 3.95

var dataUrodzeniaKowalskiego = 1991;

var dataUrodzeniaNowaka = 1987;

var roznicaWieku = dataUrodzeniaKowalskiego - dataUrodzeniaNowaka; // = 4

var imie = "Jan";

var nazwisko = "Kowalski";

var nazwa = imie + " " + nazwisko; // nazwa = "Jan Kowalski"  
  
var liczbaDzieci = 29;

var liczbaDzieciWOstatniejGrupie = liczbaDzieci % 5; // = 4

// możemy tworzyć bardziej złożone wyrażenia, wtedy obliczenia zostaną

// wykonane zgodnie z kolejnością wykonywania działań

var bokA = 3.0;

var bokB = 4.0;

var obwodProstokata = 2 * bokA + 2 * bokB; // = 14

// można również używać nawiasów, żeby wymusić inną kolejność działań

var podstawaA = 1.7;

var podstawaB = 2.3;

var wysokosc = 1.5;

var poleTrapezu = (podstawaA + podstawaB) / 2.0 * wysokosc; // = 3.0  
```

Wszystkie powyższe operatory działają na dwóch wartościach (jedna wartość po lewej i druga po prawej stronie operatora). Jeśli zatem chcemy wykonać operacje na większej liczbie wartości, musimy użyć odpowiednio więcej operatorów (np. „2 + 3 * 2”). Zachowana jest wtedy kolejność wykonywania działań (najpierw mnożenie i dzielenie, dopiero później dodawanie i odejmowanie). Kolejność możemy zmieniać przy użyciu nawiasów. Jeśli użyjemy kilka operatorów posiadających tę samą „ważność” (czyli na przykład „2 + 3 -1” albo „100 / 5 * 2”), wtedy zwykle kolejność nie ma wielkiego znaczenia – jednak wiedzmy, że kompilator wykona działania po kolei od lewej do prawej (czyli np. najpierw doda „2 + 3” a następnie od wyniku tego działania odejmie 1; dla drugiego przykładu – podzieli „100 / 5” i później pomnoży wynik przez 2).

## Zamiana typu czyli „konwersja”.

We wcześniejszych przykładach użyliśmy zmiennych i operatorów do zapisania różnych wyrażeń (działań). Jednak w każdym wyrażeniu używaliśmy zmiennych tych samych typów (to znaczy dodawaliśmy do siebie tylko liczby całkowite, albo mnożyliśmy same liczby rzeczywiste, itd.).

Czasami zachodzi jednak potrzeba wykonania działań na wartościach różnych typów. Na przykład:

- chcemy dodać liczbę całkowitą do liczby rzeczywistej,
- chcemy połączyć ze sobą napis z wartością liczbową (na przykład, żeby otrzymać napis „Zdobyłeś 10 punktów”).

Pomimo, iż poznane przez nas operatory potrafią wykonywać operacje tylko na wartościach tego samego typu (np. dodać do siebie 2 liczy rzeczywiste albo odjąć od siebie dwie liczby całkowite) poprawny jest również zapis:

`var zmienna = 15.5 * 2;`

Jak to jest możliwe, skoro wartość po lewej stronie operatora (15.5) jest liczbą rzeczywistą, a ta po prawej (2) – całkowitą? Czy nie zaprzecza to zasadzie że operatory działają tylko z wartościami o tym samym typie? Otóż, nie. Wyjaśnienie tej zagadki to „konwersja” (czyli zamiana) typu. W języku C# istnieje możliwość zamiany typu wartości i istnieją 2 sposoby aby to wykonać:

1) konwersje niejawne – mają miejsce wtedy, kiedy kompilator sam (bez naszego wyraźnego polecenia) dokona konwersji. Konwersja taka możliwa jest tylko wtedy, kiedy nie istnieje ryzyko utraty informacji (a więc gdy typ „nowej” wartości jest szerszy niż typ „starej” wartości). Na przykład w sposób „niejawny” możemy przekonwertować liczbę całkowitą na liczbę rzeczywistą (ale w drugą stronę już nie) lub dowolną wartość liczbową na napis.
2) Konwersje jawne – mają miejsce wtedy, kiedy programista wyraźnie wskaże w treści programu, że życzy sobie jej zastosowania. Konwersja taka jest możliwa również wtedy, gdy istnieje możliwość utraty informacji (np. zaokrąglenia). Kompilator zakłada, że programista dokładnie wie co robi prosząc o konwersję liczby rzeczywistej na całkowitą i liczy się z koniecznością dokonania „zaokrąglenia”.

Wracając do naszego przykładu:

`var zmienna = 15.5 * 2;`								   

Kompilator „widząc” taką instrukcję rozpoznaje, że typy wartości się nie zgadzają. Jednak po zastosowaniu „niejawnej konwersji” liczby całkowitej 2 do liczby rzeczywistej 2.0 wszystko zaczyna się zgadzać (a nie tracimy informacji, ponieważ typ „liczby rzeczywiste” jest szerszy niż typ „liczby całkowite”, inaczej mówiąc – każda liczba całkowita jest też liczbą rzeczywistą). Wynikiem tego wyrażenia będzie 15.5 * 2.0 = **31.0**.

Stosując tę samą zasadę, możliwe są również zapisy:

```csharp
var liczbaPunktow = 10;

var komunikatOLiczbiePunktow = "Zdobyłeś " + liczbaPunktow + " punktów!";
```

  
tutaj kompilator dokona niejawnej konwersji wartości całkowitej 10 na napis „10”.

Poniższy przykład przedstawia z kolei jak dokonuje się konwersji jawnej:

`var zmienna = (int) 15.5 * 2;`

W powyższym przykładzie w sposób „jawny” dokonujemy zamiany wartości 15.5 do liczby całkowitej (nazwę typu, na który chcemy zamienić wartość piszemy tuż przed tą wartością, w nawiasie). Język C# dokonuje takiej konwersji poprzez „odcięcie” części ułamkowej, więc w naszym przykładzie „(int) 15.5” zostanie zamienione na wartość całkowitą 15, następnie pomnożone przez 2 i wynik (30) zostanie zapisany do zmiennej, której typ również zostaje określony na całkowity (int).

**_Uwaga:_** język C# pozwala jedynie na zamianę typu wartości. Nie jest możliwe jednak zmienienie typu już istniejącej zmiennej. Wyjaśnijmy to na przykładzie:

```csharp
var zmiennaRzeczywista = 15.5;

var wynik = (int)zmiennaRzeczywista * 2;
```

W pierwszej linijce tworzymy zmienną typu rzeczywistego i przypisujemy jej wartość 15.5. W drugiej linijce **wartość** tej zmiennej jawnie konwertujemy do liczby całkowitej (15), mnożymy przez 2 i wynik zapisujemy w nowej zmiennej. Po wykonaniu tej instrukcji zmiennaRzeczywista dalej pozostaje zmienną typu rzeczywistego (ponieważ zamianie uległa tylko wartość tej zmiennej a nie sama zmienna).

Na koniec jeszcze jedna ważna rzecz – dla niektórych par typów, konwersja (nawet ta „jawna”) nie jest możliwa. Na przykład – nie możemy przy użyciu konwersji zamienić napisu na wartość liczbową (choć w ogóle jest to możliwe – pamiętasz? Pod koniec rozdziału 2 poznaliśmy klasę, która na to pozwala: Convert).

## Więcej operatorów!
  
Poznaliśmy już kilka operatorów, które pozwalają na dokonywanie różnych operacji (np. dodawania, odejmowania, itp.). Operatory te dokonywały operacji na dwóch wartościach jakiegoś typu i zwracały wartość, która była tego samego typu (np. w wyniku odejmowania dwóch liczb całkowitych otrzymaliśmy również liczbę całkowitą).

Są jednak jeszcze inne operatory, które również dokonują operacji na dwóch wartościach, ale wynik ich działania jest wartością logiczną (czyli wynik ich działania może przyjmować 2 wartości: **prawda** lub **fałsz**). Są to tak zwane „operatory porównania”. Poniższa tabelka przedstawia listę najbardziej użytecznych operatorów porównania.

| Nazwa operatora |  Zapis |  Opis działania operatora |
| ------------------- | ------ | ---------------------------- |
| Równy …			 |  `==`	| Zwraca wartość **prawda** (true) wtedy, gdy wartość po lewej stronie operatora jest taka sama jak wartość po prawej stronie operatora. W przeciwnym wypadku zwraca wartość **fałsz** (false). Operator można stosować na wartościach każdego typu wbudowanego (to znaczy możemy porównywać ze sobą 2 wartości typu int, albo 2 wartości typu double, albo 2 wartości typu string, itd..) |
| Różny od … | `!=` | Działa dokładnie odwrotnie niż operator równości, czyli zwraca wartość **prawda** gdy wartość po lewej stronie operatora jest inna niż wartość po prawej stornie; w przeciwnym przypadku (gdy obie wartości są równe) zwraca wartość **fałsz**. Operator ten działa również na parze wartości każdego typu wbudowanego. |
| Mniejszy niż… | '<' | Zwraca wartość **prawda**, wtedy gdy wartość po lewej stronie jest mniejsza niż wartość po prawej stronie operatora; zwraca wartość **fałsz** jeśli wartość po lewej stronie jest większa lub równa niż wartość po prawej stronie. Operator ten można stosować do 2 wartości liczbowych (czyli do dwóch liczb całkowitych albo 2 liczb  rzeczywistych). Nie można stosować dla wartości typu string ani bool (podobnie jak 3 kolejne operatory poniżej). |
| Większy niż… | '>'  | Zwraca wartość **prawda** wtedy gdy wartość po lewej stronie jest większa niż wartość po prawej stronie; wartość **fałsz** kiedy wartość po lewej stronie jest mniejsza lub równa niż ta po prawej stronie. |
| Mniejszy lub równy… | '<=' | Zwraca wartość **prawda**, gdy wartość po lewej stronie jest mniejsza lub równa wartości po prawej stronie operatora; zwraca wartość **fałsz** jeśli wartość po lewej stronie jest większa niż wartość po prawej stronie. |
|  Większy lub równy | '>=' | Zwraca wartość **prawda**, gdy wartość po lewej stronie jest większa lub równa wartości po prawej stronie operatora; zwraca wartość **fałsz** jeśli wartość po lewej stronie jest mniejsza niż wartość po prawej stronie. |


Przykłady użycia operatorów porównania.

```csharp
bool wynikPrownania;
var liczbaCalkowita = 10;

wynikPrownania = liczbaCalkowita == 10; // wartość true zostanie przypisana do zmiennej wynikPorownania
										
wynikPrownania = liczbaCalkowita != 10; // false

wynikPrownania = liczbaCalkowita < 11; // true

wynikPrownania = liczbaCalkowita > 10; // false

var liczbaRzeczywista = 10.0;

wynikPrownania = liczbaRzeczywista == 10.0; // true

wynikPrownania = liczbaRzeczywista < 11.0; // true

wynikPrownania = liczbaRzeczywista > 10.0; // false

wynikPrownania = liczbaRzeczywista >= 10.0; // true

var napis = "Cześć!";

wynikPrownania = napis == "Cześć!";  // true

wynikPrownania = napis == "Dzień dobry!";  // false

// wyrażenie poniżej też zadziała, ponieważ nastąpi niejawna konwersja
// wartości pobranej ze zmiennej "liczbaCalkowita" (z typu całkowitego na
// typ rzeczywisty) i następnie porównane zostaną dwie wartości rzeczywiste

wynikPrownania = liczbaCalkowita == liczbaRzeczywista; // true
```

Operatory logiczne są kolejną grupą operatorów, które poznamy. Podobnie jak operatory porównania, zwracają one wartość logiczną (bool, czyli **prawda** albo **fałsz**). Mogą jednak być zastosowane tylko na wartościach, które również są typu logicznego.

| Nazwa operatora | Zapis |  Opis działania operatora | 
| --------------- | ----- | --------------------- |
| Logiczne „i” |  `&&` |  Zwraca wartość **prawda** (true) wtedy, gdy wartość po lewej stronie operatora to **prawda** i wartość po prawej stronie operatora to również **prawda**. W przeciwnym wypadku, czyli kiedy którakolwiek z wartości z lewej lub prawej strony operatora ma wartość **fałsz** (false), wynik działania operatora to też **fałsz**. |
| „lub” | &#124;&#124; | Zwraca wartość **prawda** wtedy, gdy którakolwiek z wartości (albo ta z prawej albo ta z lewej, lub też oby dwie) mają wartość **prawda**. Zwraca wartość **fałsz** wtedy gdy wartości po prawej jak i po lewej stronie operatora mają wartość **fałsz**. |
| Zaprzeczenie, czyli „nie” | &#124; | Ten operator jest trochę inny od wszystkich dotychczas poznanych, ponieważ działa na tylko jednej wartości. Zapisujemy tę wartość po prawej stronie operatora (a po lewej nie piszemy nic). Operator ten zwraca wartość **prawda**, jeśli wartość po jego prawej stronie to **fałsz**, z kolei zwraca wartość **fałsz**, jeśli wartość po jego prawej stronie to **prawda**. |


Przykłady użycia operatorów logicznych.

```csharp
bool wynikOperacji;

bool wartoscA = true;

bool wartoscB = false;

wynikOperacji = wartoscA && wartoscB; // wartość false zostanie przypisana do zmiennej wynikOperacji

wynikOperacji = wartoscA || wartoscB; // true

wynikOperacji = !wartoscA; // false
```

Użycie operatorów porównania i operatorów logicznych w jednym wyrażeniu.

```csharp
var temperatoraPowiertrza = 17;
var czyPadaDeszcz = false;
var czyPotrzebaKurtke = (temperatoraPowiertrza < 20) || czyPadaDeszcz; // true
```

W przykładzie powyżej, do określenia wartości zmiennej „czyPotrzebaKurtke” zbudowaliśmy nieco bardziej złożone wyrażenie. Mianowicie – najpierw użyliśmy operatora porównania (dla większej czytelności użyliśmy nawiasów, choć są one niepotrzebne). Wynik porównania (temperatoraPowiertrza < 20) będzie miał wartość true (ponieważ 17 jest mniejsze niż 20). Następnie używamy operatora logicznego „lub” stosując go na wartości true z lewej i wartości false (zmienna czyPadaDeszcz jest zainicjowana wartością false) z prawej strony operatora. Jak wiemy operator logiczny „lub” (czyli „||”) zwraca wartość true jeśli którakolwiek z wartości użytych z tym operatorem ma wartość true. Oznacza to, że ostatecznie wartość zmiennej „czyPotrzebaKurtke” zostanie ustawiona na true.

Kolejny przykład:

```csharp
var dzienTygodnia = "wtorek";
var czyDzisSwietoPanstwowe = false;
var czyDzisTrzebaIscDoSzkoly = (dzienTygodnia != "sobota") &&
	(dzienTygodnia != "niedziela") && (!czyDzisSwietoPanstwowe); // true, czyli
										// tak - dziś trzeba iść do szkoły.. :-)
```

Dokładnie to samo możemy również zapisać nieco inaczej:

```csharp
var czyDzisTrzebaIscDoSzkoly = !(dzienTygodnia == "sobota" ||
	dzienTygodnia == "niedziela" || czyDzisSwietoPanstwowe);
```

A teraz ćwiczenia, które wykonasz sam.

1.	   Mamy następujące zmienne (wszystkie typu rzeczywistego):

```csharp
var cenaGryFifa22 = 149.9;
var cenaGryForzaHorizon5 = 195.50;
var oszczednosci = 345.00;
```

Spróbuj wykorzystać operator dodawania oraz operator porównania, aby obliczyć wartość zmiennej logicznej:

`bool czyWystarczyNaZakupObuGier = ..... ;`

2.	   Mamy następujące zmienne:

```csharp
bool czyLekcjeOdrobione = true;
bool czyWykorzystalemJuzCzasGraniaNaDzis = false;
double godzinaKiedyMuszeIscSpac = 21.00;
double godzinaTerazNaZegarku = 20.00;
```

  
Spróbuj wykorzystać operatory logiczne i operatory porównania, aby obliczyć wartość zmiennej logicznej:

`bool czyMogeJeszczeDzisPogracNaKomputerze = .....;`


## Instrukcja sterująca „jeżeli”

Umiemy już konstruować wyrażenia, które (za pomocą operatorów porównania i operatorów logicznych) zwracają wartości logiczne. Teraz poznamy instrukcje, które wykorzystują wartości logiczne do wykonywania bardzo przydatnych rzeczy. Zaczniemy od tak zwanej „instrukcji sterującej <<jeżeli>>”.

Instrukcja sterująca „jeżeli” pozwala nam na wykonanie fragmentu kodu programu pod pewnym warunkiem. Jeśli ten warunek nie jest spełniony, to ów kawałek kodu po prostu nie zostanie wykonany. Poniżej przedstawiony jest przykład użycie instrukcji sterującej „jeżeli”:

```csharp
var wartoscLogiczna = true;

if (wartoscLogiczna)
{
	// wewnątrz tego bloku umieszczamy instrukcje, które mają się wykonać
	// pod warunkiem, że "wartoscLogiczna" będzie prawdą
	Console.WriteLine("Dzień dobry!");
}
```

Jak widzimy powyżej, konstrukcja ma formę: najpierw piszemy słówko „if” (z ang. „jeżeli”), następnie w nawiasie przekazujemy wartość logiczną (może to być zmienna lub wyrażenie), następnie – wewnątrz nawiasów klamrowych „{” i „}” wpisujemy instrukcje, które mają się wykonać jeśli podany warunek logiczny jest **prawdą**. Uwaga! Chociaż nie jest to wymagane przez kompilator, to ze względu na zwiększenie czytelności kodu, wszystkie instrukcje wewnątrz bloku „{” .. „}” piszemy z „wcięciem” a więc dodając 4 „spacje” na początku. Jest to ogólnie przyjęta konwencja (umowa) i środowisko Visual Studio samo będzie nam „proponować” użycie wcięcia.

Instrukcję „jeżeli” można też rozszerzyć na zapis „jeżeli …, w przeciwnym wypadku …”, na przykład:

```csharp
var godzina = 10.00;

if (godzina >= 6.00 && godzina < 19.00)
{
	Console.WriteLine("Dzień dobry!");
}
else
{
	Console.WriteLine("Dobrej nocy!");
}
```

Powyższy kod napisze na ekranie „Dzień dobry!” wtedy, gdy zmienna „godzina” ma wartość 6.00 lub więcej, ale mniej niż 19.00. W przeciwnym wypadku (jeśli „godzina” miałaby wartość większą lub równą 19.00 lub mniejszą od 6.00) – napisany zostanie tekst „Dobrej nocy!”.  
  

Instrukcje if-else można również łączyć w dłuższe „łańcuszki”.

```csharp
var godzina = 10.00;

if (godzina >= 6.00 && godzina <= 12.00)
{
	Console.WriteLine("Dzień dobry!");
}
else if (godzina > 12.00 && godzina < 19.00 )
{
	Console.WriteLine("Miłego popołudnia!");
}
else
{
	Console.WriteLine("Dobrej nocy!");
}
```

Możemy też wewnątrz bloku kodu jednej instrukcji „if” umieścić drugą konstrukcję „if” (mówimy wtedy, że te instrukcje „zagnieżdżamy”):

```csharp
var temperatura = 25;
var czyPadaDeszcz = true;

if (temperatura >= 20)
{
	if (czyPadaDeszcz)
	{
		Console.WriteLine("Jest ciepło, ale mokro...");
	}
	else
	{
		Console.WriteLine("Mamy dziś piękny dzień!");
	}
}
else
{
	if (czyPadaDeszcz)
	{
		Console.WriteLine("Jest zimno i  mokro :-(");
	}
	else
	{
		Console.WriteLine("Jest chłodno, ale nie pada.");
	}
}
```

A teraz ćwiczenie dla Ciebie! Załóżmy, że nasz program zaczyna się od następujących deklaracji:

```csharp
var cenaGryFifa22 = 149.9;
var cenaGryForzaHorizon5 = 195.50;
Console.WriteLine("Ile masz oszczędności?");
var oszczednosci = Convert.ToDouble(Console.ReadLine());
```

Stwórz kod, który w zależności od wpisanej przez użytkownika wartości napisze:

- „**Możesz kupić obie gry!**” – kiedy wartość oszczędności jest większa lub równa cenie obu gier.
- „**Nie wystarczy na obie gry, ale możesz kupić FIFA 22.**” – kiedy wartość oszczędności jest mniejsza niż cena obu gier, ale większa lub równa cenie gry FIFA 22.
- „**Niestety musisz jeszcze oszczędzać, żeby kupić grę.**” – kiedy wartość oszczędności jest mniejsza niż cena gry FIFA22.

## Instrukcja sterująca „dopóki”

Poznana przez nas instrukcja sterująca „jeżeli” jest bardzo ważna i często wykorzystywana przez programistów. W tym rozdziale poznamy jeszcze jedną, niezwykle przydatną instrukcję sterującą – while (czyli „dopóki”, lub inaczej „tak długo jak..”). Przyjrzyjmy się najpierw, jak wygląda konstrukcja tej instrukcji:

```csharp
int licznik = 0;

while (licznik < 10)
{
	Console.WriteLine("Halo!");
	licznik = licznik + 1;
}
```

Wygląda ona podobnie do konstrukcji „jeżeli”, ale działa w inny sposób. Mianowicie, w przypadku instrukcji „if” podany blok instrukcji był – w przypadku spełnienia warunku logicznego – wykonywany tylko jeden raz a później wykonywane były kolejne instrukcje znajdujące się poniżej.

W przypadku „while” blok instrukcji wewnątrz nawiasów klamrowych „{” i „}” będzie wykonywany wielokrotnie – tak długo, jak długo będzie spełniony podany warunek. Dla przykładu podanego powyżej, na ekranie naszej konsoli zostanie napisane powitanie „Halo!” dziesięciokrotnie. Wiesz dlaczego? Już tłumaczę:

1) W pierwszej linijce ustawiamy zmienną „licznik” na wartość całkowitą 0.
2) W kolejnej linijce – stosując instrukcję sterującą „while” – mówimy komputerowi „wykonuj blok kodu tak długo, jak licznik będzie mniejszy od 10”.
3) Następnie mamy nasz blok kodu, który składa się z dwóch instrukcji:
	1) Pierwsza – pisze na ekranie przywitanie „Halo!”,
	2) Druga – dodaje do zmiennej „licznik” liczbę 1 i przypisuje wynik tej operacji do tej samej zmiennej „licznik” (innymi słowy, zwiększa wartość zmiennej „licznik” o jeden).

Po pierwszym wykonaniu tego bloku zmienna „licznik” ma wartość 1, jest więc wciąż mniejsza niż 10 – a zatem, nasz blok będzie wykonany ponownie… Tak samo po drugim, trzecim, czwartym … dziewiątym „przebiegu”.

Kiedy blok kodu będzie się wykonywać po raz dziesiąty wartość zmiennej „licznik” zostanie w końcu ustawiona na 10. Wtedy, warunek podany przy instrukcji „while” nie będzie już spełniony (ponieważ 10 nie jest mniejsze od 10 😊), więc blok kodu nie zostanie już więcej wykonany.

Instrukcja sterująca „while” jest przykładem konstrukcji, przy pomocy której możemy tworzyć tak zwane „pętle”. Pętle to wykonywane wielokrotnie te same kawałki kodu – są one wykonywane do czasu spełnienia pewnego warunku. Pętle wykorzystywane są **bardzo** często przez programistów, bez nich trudno byłby napisać jakikolwiek program!

Uwaga! Wykorzystując pętle musimy być ostrożni! Jeśli wewnątrz bloku kodu wykonywanego w naszej pętli nie zapewnimy sposobu na zmienienie warunku logicznego użytego w „while”, to nasza pętla będzie wykonywać się bez końca i jedynym sposobem na jej przerwanie będzie zamknięcie naszego programu 😊. Na przykład, jeśli zapomnielibyśmy zwiększać nasz licznik:

```csharp
int licznik = 0;
while (licznik < 10)
{
	Console.WriteLine("Halo!");
}
```

Wtedy przywitanie „Halo!” byłoby pisane na ekranie konsoli bez końca, tysiące razy – aż do czasu zamknięcia naszej aplikacji konsoli (program taki „sam z siebie” nigdy by się nie zakończył). Pamiętajmy zatem, że zawsze wewnątrz bloku pod instrukcją „while” musimy „coś” zrobić ze zmiennymi użytymi w warunku logicznym (i to „coś” musi – wcześniej czy później – doprowadzić do zakończenia pętli).

**_Uwaga!_** Ponieważ programiści bardzo często potrzebują zwiększać wartość zmiennej o 1, zamiast takiej konstrukcji:

```csharp
licznik = licznik + 1;
```

Wymyślono mały „skrót” – operator „++”. Można go zastosować ze zmienną całkowitą, a jego działanie to nic innego, niż „zwiększ wartość zmiennej całkowitej o jeden”.  
Zatem, zamiast „licznik = licznik + 1;” możemy napisać krótko:

```csharp
licznik++;
```
  
Spróbujmy teraz napisać program, który – przy wykorzystaniu pętli – sprawdzi czy podana przez użytkownika liczba jest liczbą pierwszą czy też nie. Liczba jest „pierwsza” wtedy gdy:

- po pierwsze: jest równa lub większa liczbie 1.
- po drugie: ma co najwyżej dwa dzielniki – 1 lub siebie samą (inaczej mówiąc: nie dzieli się bez reszty przez żadną liczbę poza 1 i siebie samą).

Na początek poprosimy użytkownika o wpisanie liczby i zapiszemy wpisaną wartość do zmiennej:

```csharp
Console.WriteLine("Proszę podaj liczbę całkowitą większą lub równą 1");
var badanaLiczba = Convert.ToInt32(Console.ReadLine());
```

W kolejnym korku upewnijmy się, czy wpisana liczba jest rzeczywiście równa lub większa niż 1 (inaczej mówiąc – jeśli liczba jest mniejsza od 1, zgłosimy błąd).

```csharp
if (badanaLiczba < 1)
{
	Console.WriteLine("Wprowadziłeś liczbę która jest mniejsza niż 1!");
	return;
}
```

W powyższym kodzie użyliśmy instrukcji „return”. Co robi ona dokładnie, dowiemy się w kiedy będziemy poznawać funkcje (metody). W naszym przypadku spowoduje ona przerwanie wykonywania programu. Zatem – jeśli użytkownik wpisał liczbę mniejszą niż 1 – napiszemy odpowiedni komunikat i zakończymy nasz program.

Ok, to teraz spróbujmy sprawdzić czy uda nam się znaleźć jakieś dzielniki, które są większe niż jeden, ale mniejsze niż podana liczba (wykorzystamy do tego operator „reszta z dzielenia” czyli „%”).

```csharp
var czyMaDzielnik = false;
int sprawdzanyDzielnik = 2; // zaczniemy sprawdzanie od 2, bo przecież
	   	   	   	   // każda liczba całkowita się dzieli przez 1
while (sprawdzanyDzielnik < badanaLiczba)
{
	if (badanaLiczba % sprawdzanyDzielnik == 0)
	{
 	   czyMaDzielnik = true;
	}
	sprawdzanyDzielnik++;
}
```

W powyższym kodzie utworzyliśmy zmienną logiczną „czyMaDzielnik” i nadaliśmy jej początkową wartość „false” (zmienimy tę wartość na „true”, kiedy tylko uda się znaleźć jakiś dzielnik). Następnie tworzymy zmienną liczbową przypisując jej wartość 2 (wewnątrz pętli będziemy tę wartość zwiększać). W końcu zaczynamy wykonywać naszą pętlę – i będziemy to robić dopóki wartość „sprawdzanyDzielnik” będzie mniejsza niż „badanaLiczba”. Podczas każdego „przebiegu” pętli sprawdzamy czy „badanaLiczba” dzieli się przez „sprawdzanyDzielnik” (jeśli tak, to zapamiętujemy to w zmiennej „czyMaDzielnik”). Następnie zwiększamy wartość „sprawdzanyDzielnik” o jeden. Jeśli uda się wykonać całą pętlę i ani razu nie ustawimy zmiennej „czyMaDzielnik” na „true”, to wiemy, że „badanaLiczba” jest pierwsza! A na koniec (już „poza pętlą”) wystarczy dodać:

```csharp
if (!czyMaDzielnik)
{
	Console.WriteLine("Badana liczba jest liczbą pierwszą.");
}
else
{
	Console.WriteLine("Badana liczba nie jest liczbą pierwszą.");
}
```


## Podsumowanie

W tym rozdziale nauczyliśmy się wiele ważnych i przydatnych rzeczy:

- poznaliśmy wiele różnych operatorów
	- operatory „arytmetyczne” (np. dodawanie, odejmowanie, mnożenie i dzielenie),
	- operatory porównania (operator równości, „większy od”, „mniejszy od” itd.),
	- operatory logiczne (logiczne „i”, logiczne „lub” oraz „zaprzeczenie”),
- dowiedzieliśmy się czym jest konwersja typów (jawna i niejawna),
- nauczyliśmy się pisać złożone wyrażenia przy użyciu różnych operatorów,
- poznaliśmy instrukcję sterującą „jeżeli”, dzięki której możemy wykonać instrukcje pod pewnym warunkiem,
- poznaliśmy instrukcję sterującą „dopóki”, dzięki której możemy konstruować pętle.

A teraz zadanie dla ciebie! Będzie polegało na napisaniu pierwszej, prawdziwej gry! Gra będzie się nazywała „Zgadula”. Będzie polegać na tym, że użytkownik programu będzie musiał zgadnąć liczbę z zakresu od 1 do 100, którą wcześniej wylosuje komputer.

Żeby napisać tę grę, musisz przede wszystkim wiedzieć w jaki sposób można „losować liczbę”. Oto sposób – poniższa linijka kodu tworzy zmienną o nazwie „losowaLiczba” i przypisuje do niej losową wartość z zakresu od 1 do 100:

```csharp
var losowaLiczba = new Random().Next() % 100 + 1;
```

Ok, wiedząc to oraz pamiętając wszystko, czego nauczyliśmy się w tym rozdziale, jesteś w stanie napisać „Zgadulę”. Oto jak ma działać program:

1) Na początek wylosujemy liczbę i zapamiętamy jej wartość w zmiennej,
2) Na ekranie napiszemy komunikat: „Spróbuj zgadnąć liczbę z przedziału od 1 do 100”
3) Następnie, tak długo dopóki użytkownik nie odgadnie wylosowanej liczby będziemy:
	1) Prosić użytkownika o podanie liczby pisząc na ekranie „Wpisz liczbę… ”.
	2) Czekać, aż użytkownik wpisze liczbę.
	3) Jeśli użytkownik wpisał za małą liczbę – piszemy na ekranie „Niestety nie – liczba której szukasz jest większa.”.
	4) Jeśli użytkownik wpisał za dużą liczbę – piszemy na ekranie „Niestety nie – liczba której szukasz jest mniejsza.”.
4) Jeśli użytkownik odgadł liczbę – piszemy na ekranie „Brawo, zgadłeś! Do odgadnięcia potrzebowałeś … prób” (w miejsce … wstaw ile razy użytkownik próbował zgadywać do czasu aż mu się udało). Następnie kończymy wykonywanie programu.

**_Uwaga!_** Napisanie tej gry wcale nie jest takie łatwe, więc nie przejmuj się, jeśli od razu Ci nie wychodzi. Przede wszystkim – nie spiesz się. Jeśli potrzebujesz więcej czasu, zrób sobie przerwę i spróbuj kiedy indziej jeszcze raz. Jeśli wciąż Ci się nie udaje, to na kolejnej stronie znajduje się przykładowe rozwiązanie tego zadania. Przepisz je i postaraj zrozumieć jak oko działa.

Jak już uda Ci się uporać ze „Zgadulą”, to spróbuj sam wymyślić inny program, który używa operatorów i instrukcji sterujących.



```csharp
// Gra "Zgadula"

var losowaLiczba = new Random().Next() % 100 + 1;
var liczbaProb = 0;
var wpisanaLiczba = 0; // na początek przypisujemy wartość zero, która
					// na pewno nie jest równa wylosowanej liczbie
					// (bo jest poza zakresem 1..100)

Console.WriteLine("Spróbuj zgadnąć liczbę z przedziału od 1 do 100");

while (wpisanaLiczba != losowaLiczba)
{
	Console.Write("Wpisz liczbę... ");
	wpisanaLiczba = Convert.ToInt32(Console.ReadLine());
	if (wpisanaLiczba < losowaLiczba)
	{
		Console.WriteLine("Niestety nie - liczba której szukasz jest większa.");
	}
	else if (wpisanaLiczba > losowaLiczba)
	{
		Console.WriteLine("Niestety nie - liczba której szukasz jest mniejsza.");
	}
	liczbaProb++;
}
Console.WriteLine("Brawo, zgadłeś! Do odgadnięcia potrzebowałeś "
				   + liczbaProb + " prób.");
```
