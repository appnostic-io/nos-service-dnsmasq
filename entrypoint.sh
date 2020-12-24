#!/bin/sh -e

if [ "${DEBUG}" == "true" ]; then
  set -x
fi

CONF_FILE="/etc/dnsmasq.conf"

SED=`which sed`  # Because I am soooo old fasioned ;-)
ECHO=`which echo`

# insert environment variables as config entries

if [ -n "${DNSMASQ_LISTEN_ADDRESS}" ]; then
  ${SED} -i "s/#listen-address=/listen-address=${DNSMASQ_LISTEN_ADDRESS}/" ${CONF_FILE}
fi

if [ -n "${DNSMASQ_DNS_FORWARD}" ]; then
  ${SED} -i "s/#server=/server=${DNSMASQ_DNS_FORWARD}/" ${CONF_FILE}
fi

if [ -n "${DNSMASQ_DOMAIN}" ]; then
  ${SED} -i "s/#domain=thekelleys.org.uk/domain=${DNSMASQ_DOMAIN}/" ${CONF_FILE}
fi

if [ -n "${DNSMASQ_INTERFACE}" ]; then
  ${SED} -i "s/#interface=/interface=${DNSMASQ_INTERFACE}/" ${CONF_FILE}
fi

if [ -n "${DNSMASQ_DHCP_RANGE}" ]; then
  ${SED} -i "s/#dhcp-range=/dhcp-range=${DNSMASQ_DHCP_RANGE}/" ${CONF_FILE}
fi

if [ -n "${DNSMASQ_DEBUG}" ]; then
  ${SED} -i "s/#log-queries/log-queries/" ${CONF_FILE}
  ${SED} -i "s/#log-dhcp/log-dhcp/" ${CONF_FILE}
fi

if [ -n "${DNSMASQ_DNS_PORT}" ]; then
  ${SED} -i "s/#port=/port=${DNSMASQ_DNS_PORT}/" ${CONF_FILE}
fi

if [ -n "${DNSMASQ_DHCP_GATEWAY}" ]; then
  ${ECHO} "dhcp-option=3,${DNSMASQ_DHCP_GATEWAY}" >> ${CONF_FILE}
fi

if [ -n "${DNSMASQ_DHCP_DNS}" ]; then
  ${ECHO} "dhcp-option=6,${DNSMASQ_DHCP_DNS}" >> ${CONF_FILE}
fi

if [ -n "${DNSMASQ_DHCP_NTP}" ]; then
  ${ECHO} "dhcp-option=42,${DNSMASQ_DHCP_NTP}" >> ${CONF_FILE}
fi


# Execute the provided command
DNSMASQ=`which dnsmasq`
exec ${DNSMASQ} "$@"
