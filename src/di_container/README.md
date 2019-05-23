# DRY libraries

This example I've used the nice [dry-rb](https://dry-rb.org) collection of libraries, especially the [dry-system](https://dry-rb.org/gems/dry-system/) gem.

It mimics perfectly `JAVA Spring Bean` where `Dependency Injection` and `Inversion of Control` allows the developer to define and mount classes connection at any point rather than just everything at once during boot time.

Testing gets easier as we can now stub components or change the connection class depending on the specific requirements.

I am not sure how this behaves with the code editor as it could confuse it and stop giving advices on the available methods of a component. Need to investigate further.

At the end I still quite like this approach.
