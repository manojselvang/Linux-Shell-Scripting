# Common Netstat Commands

## Basic

```bash
netstat                     # show active connections
```

## Listening Ports

```bash
netstat -l                  # show listening ports
netstat -ln                 # listening ports (no DNS)
netstat -lpn                # listening + process info
```

## TCP / UDP

```bash
netstat -t                  # TCP connections
netstat -u                  # UDP connections
netstat -tu                 # TCP + UDP
```

## Most Used

```bash
netstat -tulnp              # all listening ports with process
```

## Established Connections

```bash
netstat -an | grep ESTABLISHED   # active established connections
```

## By Port

```bash
netstat -tulnp | grep :80        # filter by port
```

## By Process

```bash
netstat -tulnp | grep nginx      # filter by process
```

## Routing

```bash
netstat -r                  # routing table
```

## Interfaces

```bash
netstat -i                  # network interfaces
```

## Statistics

```bash
netstat -s                  # protocol statistics
```

## Continuous

```bash
netstat -c                  # live monitoring
```

---

## Note

`netstat` is deprecated on most modern systems

Use:

```bash
ss -tulnp
```
