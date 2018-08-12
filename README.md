# Flutter Login Screens

A collection of Login Screens with attractive UIs built with Flutter ready to be used in your applications.

## Screenshots And Usage

### Last Update: Added Buttons

![Screenshots on iOS](./screenshots/buttons1.png)


#### Simple Round Button

```
SimpleRoundButton(
    backgroundColor: Colors.redAccent,
    buttonText: Text("LOGIN", 
        style: TextStyle(
            color: Colors.white
        ),
    ),
    textColor: Colors.white,
)
```

#### Simple Round Icon Button 

```
SimpleRoundIconButton(
    backgroundColor: Colors.orangeAccent,
    buttonText: Text("SEND EMAIL", 
        style: TextStyle(
            color: Colors.white
        ),
    ),        
    textColor: Colors.white,
    icon: Icon(Icons.email),
)
```

#### Simple Round Icon Only Button 
```
SimpleRoundOnlyIconButton(
  backgroundColor: Colors.blueAccent,
  icon: Icon(Icons.phone),
  iconAlignment: Alignment.center,
)
```
___

### Login Screen 1

![Screenshots on Android and iOS](./screenshots/login_screen_1.png)

##### Usage

`Container(
    child: LoginScreen1(
        primaryColor: Color(0xFF4aa0d5),
        backgroundColor: Colors.white,
        backgroundImage: new AssetImage("assets/images/full-bloom.png"),
    ),
 )`
 
 ### Login Screen 2
 
 ![Screenshots on Android and iOS](./screenshots/login_screen_2.png)
 
 ##### Usage
 
 `Container(
     child: LoginScreen2(
       backgroundColor1: Color(0xFF444152),
       backgroundColor2: Color(0xFF6f6c7d),
       highlightColor: Color(0xfff65aa3),
       foregroundColor: Colors.white,
       logo: new AssetImage("assets/images/full-bloom.png"),
     ),
  )`
  
   ### Login Screen 3
   
   ![Screenshots on Android and iOS](./screenshots/login_screen_3.gif)
   
   ##### Usage
   
   `Container(
       child: LoginScreen3(),
    )`
  
  ## Contribution and Donation
  
  Feel free to contribute. If you like the project and want to donate, [click here](https://www.paypal.me/samarthagarwal).

