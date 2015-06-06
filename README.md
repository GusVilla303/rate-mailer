# rate-mailer
Rate Mailer

This app queries a mortgage broker's client database, compares each client's existing interest rate to current market interest rates, and if the difference between the interest rates is greater than a set "delta" the client is notified (via email) that refinancing is possibly beneficial to them.  

This project presumes you have installed and are running Redis. (if you need installion instructions, please [click here](https://github.com/redis-store/redis-rails)).
