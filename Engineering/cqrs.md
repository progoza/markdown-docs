# CQRS Command/Query responsibility separation 


Classes responsible for reading the data (query) should be separated from classes that are responsible for changing the state of the application (commands i.e. "writes"). 
It means that queries and commands are separated and should use separate models. 

- commands should be task centric, not data-model centric (e.g. "Book a room" not "Set room reservation to booked"); commands can be queued for async processing, they contain validation logic and change the state of the application, 
- querries never change the state of the application, they return DTOs that do not contain any business logic.

In CQRS  commands and querries may run in different processes and/or using different DB  instance for querries (readonly DB replica). This gives high scaleability of the system.

## Event sourcing

CQRS fits with event-base programming models. Assuming each command is "logged" (by transmitting an event) - we can store the sequence of events (in Event Store) and then re-create the application state based on these events. 

