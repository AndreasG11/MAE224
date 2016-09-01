#Photon Class - Python

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
