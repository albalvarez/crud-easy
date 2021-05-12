#!/bin/bash	
declare url="http://localhost:8080/api/v1/employees"  

# Crear datos
curl --silent --output /dev/null -d  '{"firstName":"Marta", "lastName":"Sanchez", "emailId": "marta@gml.com"}' -H "Content-Type: application/json" -X POST $url
curl --silent --output /dev/null -d  '{"firstName":"Pepe", "lastName":"Fernandez", "emailId": "pepe@gml.com"}' -H "Content-Type: application/json" -X POST $url
curl --silent --output /dev/null -d  '{"firstName":"Ana", "lastName":"Ramirez", "emailId": "ana@gml.com"}' -H "Content-Type: application/json" -X POST $url
curl --silent --output /dev/null -d  '{"firstName":"Camino", "lastName":"Rodriguez", "emailId": "camino@gml.com"}' -H "Content-Type: application/json" -X POST $url
curl --silent --output /dev/null -d  '{"firstName":"Daniel", "lastName":"Santiago", "emailId": "daniel@gml.com"}' -H "Content-Type: application/json" -X POST $url

#Get datos
curl  -sb -X GET $url
#Update datos

curl --silent --output /dev/null -d  '{"id":"4", "firstName":"UPDATENAME", "lastName":"UPDATELASTNAME", "emailId": "UPDATE@gml.com"}' -H "Content-Type: application/json" -X POST $url

#Borrar usuario ID11
curl -X DELETE $url/3




