source("data-raw/download.R")

aqs_params <- downloadAQSTable("Parameters")
use_data(aqs_params, overwrite = TRUE)

aqs_quals <- downloadAQSTable("Qualifiers - all")
use_data(aqs_quals, overwrite = TRUE)

aqs_units <- downloadAQSTable("Units")
use_data(aqs_units, overwrite = TRUE)

aqs_durations <- downloadAQSTable("Durations")
use_data(aqs_durations, overwrite = TRUE)

aqs_coll_freq <- downloadAQSTable("Collection Frequencies")
use_data(aqs_coll_freq, overwrite = TRUE)

aqs_mon_networks <- downloadAQSTable("Network Affiliations for Monitors")
use_data(aqs_mon_networks, overwrite = TRUE)

aqs_mon_types <- downloadAQSTable("Monitor Types")
use_data(aqs_mon_types, overwrite = TRUE)

aqs_poll_standards <- downloadAQSTable("Pollutant Standard IDs")
use_data(aqs_poll_standards, overwrite = TRUE)

aqs_aqi <- downloadAQSTable("AQI breakpoints")
use_data(aqs_aqi, overwrite = TRUE)

aqs_cert_agencies <- downloadAQSTable("Certifying Agencies by Monitor")
use_data(aqs_cert_agencies, overwrite = TRUE)

aqs_agencies <- downloadAQSTable("Agencies - all")
use_data(aqs_agencies, overwrite = TRUE)

aqs_states <- read.table("https://aqs.epa.gov/aqsweb/codes/data/StateCountyCodes.csv",
                         sep = ",", header = TRUE, skip = 1, stringsAsFactors = FALSE)
names(aqs_states) <- sub("\\.", "_", names(aqs_states))
use_data(aqs_states, overwrite = TRUE)

aqs_cities <- downloadAQSTable("Cities")
use_data(aqs_cities, overwrite = TRUE)

aqs_cbsa <- downloadAQSTable("CBSAs")
use_data(aqs_cbsa, overwrite = TRUE)

aqs_csa <- downloadAQSTable("CSAs")
use_data(aqs_csa, overwrite = TRUE)

aqs_regions <- read.table("https://aqs.epa.gov/aqsweb/codes/data/AQCR.csv",
                         sep = ",", header = TRUE, skip = 1, stringsAsFactors = FALSE)
names(aqs_regions) <- sub("\\.", "_", names(aqs_regions))
use_data(aqs_regions, overwrite = TRUE)
