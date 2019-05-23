# Classic ruby

Well in fact is not :)

As I started learning `functional programming` I begin loosing `OOP` style also in `ruby` language which is why you'll see in this code only class methods.

This was especially in fear of having bugs in long classes maintained by some other developers.

Here's an example of what I mean:

```
class Payment

  def initialize
  end

  # [Tons of code here]

  def upgrade_plan
    # [Tons of code here]
    @plan = Plan.new(...)   # if anybody at some point removes this line...
    # [Tons of code here]
  end

  # [Tons of code here]

  def pay
    # [Tons of code here]
    total += @plan.total    # ... here you'll have an error and a hard time fixing it!
    # [Tons of code here]
  end

end
```

This made me start doing this instead:

```
class Payment

  def self.upgrade_plan
    # [Tons of code here]
    plan = Plan.new(...)    # You can still instanciate stuff, just have no instance variables
    # [Tons of code here]
  end

  def self.pay(plan)
    # [Tons of code here]
    total += plan.total    # Here you know you'll have or not a `plan` variable
    # [Tons of code here]
  end

end
```

This ensures your code is more predictable, although some of colleagues might raise an eyebrow.

## Testing

Nothing fancy but I think is worth mentioning in each test I try to mock the least amount of code possible, ie external NET calls.

So eg in `payment_service_spec.rb` I prefer mock the deeply nested HTTP call instead of mocking the `ClassicRuby::GeolocationService::Client` class.
