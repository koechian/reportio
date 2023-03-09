# Reportio

This is an application I built during my Software Engineering attachment period at Reeve Technologies. It is built with flutter and incorperates stuff like USSD API's, SMS Services via Twilio and Google Cloud services. Given that it was made using Flutter, it is available for IOS, Android and Web.

### Introduction

- reportio is a solution for getting daily alerts on matters security, traffic and news for your location.
- It aims to provide SMS alerts for its subscribers on relevent information like what roads are gridlocked etc.

### Structure

- The app has three facets:  
   a. The whistleblower app - built with Flutter and Google Cloud backend for Data Storage and Authentication  
   b. The USSD signup module [available in the USSD Runner branch] - PHP and hosted on Heroku  
   c. The SMS service hosted on Twilio (TBD)
- The stack used includes:  
  a. [Flutter](flutter.dev) by Google  
   b. [Heroku](heroku.com)  
   c. [Twilio](twilio.com)  
   d. [AfricasTalking](https://account.africastalking.com)

### Features

- Message creation for broadcast
- Verification of messages before broadcast
- Realtime database interaction and UI updates
- A neat UI
