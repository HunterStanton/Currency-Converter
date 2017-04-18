//
//  Currency.swift
//  Currency Converter
//
//  Created by Hunter Stanton on 2/8/17.
//  Copyright © 2017 Hunter Stanton. All rights reserved.
//
//  The class that handles conversion of currency.
//  This class will use SwiftyJSON to contact the Fixer.io API to get live, accurate conversion rates.
//  In the future it will also store the conversion rates offline, so that Internet is not needed to use this application.

import Foundation
import SwiftyJSON

class Currency
{
    
    
    /// Currency dictionary to hold currency names used for showing the currency name in the UI
    static let currencyNames: [String:String] = [
    "USD":"United States Dollars",
    "GBP":"British Pounds",
    "EUR":"Euros",
    "INR":"Indian Rupees",
    "AUD":"Australian Dollars",
    "CAD":"Canadian Dollars"]
    
    
    /// Gets the current exchange rate between two currencies.
    ///
    /// - Parameters:
    ///   - base: The base currency.
    ///   - currency: The currency that the base will be compared against.
    /// - Returns: The exchange rate.
    static func GetExchangeRate(base: String, currency: String) -> Float
    {
        // A locking variable so this function doesn't return until the value we need is downloaded
        // Locking isn't really ideal because the UI locks up while this is returning.
        // TODO: change this
        var locked = true
        
        // The JSON object that will hold our downloaded data
        var json: JSON = JSON([Data].self)
        
        // Grab the exchange rate from the Fixer server and save the JSON response
        if let url = NSURL(string: "https://api.fixer.io/latest?base=\(base)&symbols=\(currency)")
        {
            // Change the timeouts so the application doesn't hang for a long time if offline
            URLSession.shared.configuration.timeoutIntervalForRequest = 2
            URLSession.shared.configuration.timeoutIntervalForResource = 2
            URLSession.shared.dataTask(with: url as URL, completionHandler: { (data, response, error) in
                if let error = error
                {
                    // If any error happens, log it
                    print("An error has occurred: \(error.localizedDescription)")
                } else
                {
                    if let data = data
                    {
                        // Store the downloaded JSON and also remove the lock
                        json = JSON(data: data)
                        locked = false
                    } else
                    {
                        // If nothing was downloaded for some reason, log it
                        print("No data was downloaded.")
                        locked = false
                    }
                }
            }).resume()
        }
        
        // Hold while the asynchronous download completes
        while(locked)
        {
            wait(time: 1)
        }
        
        // Print and also return the exchange rate
        print(json["rates"]["\(currency)"].floatValue)
        return json["rates"]["\(currency)"].floatValue
    }
    
    
    /// Gets the amount of currency that another currency could buy.
    ///
    /// - Parameters:
    ///   - currency1: The first currency.
    ///   - currency2: The second currency.
    ///   - value: The amount of the first currency.
    /// - Returns: The amount of the second currency that the first currency could buy.
    static func ConvertCurrency(currency1: String, currency2: String, value: Float) -> Float
    {
        if(currency1 == currency2)
        {
            // User has selected two of the same currencies, and the exchange rate will alwyas be 1.0
            return 1.0
        }
        else
        {
        // Grab the exchange rate
        let rate: Float = GetExchangeRate(base: currency1, currency: currency2)
        
        // Multiply rate * value to get the amount of currency2 that currency1 could buy
        return rate * value
        }
    }
    
    
    /// Wait
    /// Wait the specified time interval before continuing execution.
    ///
    /// - Parameter time: The time interval to wait.
    static func wait(time: TimeInterval)
    {
        RunLoop.current.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: time) as Date)
    }
}
