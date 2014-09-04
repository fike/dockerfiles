; BIND zone file: site.com
$TTL 300 ; 5 minutes
@ IN SOA ns1.site.com. hostmaster.site.com. (
                        201409040101      ; serial (YYYYMMDDXX)
                        3600            ; refresh (3600 = 1h)
                        600             ; retry (600 = 10m)
                        86400           ; expire (86400 = 1d)
                        3600            ; negative cache TTL (3600 = 1h)
                        )
;
@                       IN      NS      ns1.site.com.
@                       IN      NS      ns2.site.com.
;
@                       IN      MX      10 mx.site.com.
;
@                       IN      A      XXX.XXX.XXX.XXX
ns1                     IN      A      XXX.XXX.XXX.XXX
ns2                     IN      A      XXX.XXX.XXX.XXX
mx                      IN      A     XXX.XXX.XXX.XXX
;
www                 IN      A       XXX.XXX.XXX.XXX

