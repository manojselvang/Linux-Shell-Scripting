# Common Netstat Commands

## Basic

netstat

## Listening ports

netstat -l
netstat -ln
netstat -lpn

## TCP / UDP

netstat -t
netstat -u
netstat -tu

## Most widely used

netstat -tulnp

## Established connections

netstat -an | grep ESTABLISHED

## Routing

netstat -r

## Interfaces

netstat -i

## Continuous

netstat -c

---

## note

`netstat` is deprecated on most modern systems

use:
ss -tulnp
