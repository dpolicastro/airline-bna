# Airline example from Rajeev's course on udemy.  

---
### Steps to practice  
Execute the commands on the project root directory.

1. Creating the BN archive.  
```sh
$ composer archive create -n . -t dir -a dist/airline@0.0.1.bna
```

2. Installing the BNA to fabric.
```sh
$ composer network install -c PeerAdmin@hlfv1 -a dist/airline@0.0.1.bna
```

3. Starting the BNA.  
```sh
$ composer network start -c PeerAdmin@hlfv1 -n airline-network -V 0.0.1 -A admin -S adminpw
```

4. Importing the network card that has been created.  
```sh
$ composer card import -f admin@airline-network.card
```

5. Testing the network.    
```sh
$ composer network ping -c admin@airline-network
```

### Exposing the rest-api  

```sh
$ composer-rest-server -c admin@airline-network -n always -w true
```

### Creating new participant  

- John Doe (johnd) is the Network Administrator
```sh
$ composer participant add -d '{"$class":"org.acme.airline.participant.ACMENetworkAdmin","participantKey":"johnd","contact":{"$class":"org.acme.airline.participant.Contact","fName":"John","lName":"Doe","email":"john.doe@acmeairline.com"}}' -c admin@airline-network
```

- Will Smith (wills) works in the Logistics department
```sh
$ composer participant add -d '{"$class":"org.acme.airline.participant.ACMEPersonnel","participantKey":"wills","contact":{"$class":"org.acme.airline.participant.Contact","fName":"Will","lName":"Smith","email":"will.smith@acmeairline.com"}, "department":"Logistics"}' -c admin@airline-network
```

### Issue an identity  
```sh
$ composer identity issue -u johnd -a org.acme.airline.participant.ACMENetworkAdmin#johnd -c admin@airline-network -x

$ composer identity issue -u wills -a org.acme.airline.participant.ACMEPersonnel#wills -c admin@airline-network -x
```

### Import the cards
```sh
$ composer card import -f johnd@airline-network.card

$ composer card import -f wills@airline-network.card
```