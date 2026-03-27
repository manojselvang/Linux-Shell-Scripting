# Common Netstat Commands

# Basic
netstat                     # show active connections

# Listening Ports
netstat -l                  # show listening ports
netstat -ln                 # listening ports (no DNS)
netstat -lpn                # listening + process info

# TCP / UDP
netstat -t                  # TCP connections
netstat -u                  # UDP connections
netstat -tu                 # TCP + UDP

# Most Used
netstat -tulnp              # all listening ports with process

# Established Connections
netstat -an | grep ESTABLISHED   # active established connections

# By Port
netstat -tulnp | grep :80        # filter by port

# By Process
netstat -tulnp | grep nginx      # filter by process

# Routing
netstat -r                  # routing table

# Interfaces
netstat -i                  # network interfaces

# Statistics
netstat -s                  # protocol statistics

# Continuous
netstat -c                  # live monitoring
```

## Note

`netstat` is deprecated on most modern systems

Use:

```
ss -tulnp
```

