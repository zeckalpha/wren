class Foo {}

(new Foo).someUnknownMethod(1) // expect runtime error: Foo does not implement method 'someUnknownMethod' with 1 argument.