Paste the following text into a new Python script.

    ac = "abc123"                   #Change this to your access token
    g = Photon("class1",ac)         #Change this to your photons name
    g.getDevices()
    g.flash('PhotonCode.ino')
    time.sleep(10)
    g.getFunctions()
    t = g.getVariables()
    print g.setFreq(500)
    print g.setInput('A0')
    print g.setInput('A0')
    print g.analogRead('A0')
    #print g.flash("temp.ino")
