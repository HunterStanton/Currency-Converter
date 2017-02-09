# Currency Converter
A currency converter for Apple TV using accurate exchange rate data from the Fixer.io JSON API. Capable of converting between GBP, USD, AUD, CAD, INR, and EUR.

## Usage
Select the base currency, select the currency you want to convert into, and then type in a value amount and hit convert. The output value will appear on the screen, as well as the full name of the currency.

## Important Things to Know
You *must* be online to use this application. I will update it in the future to cache exchange rates and use them in place of getting the live data, so that the application can be used online (as well as cut down on the amount of API calls it makes and data it consumes). If you try to use this offline it won't work, so I wouldn't try it.

## For The Future
I am going to be improving upon these things in future updates:
- Improve UI (right now, it's not exactly obvious what is supposed to be entered into the box)
- Add more currencies, the API supports far more
- Add caching support for offline use
- Eliminate any bugs that may still be hiding and make sure the error handling handles any common issues
