The spring-semester fluids lab will use Matlab as the primary programming language. As you may have learned last semester, there are many ways to address the Particle Photons (via direct programming and Python are the ones you are probably most familiar with). In the fluids lab, the lab TAs will _only_ be providing support for Matlab. Once you perform the initial setup on the Particle Photon, you will not need to re-flash any new c code for the entirety of the semester. The goal with this change is to help you focus on learning a single programming language and developing useful skills for collecting, processing, and presenting data.

### Matlab
The Matlab code has been designed to utilize the latest version of Matlab (currently 2016a). Matlab does not support HTML PUT requests. Currently, Matlab will call cURL from a unix terminal to upload local code. This functionality will be added in later editions.  

### Python
Although the TAs will not be providing you with support for any Python programming, if you prefer to use this method we do have some introductory tutorials and materials as listed below.

[Python to Particle Tutorial](https://github.com/d008/MAE224/wiki/Lab-0:-Python-to-Particle-Communication)

If you want to run the Python code make sure that you have the most up-to-date version of Python 2.7.x.
Furthermore, if you wish to be able to flash local code to the Particle Photon, you will need to install the requests module.
This can be done by simply entering

```
pip install requests
```
into the terminal

