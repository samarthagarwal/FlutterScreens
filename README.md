# Flutter Login Screens

A collection of Login Screens, Buttons and Loaders with attractive UIs, built with Flutter, ready to be used in your applications.

###### Last Update: Added Loaders

## Screenshots And Usage

## Loaders

![Screenshots on iOS](./screenshots/loaders_1.gif)

`ColorLoader` requires `colors` and `duration` as mandatory parameters. `FlipLoader` and `FlipLoader2` do not require any parameters.

#### Color Loader
```
List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.blue
];
 

//Use in widget tree
ColorLoader(
   colors: colors,
   duration: Duration(milliseconds: 1200)
),
```

#### Flip Loader
```
FlipLoader() // No parameters required
```
If you want to change the icon, size or color, as of now, please edit the file `lib/loaders/flip_loader.dart`.

#### Flip Loader 2
```
FlipLoader2() // No parameters required
```
If you want to change the icon, size or color, as of now, please edit the file `lib/loaders/flip_loader_2.dart`.

___
###### I am working on more loaders. These loaders will also be updated and will be parameterized for easy usage and customization.
___

## Buttons

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
##Login Screens

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

