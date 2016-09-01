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
```python
getDevices()
```
Prints the name and status of every device connected with the Particle account  
_Arguments_   
* None  

_Returns_  
* None  

***
```python
getConnection()
```
Tells whether the Photon is connected to the internet or not  
_Arguments_  
* None  

_Returns_    
*  Returns `True` if the device associated with the Photon's name is connected the internet and `False` if the device is not.  

***  
```python
getFunctions()
```
Prints the list of functions that can be executed by the Photon.  
_Arguments_  
* None  

_Returns_  
* None  

***
```python
getVariables()
```  
Prints the list of variables currently available for query on the Photon.  
_Arguments_  
* None  

_Returns_  
* None  

***
```python
fetch(String variable)
```  
Returns the value associated with the given Particle variable.  
_Arguments_  
*  `String variable` - Name of the variable that you want to query   

_Returns_   
*  The value associated with that variable  

***
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

  