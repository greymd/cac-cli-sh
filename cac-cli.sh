#!/bin/bash
. ./cac-cli.conf
CAC_API_DOMAIN='https://panel.cloudatcost.com'
CAC_API_PARAM='/api/v1'
CAC_API_URL="${CAC_API_DOMAIN}${CAC_API_PARAM}"

# cac-listservers GET
cac-listservers () {
    curl -so- "$CAC_API_URL/listservers.php?key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR" -X GET | jq .
}

# cac-listtemplates GET
cac-listtemplates () {
    curl -so- "$CAC_API_URL/listtemplates.php?key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR" -X GET | jq .
}

# cac-listtasks GET
cac-listtasks () {
    curl -so- "$CAC_API_URL/listtasks.php?key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR" -X GET | jq .
}

# cac-resources GET
cac-resources () {
    curl -so- "$CAC_API_URL/cloudpro/resources.php?key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR" -X GET | jq .
}

# cac-powerop POST
cac-powerop () {
    local _action="$1" # poweron,poweroff,reset
    local _sid="$2"
    curl -so- --data "key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR&sid=$_sid&action=$_action" "$CAC_API_URL/powerop.php" | jq .
}

# cac-renameserver POST
cac-renameserver () {
    local _name="$1"
    local _sid="$2"
    curl -so- --data "key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR&sid=$_sid&name=$_name" "$CAC_API_URL/renameserver.php" | jq .
}

# cac-rdns POST
cac-rdns () {
    local _hostname="$1"
    local _sid="$2"
    curl -so- --data "key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR&sid=$_sid&hostname=$_hostname" "$CAC_API_URL/rdns.php" | jq .
}

# cac-console POST
cac-console () {
    local _sid="$1"
    curl -so- --data "key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR&sid=$_sid" "$CAC_API_URL/console.php" | jq .
}

# cac-runmode POST
cac-runmode () {
    local _mode="$1" # normal,safe
    local _sid="$2"
    curl -so- --data "key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR&sid=$_sid&mode=$_mode" "$CAC_API_URL/powerop.php" | jq .
}

# cac-build POST
cac-build () {
    local _cpu="$1" # 1,2,3,4...
    local _ram="$2" # 1024, 2048, 3096,...,32768
    local _storage="$3" # 10, 20, 30, 40,..., 1000
    local _os="$4"
    curl -so- --data "key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR&cpu=$_cpu&ram=$_ram&storage=$_storage&os=$_os" "$CAC_API_URL/cloudpro/build.php" | jq .
}

# cac-delete POST
cac-delete () {
    local _sid="$1"
    curl -so- --data "key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR&sid=$_sid" "$CAC_API_URL/cloudpro/delete.php" | jq .
}

# CAC original aliases
cac-ls () {
    local _elems='sid,ip,template,cpu,cpuusage,ram,ramusage,storage,hdusage,label,panel_note,rootpass'
    local _elems_jq=$(echo "$_elems" | tr ',' '\n' | sed 's/^/./' | xargs | tr ' ' ',')
    cac-listservers | jq -r ".data[] | [$_elems_jq] | @json" | sed 's/^\[//;s/\]$//' | sed "1i$_elems" | column -t -s','
}

cac-bld () {
    local _num="$1"
    local _cpu=$_num # 1,2,3,4...
    local _ram=$(($_num * 1024)) # 1024, 2048, 3096,...,32768
    local _storage=$(($_num * 10)) # 10, 20, 30, 40,..., 1000
    local _os="27"
    curl -so- --data "key=$CAC_API_KEY&login=$CAC_LOGIN_ADDR&cpu=$_cpu&ram=$_ram&storage=$_storage&os=$_os" "$CAC_API_URL/cloudpro/build.php" | jq .
}
