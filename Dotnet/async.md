# Async methods

C# provides a mean for creating asyncronous code with async/await keywords.

	Note: asyncronous code is not multithread code.

Thanks to asyncronous methods we can release the running thread when it is possible (e.g. while waiting for I/O, etc), and move that thread to another instructions.  
Multithreading code is different - it is actually spinnign multiple threads to execute mutiple instructions in parallel. Multithreading code can take advantage of multiple CPU cores/threads to execute more coperations in a given unit of time.

If there is no support in programming language for the asyncronous programming, it required to use callbacks and similar constructs - whic usually made code less readable/more complex. C# comes with async/await which makes asyncronous code looks mearly the same as syncronous. 

## async method

async keyword (apply it before the name of return type) indicates the method is asyncronous

 - usually it returns `Task` or `Task<TResult>`
 - can return void for EventHandlers (but async voids cannot be awaited), 
 - should have at least one `await` in the body (code will run ok in such case, but it does not make sense, as the code will run synchronously)

Async method runs normally until it reaches await operator. When it does, it interrupts to wait until the awaited method completes. Until then - when the runnign thread becomes idle - the code of the calling method will continue. 

## await Task.WhenAll()

Use this to await for multiple async methods at the sametime. 

```csharp
async Task Method1() 
{
    await Task.Delay(1000);
    Console.WriteLine("Method 1..");
} 

async Task Method2()
{
    await Task.Delay(1000);
    Console.WriteLine("Method 2...");
}

// this will run methods sequentially
var start1 = DateTime.Now;
await Method1();
await Method2();
Console.WriteLine("Await each method - took " + (DateTime.Now - start1).Duration());

var start2 = DateTime.Now;
var t1 = Method1();
var t2 = Method2();
await Task.WhenAll(t1, t2);
Console.WriteLine("Await all - took " + (DateTime.Now - start2).Duration());
```

result:

```
Method 1..
Method 2...
Await each method - took 00:00:02.0622545
Method 2...
Method 1..
Await all - took 00:00:01.0057182
```

WhenAll() "gives impression" of parallelism (but there is no parallelism - in fact, code just continues to execue as thread faces "Delay()" method).

