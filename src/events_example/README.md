# Dry-Events

In the amazing [dry-rb](https://dry-rb.org) ecosystem I found this `dry-events` gem (pun intended).

From my understanding it aims to mitigate side effects so you can test `User.create` without worrying too much about mocking `Mailers`, `Analytics` and many other side effects called by `#afer_save` (now called `#after_commit`) being run.
