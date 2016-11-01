#Photon Class - Python
On this page you will find a description of the Matlab class file used to access the Particle Photon. For examples on how to use this class see:

[Setting Up a Particle Photon](https://github.com/d008/MAE224/wiki/Setting-Up-a-Particle-Photon)

[Example 1: Read and Write Pins](https://github.com/d008/MAE224/wiki/Example-1-:-Read-and-Write-Pins)

[Example 2: Servos and PWMs](https://github.com/d008/MAE224/wiki/Example-1-:-Read-and-Write-Pins)

To download the class file follow this link [Photon.m](https://github.com/d008/MAE224/blob/master/Source%20Files/MATLAB%20v1/Photon.m)

##Constructor
```python
Photon(String name, String access_token)
```
_Arguments_
*  `String name` - Photon ID or Photon name. Requires setup of Particle Photon  
*  `String access_token` - Authorization token retrieved from build.particle.io 
 
_Returns_
*  A Photon object that knows how to access the following functions and methods  
    
## Functions
###analogRead
```python
analogRead(String pin)
```  
Sample the bit value of an analog pin.  
_Arguments_ 
*  `String pin` - The name of the pin connected to sample.  

_Returns_  
* The integer value at that pin. Takes value from 0-4095 corresponding to 0-3.33V  

***    
###analogWrite
```python
analogWrite(String pin, Int Value)
```  
Writes a bit value to an analog pin.  
_Arguments_ 
*  `String pin` - The name of the pin connected to sample.  
*  `Int value` - The bit value to write. Takes a value between 0-255 corresponding to 0-3.33V.    

_Returns_  
* None     

***  
###attachServo
```python
attachServo(String pin)
```  
Each Photon can support a single servo attachment. Attaches a servo object to the Photon at the given pin.  
_Arguments_ 
*  `String pin` - The name of the pin connected to the servo signal input.  

_Returns_  
* None  

***  
###detachServo
```python
detachServo()
```  
Detaches a servo object, if one is attached.  
_Arguments_ 
*  None  

_Returns_  
* None

***  
###digitalRead
```python
digitalRead(String pin)
```  
Sample the bit value of an digital pin.  
_Arguments_ 
*  `String pin` - The name of the pin connected to sample.  

_Returns_  
* The bit value at that pin. Takes value of 0 for LOW and 1 for HIGH  

***    
###digitalWrite
```python
digitalWrite(String pin, Int Value)
```  
Writes a bit value to an analog pin.  
_Arguments_ 
*  `String pin` - The name of the pin connected to sample.  
*  `Int value` - The bit value to write. Takes a value of 0 or 1 corresponding to HIGH or LOW.    

_Returns_  
* None     

***  
###fetch
```python
fetch(String variable)
```  
Returns the value associated with the given Particle variable.  
_Arguments_  
*  `String variable` - Name of the variable that you want to query   

_Returns_   
*  The value associated with that variable  

***
###flash
```python
flash(file=String filepath)
```  
Requires the `requests` module. Compiles and uploads a local file to the Particle Photon.   
_Arguments_ 
*  `String filepath` - File path to the file(s) that you want to flash as the Photon sketch  

_Returns_  
* None

***  
###getConnection
```python
getConnection()
```
Tells whether the Photon is connected to the internet or not  
_Arguments_  
* None  

_Returns_    
*  Returns `True` if the device associated with the Photon's name is connected the internet and `False` if the device is not.  

***  
### getDevices
```python
getDevices()
```
Prints the name and status of every device connected with the Particle account  
_Arguments_   
* None  

_Returns_  
* None  

***
###getFunctions
```python
getFunctions()
```
Prints the list of functions that can be executed by the Photon.  
_Arguments_  
* None  

_Returns_  
* None  

***
###getPin
```python
getPin(String pin)
```  
Converts the name of the string to the integer value associated with that pin.  
_Arguments_ 
*  `String pin` - The name of the pin connected to get the integer value of.  

_Returns_  
* None

***
###getPinMode
```python
getPinMode(String pin)
```  
Prints whether a pin is an input or output pin  
_Arguments_ 
*  `String pin` - The name of the pin connected to get the mode of.  

_Returns_  
* None  

***   
###getTone
```python
getTone(String pin)
```  
Returns the frequency of a square wave from a given pin, passed by String argument pin  
_Arguments_ 
*  `String pin` - The name of the pin connected to sample.  

_Returns_  
* The frequency of the pulsed signal

***  
###getVariables
```python
getVariables()
```  
Prints the list of variables currently available for query on the Photon.  
_Arguments_  
* None  

_Returns_  
* None  

***
###move
```python
move(Int position)
```  
Moves an attached servo object to the position  
_Arguments_ 
*  `Integer position` - Numerical position where the servo will move  

_Returns_  
* If successful returns the new position.  

***  
###push
```python
push(String functions, String value)
```  
Executes a Photon function and sends it a values  
_Arguments_ 
*  `String functions` - Name of the function that you want to execute
*  `String value` - Value/parameter to send to the function   

_Returns_  
*  The value returned by the function  

***  
###setFreq
```python
setFreq(Int frequency)
```  
Designates the frequency at which analogWrite/PWM outputs a signal 
_Arguments_ 
*  `Int frequency` - The frequency in Hz that analogWrit will output a signal  

_Returns_  
* 1 if successful, -1 if already designated as an input/output  

***  
###setInput
```python
setInput(String pin)
```  
Designates a pin to be an input pin  
_Arguments_ 
*  `String pin` - The name of the pin connected to sample.  

_Returns_  
* 1 if successful, -1 if already designated as an input/output  

***  
###setOutput
```python
setOutput(String pin)
```  
Designates a pin to be an output pin  
_Arguments_ 
*  `String pin` - The name of the pin connected to sample.  

_Returns_  
* 1 if successful, -1 if already designated as an input/output  

## Variables
###position
```python
position
```  
Current position of the connected servo
***  
###frequency
```python
frequency
```  
Frequency of the analogWrite and PWM sigmals
***  
###String
```python
String
```  
String record of the sampled data from every pin. Numerial positions corresponds to integer value of the pins.  
***  
###String2
```python
String2
```  
String record of which pins are input, output, servo, or undesigncated  
***  
