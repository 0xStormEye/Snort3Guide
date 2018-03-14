---------------------------------------------------------------------------
-- This config is used for testing purposes. --
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- 1. configure environment
---------------------------------------------------------------------------

-- setup the network addresses you are protecting
HOME_NET = '10.0.0.0/8,172.16.0.0/16,192.168.0.0/24'

-- set up the external network addresses.
-- (leave as "any" in most situations)
EXTERNAL_NET = 'any'

---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- 2. configure dependencies
---------------------------------------------------------------------------

require('snort_config')  -- for loading

conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_extra.lua')
dofile(conf_dir .. '/file_magic.lua')

---------------------------------------------------------------------------
-- 3. configure modules
---------------------------------------------------------------------------
--
-- mod = { } uses internal defaults
-- you can see them with snort --help-module mod
-- comment or delete to disable mod functionality
--
-- you can also use default_ftp_server and default_wizard
---------------------------------------------------------------------------

-- uncomment normalizer if you are inline or not --pedantic
normalizer = { }

-- uncomment these to analyze Snort performance
--latency = { }
--profiler = { }
--perf_monitor = { }

stream = { }
stream_ip = { }
--stream_icmp = { }
stream_tcp = { }
stream_udp = { }
stream_user = { }
stream_file = { }

-- appid = {
-- 	app_detector_dir = '/var/lib/snort/lib',
--	log_stats = true,
-- }

arp_spoof = { }
back_orifice = { }
dnp3 = { }
dns = { }
http_inspect = { }
imap = { }
pop = { }
reputation = { }
rpc_decode = { }
sip = { }
ssh = { }
ssl = { }
telnet = { }

-- see snort_defaults.lua for default_*
gtp_inspect = default_gtp
port_scan = default_med_port_scan
smtp = default_smtp

ftp_server = default_ftp_server
ftp_client = { }
ftp_data = { }

-- see file_magic.lua for file id rules
file_id = { file_rules = file_magic }

wizard = default_wizard

---------------------------------------------------------------------------
-- 4. configure rules
---------------------------------------------------------------------------

-- see snort_defaults.lua for other nets, ports, and servers
-- and default references and classifications

-- references = default_references
-- classifications = default_classifications

---------------------------------------------------------------------------
-- 5. others
---------------------------------------------------------------------------

-- Printing alerts to STDOUT, use -q for showing alerts only.
alert_full = {
	file = false,
	limit = 600, -- 600MB
}

-- Just logs
output = {
    verbose = true,
    quiet = false,
    logdir = "/var/lib/snort/var/log/",
}

-- For debugging rules
search_engine = {
    debug = true,
    show_fast_patterns = true,
}

-- Checksum mode off for pcap parsing.
network ={
    checksum_eval = none,
}

---------------------------------------------------------------------------
------------------------------- Stormeye ----------------------------------
---------------------------------------------------------------------------

include '/var/lib/snort/etc/test-rules.lua'

ips = {
    enable_builtin_rules = false,
    include = '/var/lib/snort/etc/test-rules.rules',
}
