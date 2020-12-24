# Dnsmasq Docker Image For nosticOS

This is a docker image for the dnsmasq daemon intended to be run as a system-level service by nosticOS. It is based on Alpine Linux and makes use of environment variables for container separation rather than volume mounts to the host.

## Usage

Whilst this image *may* work for you as a standalone container its primary purpose is to integrate into nosticOS.

To orchestrate the container either supply the correct environment variables
to the container or via command line options as follows:

```shell
docker run -it -e DNSMASQ_DEBUG=1 appnostic/nos-service-dnsmasq -k --log-facility=-
```

## Environment variables

Environment variables are made available for some of the options of `dnsmasq.conf`. You are free to fork this project and add more variables and if you feel these benefit the community please consider contributing a pull request. 

See this [dnsmasq.conf](http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq.conf.example) example for information on each of the options.

The table below outlines the available options:

| Variable                   | Option                       |
|----------------------------|-----------------------------------|
| DNSMASQ_LISTEN_ADDRESS     |  listen-address |
| DNSMASQ_DNS_FORWARD        |  server|
| DNSMASQ_DOMAIN             |  domain |
| DNSMASQ_INTERFACE          |  interface |
| DNSMASQ_DHCP_RANGE         |  dhcp-range |
| DNSMASQ_DEBUG              |  log-dhcp and log-queries |
| DNSMASQ_DNS_PORT           |  port |
| DNSMASQ_DHCP_GATEWAY       |  appends dhcp-option 3 line |
| DNSMASQ_DHCP_DNS           |  appends dhcp-option 6 line |
| DNSMASQ_DHCP_NTP           |  appends dhcp-option 42 line |

If you find an option you require is missing, report this or make a PR adding that feature.

