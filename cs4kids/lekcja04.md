---
layout: page
title: Lekcja 4
---

# Metody czyli funkcje

W poprzednim rozdziale nauczyłeś się wielu operatorów, które możemy używać w języku programowania C#. 
W tym rozdziale nauczysz co to są funkcje (zwane też "metodami"). Uwaga - mała ciekawostka! Wkrótce okaże się, że operatory to w zasadzie rónież specjalny rodzaj funkcji 😊.

Podczas pisania programów często występuje potrzeba wykonywania wielokrotnie tych samych lub bardzo podobnych operacji. Jednak programistom zleży na tym, żeby nie powtarzać w swoim kodzie wielokrotnie takich samych fragmentów kodu. Chcemy, żeby nasz kod był zwięzły, krótki. Dzięki temu łatwiej go się czyta (czyli łatwiej jest go zrozumieć). Łatwiej się go też wtedy zmienia.

	Funkcje to bardzo istotny element w sztuce programowania. Warto spędzić trochę czasu, żeby je poznać i zrozumieć, a przede wszystkim - poćwiczyć ich pisanie.

## Czym jest funkcja w języku C# i z czego się składa?

Żeby umożliwić programistom pisanie programów bez zbędnych powtórzeń fragmentów kodu, wpowadzono funkcje. W języku C# można je również nazywać metodami. Metoda to fragment kodu (zwany też "blokiem kodu"), który można uruchomić ("wywołać") z innego miejsca naszego programu. Funkcje:

- posiadają swoje nazwy, 
- mogą posiadać listę parametrów, czyli "zmiennych", które można wykorzystywać w kodzie funkcji,
- mogą zwracać resultat (czyli wynik),
- mają swój blok kodu, czyli instrukcje, które będą wykonywane za każdym razem kiedy funkcję się uruchomi (wywoła).

Poniżej przykłady funkcji:

```csharp
void WyswietlPowitanie()
{
	Console.WriteLine("Dzień dobry!");
	Console.WriteLine("Miłego dnia.")
}
```

```csharp
double PoleProstokata(double bokA, double bokB)
{
	var pole = bokA * bokB;
	return pole;
}
```

Na podstawie powyższych przykładów omówmy jak zapisuje się funkcje w C#, czyli - innymi słowy - jak wygląda **definicja funkcji**.

1. Na początku zapisujemy czy funkcja będzie zwracać rezultat (czyli "wynik" albo "wartość") czy nie. A jeśli tak - to jaki będzie typ zwracanej wartości:
	1. jeżeli funkcja nie będzie zwracać żadnej wartości, wpisujemy słówko `void` (tak jak w pierwszym przykładzie),
	2. jeżeli funkcja będzie zwracać wartość, po prostu piszemy nazwę typu zwracanej wartości (w drugim przykładzie - nasza funkcja będzie zwracać wartość typu `double`),
2. Następnie wymyślamy nazwę naszej funkcji (w przykładach - `WyswietlPowitanie` i `PoleProstokata`). Nazwą funkcji może być dowolny _identyfikator_. Pamiętasz jeszcze lekcję 2 i rozdział o nazwach zmiennych? Tu panują bardzo podobne reguły jeśli chodzi o nazwyanie funkcji. Jedyną różnicą jest to, że programiści umówili się, że w jężyku C# będą nazywać funkcję z dużej litery (to jest tylko umowa). Najważniejsze jednak jest to, żeby nazwa była zrozumiała i mówiła co dana funkcja robi.
3. Następnie otwietamy nawias "("
4. Jeżeli chcemy, żeby funkcja miała parametry piszemy ich typy oraz nazwy,
5. Zamykamy nawias ")"  - uwaga - nawiasy używamy nawet wtedy, gdy funkcja nie ma żadnych parametrów - tak jak w pierwszym przykładzie,
6. Następnie otwieramy nawias "klamrowy" - "{" 
7. Teraz piszemy kod naszej funkcji. Jeżeli funkcja posiada parametry - możemy się do nich odwoływać (czyli ich używać). Jeżeli funkcja zwraca wartość, to **musimy** użyć instrukcji `return` żeby tę wartość zwrócić (w przeciwnym wypadku kompilator zgłosi błąd - nasz program się nie uruchomi),
8. Na koniec zamykamy nawias klamrowy - "}"

Uwaga! Samo zapisanie definicji funkcji nie spowoduje, że jej blok kodu będzie wykonany. Kod ten będzie wykonay dopiero wtedy, kiedy uruchomimy, czyli **wywołamy** funkcję.

## Wywołanie funkcji

Mając zapisaną definicję funkcji, możemy ją uruchomić. Programiści bardzo często mówią, że "wywołują" funkcje (mają na myśli po prostu ich uruchomienie).  W jaki sposób się to robi? Zobaczmy przykłady:

```csharp
WyswietlPowitanie();
var poleProstokata = PoleProstokata(2.0, 3.5);
```

Żeby wywołać funkcję:
1. Piszemy jej nazwę
2. otwietamy nawias okrągły "("
3. Jeżeli definicja funkcja posiada listę parametrów - przekazujemy wartości dla tych parametrów. Jeśli jest więcej niż jeden parametr, wtedy wpisujemy wartości w tej samej kolejności, w jakiej zostały one określone w definicji funkcji.
4. zamykamy nawias okrągły ")" i stawiamy średnik ";".
5. Jeżeli funkcja zwraca wartość, to _możemy_ tę wartość wykorzystać - na przykład przypisać do zmiennej jak w przykładzie powyżej. 

Funkcje możemy wywoływać z:
- głównego kodu naszego programu,
- z kodu innej funkcji (wtedy jedna funkcja wywołuje drugą funkcję),
- w szczególnym przypadku można również wywołać funkcję z kodu tej samej funkcji (wtedy mówimy, że jest to wywołanie _rekurencyjne_, ale jest to bardzo skomplikowane i nie będziemy się tym zajmować).

## Dwie funkcje o tej samej nazwie?

Definiując fnkcje w naszyn programie pamiętamy o tym, żeby ich nazwy mówiły co dana funkcja robi. Najczęściej więc każda funkcja będzie miałą inną nazwę. Ale czy może się zdarzyć, że stworzymy dwie funkcje o takiej samej? Okazuje się, że tak - jest to możliwe, tylko wtedy funkcje te **muszą** się różnić listą swoich parametrów (a to dlatego, żeby było wiadomo która funkcja ma być wywołana 😊). Przykład:

```csharp
int Dodaj(int a, int b)
{
	return a+b;
}

float Dodaj(float a, float b)
{
	return a+b;
}
```

Powyższa definicja jest całkiem ok, mimo że funkcje tak samo się nazywają. Kiedy będziemy wywoływać te funkcje, kompilator sam wybierze "najbardziej pasującą" do przekazanych przez nas parametrów:

```csharp
var wynikCalkowity = Dodaj(1, 2); // tutaj kompilator wybierze wersję 1. bo parametry są liczbami całkowitymi (int)

var wynikRzwczywisty = Dodaj(1.25, 2.0); // tutaj kompilator wybierze wersję 2. bo parametry są liczbami rzeczywistymi (float)
```

Uwaga: jeżeli 2 funkcje mają takie same nazwy to muszą się różnić listą parametrów, rożnica zwracanego typu nie ma znaczenia.


## "Czysty kod"

Programy, któe będziemy pisać będą stawać się coraz dłuższe i bardziej skomplikowane. Funkcje są świetnym sposobem na to, żeby utrzymać nasz kod w miarę łatwym do czytania i zrozumienia. Musimy jednak trzymać się pewnych reguł. 
Pewien bardzo znany programista i autor książek - Robert C. Martin (znany bardziej jako "Uncle Bob" czyli "wujek Bob") opisał zbiór zasad, jakich powinniśmy się trzymać, żeby nasz kod był "czysty" (czysty kod łatwiej jest zrozumieć, a przede wszystkim - łątwiej się go zmeinia; w odróżnieniu do kodu "brudnego" - który jest niezrozumiały i trudno się go modyfikuje). Wśród tych zasad dużo miejsca poświęca funkcjom. Między innymi funkcja powinna:
1) Mieć jasno określoną nazwę (o tym już było 😊),
2) Robić tylko jedną rzecz i robić ją dobrze! Jeśli musimy napisać w funkcji kod, który robi więcej niż jedną rzecz (na przykłąd, najpierw pobiera dane od użytkownika a później je przetwarza) - podzielmy ten kod na kilka części (pamiętając o tym, że z jednej funkcji możemy wywołać drugą),
3) Kod funkcji powinien być krótki, funkcje zazwyczaj nie powinny być dłuższe niż 20 linijek kodu. Jeśli nasza funkcja staje się dłuższa - zastanówmy się czy nie dałoby się jej podzielić na kilka mniejszych funkcji..  

## Zaraz, zaraz - podobno operatory to też funkcje?

Na początku tego rozdziału napisałem, że operatory to też takie specjalne funkcje. I to jest prawda. Wróćmy do przykładu funkcji "Dodaj":

```csharp
int Dodaj(int a, int b)
{
	return a+b;
}
```

Posiadając takie funkcje, możemy ich używać bardzo podobnie jak operator dodawania:

```csharp

var wynikFunkcji = Dodaj(1, 2);
var wynikOperatora = 1 + 2; // zadziała tak samo, operator "+" to po prostu 
							// inaczej zapisana funkcja dodawania :-)
```


## Przykłady, przykłady

Na początek stwórzmy funkcję, która sprawdza czy podany rok jest przystępny. Wywołajmy tę funkcje dla lat 2000 i 2023 - w zależności od wyniku napiszemy czy rok jest przestępny czy nie i pdpamy ile ma dni.

```csharp
bool CzyRokJestPrzestepny(int rok)
{
	if (rok % 1000 == 0) 
	{
		return true; // jeśli rok dzieli się przez 1000 to jest przestepny
	}
	else if (rok % 100 == 0)
	{
		return false; // jeśli rok nie dzieli się przez 1000 ale dzieli się 
					// przez 100 - nie jest przesteny
	}
	else if (rok % 4 == 0)
	{
		return true; // jeśli rok nie dzieli się przez 100 ale dzieli się 
					// przez 4 to jest przestepny
	}
	return false; // W każdym przeciwnym przypadku (czyli jeśli rok nie dzieli 
				// się przez 4) - rok nie jest przestępny
}

if (CzyRokJestPrzestepny(2000))
{
	Console.WriteLine("Rok 2000 jest przestępny i ma 366 dni");
}
else
{
	Console.WriteLine("Rok 2000 nie jest przestępny i ma 365 dni");
}

if (CzyRokJestPrzestepny(2023))
{
	Console.WriteLine("Rok 2023 jest przestępny i ma 366 dni");
}
else
{
	Console.WriteLine("Rok 2023 nie jest przestępny i ma 365 dni");
}
```

Ok, uruchom ten program - w wyniku otrzymamy:

```
Rok 2000 jest przestępny i ma 366 dni
Rok 2023 nie jest przestępny i ma 365 dni
```

Niby wszystko się zgadza, ale kod nie jest zbyt... czysty. Widzimy, że część instrukcji w nim się powtarza... Spróbujmy pomyśleć czy nie dałoby się tego jakoś poprawić..

```csharp
bool CzyRokJestPrzestepny(int rok)
{
	if (rok % 1000 == 0) 
	{
		return true; // jeśli rok dzieli się przez 1000 to jest przestepny
	}
	else if (rok % 100 == 0)
	{
		return false; // jeśli rok nie dzieli się przez 1000 ale dzieli się 
					// przez 100 - nie jest przesteny
	}
	else if (rok % 4 == 0)
	{
		return true; // jeśli rok nie dzieli się przez 100 ale dzieli się 
					// przez 4 to jest przestepny
	}
	return false; // W każdym przeciwnym przypadku (czyli jeśli rok nie dzieli 
				// się przez 4) - rok nie jest przestępny
}

void NapiszCzyRokJestPrzystepnyIIleMaDni(int rok)
{
    if (CzyRokJestPrzestepny(rok)) 
    {
        Console.WriteLine("Rok "+rok+" jest przestępny i ma 366 dni");
    }
    else
    {
        Console.WriteLine("Rok "+rok+" nie jest przestępny i ma 365 dni");
    }
}

NapiszCzyRokJestPrzystepnyIIleMaDni(2000);
NapiszCzyRokJestPrzystepnyIIleMaDni(2023);
```

Teraz dużo lepiej 😊.  Stworzyliśmy drugą funkcję, która zawiera kod, który był powielony. Teraz możemy wywoływać go wielokrotnie dla wybranego roku.

Jeśli bylibyśmy bardzo dociekliwi, doszlibyśmy do wniosku, że można ten kod jeszcze trochę  "oczyścić": teraz funkcja `NapiszCzyRokJestPrzystepnyIIleMaDni` zajmuje się nie tylko wypisaniem użytkownikowi informacji, ale rónież określa ile przestępny rok ma dni. JEśłi chcielibyśmy być całkowicie zgodni z zasadami czystego kodu (żeby każda funkcja robiła tylko jedną rzecz) - możemy zmienić ten kod na przykłąd w taki sposób:

```csharp
bool CzyRokJestPrzestepny(int rok)
{
	if (rok % 1000 == 0) 
	{
		return true; // jeśli rok dzieli się przez 1000 to jest przestepny
	}
	else if (rok % 100 == 0)
	{
		return false; // jeśli rok nie dzieli się przez 1000 ale dzieli się 
					// przez 100 - nie jest przesteny
	}
	else if (rok % 4 == 0)
	{
		return true; // jeśli rok nie dzieli się przez 100 ale dzieli się 
					// przez 4 to jest przestepny
	}
	return false; // W każdym przeciwnym przypadku (czyli jeśli rok nie dzieli 
				// się przez 4) - rok nie jest przestępny
}

int IleDniMaRok(int rok)
{
    if (CzyRokJestPrzestepny(rok))
    {
        return 366;
    }
    return 365;
}

void NapiszCzyRokJestPRzystepnyIIleMaDni(int rok)
{
    var ileDniMaRok = IleDniMaRok(rok);
    if (CzyRokJestPrzestepny(rok)) 
    {
        Console.WriteLine("Rok " + rok + " jest przestępny i ma " + ileDniMaRok + " dni");
    }
    else
    {
        Console.WriteLine("Rok " + rok + " nie jest przestępny i ma " + ileDniMaRok + " dni");
    }
}

NapiszCzyRokJestPRzystepnyIIleMaDni(2000);
NapiszCzyRokJestPRzystepnyIIleMaDni(2023);
```

Zrobiliśmy kolejną metodę (funkcję) - `IleDniMaRok`. Teraz to oka określa liczbę dni w roku. Natomiast funkcja "NapiszCzyRokJestPRzystepnyIIleMaDni" - rzeczywiście teraz zajmuje się tylko drukowaniem informacji użytkownikowi.

## Zadanie

TBD

