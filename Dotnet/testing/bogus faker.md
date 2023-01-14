# Bogus Faker

Handy tool to generate test data. 
https://github.com/bchavez/Bogus - icludes a "Great C# Example" which does the job.

Anyway to make it short:

1. Create a faker for a given class

```csharp
public class SomeClass
{
	public string firstName;
	public string email;
}

var someClassFaker = new Faker<SomeClass>()
	.RuleFor(o => o.firstName, f => f.Name.FirstName())
	.RuleFor(o => o.email, f => f.Internet.Email());
```

2. Generate an object using faker:

```csharp
var someClassObject = someClassFaker.Generate();
```

3. If we need to use different constructor:

```csharp
var someClassFaker = new Faker<SomeDifferentClass>()
	 .CustomInstantiator(f => new SomeDifferentClass(f.Random.Replace("###-##-####")));
```

4. We can enable strict mode if we want to be sure that all fields are covered with rules

```csharp
var someClassFaker = new Faker<SomeClass>()
	.StrictMode(true)
	.RuleFor(o => o.firstName, f => f.Name.FirstName())
	.RuleFor(o => o.email, f => f.Internet.Email());
```

5. One rule for all properties of a given type - if we want to save on time:

```csharp
var someClassFaker = new Faker<SomeClass>()
	.RuleForType(typeof(string), f => f.Random.AlphaNumeric(10));
```

## Features of Bogus Faker

Bogus supports generation of multiple types of data:

 - all basic type values,
 - addresses (City name, country name, zip code..), 
 - phone numbers,
 - financial stuff (account numbers, amounts),
 - dates (recent past, near future, from given period, etc. etc.),
 - Internet stuff (URLs, Emials , IPs, ...),
 - lorem ipsums,
 - personal data (names, last names, ),
 - system data (file names,.. ), and more.

## Faking base class

Fakers can also be created without using fluent API - e.g. by using inheritance. This might be handy to create a faker for base class (so that the same properties don't need to be repeated for sub-classes). IT is illustrated on the example

```csharp
class BaseClass 
{
	public int CommonProperty { get; set; }
}

class SubClass : BaseClass
{
	public int SubProperty { get; set; }	
}

class BaseClassFaker<T> : Faker<T> where T : BaseClass
{
	public BaseClassFaker() 
	{
		RuleFor(o => o.CommonProperty, f => f.Random.Int(1,100));
	}
}

var subClassFaker = BaseClassFaker<SubClass>()
	RuleFor(o => o.SubProperty, f => f.Random.Int(1,100)); 
	// BaseProperty is already faked
```
