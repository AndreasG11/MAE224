Paste the following text into a new Python script.
    from Photon import *

    atoken = "abc123"                   #Change this to your access token
    name = "class1"
    g = Photon(name,atoken)         #Change this to your photons name
    g.getDevices()
    time.sleep(10)
    g.getFunctions()
    t = g.getVariables()
    print g.setFreq(500)
    print g.setInput('A0')
    print g.analogRead('A0')
