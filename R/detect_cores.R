# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
#     Copyright (C)  Laura Codazzi, Alessandro Colombi, Matteo Gianella                           |
#                                                                                                 |
#     Part of this code is adapted from BDgraph package (C Reza Mohammadi)                        |
#                                                                                                 |
#     FGM is free software: you can redistribute it and/or modify it under                        |
#     the terms of the GNU General Public License as published by the Free                        |
#     Software Foundation; see <https://cran.r-project.org/web/licenses/GPL-3>.                   |
#                                                                                                 |
#     Maintainer: Laura Codazzi (laura.codazzi@tuhh.de),                                          |
#                 Alessandro Colombi (a.colombi10@campus.unimib.it),                              |
#                 Matteo Gianella (matteo.gianella@polimi.it)                                     |
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |

get_cores = function( cores = NULL )
{
    num_machine_cores = detect_cores()
    if( is.null( cores ) ) cores = num_machine_cores - 1
    if( cores == "all" )   cores = num_machine_cores
    .C( "omp_set_num_cores", as.integer( cores ), PACKAGE = "FGM" )
    return( cores )
}

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
detect_cores = function( all.tests = FALSE, logical = TRUE )
{
	if( .Platform $ OS.type == "windows" )
	{
		if( logical )
		{
			res <- Sys.getenv( "NUMBER_OF_PROCESSORS", "1" )
			as.numeric( res )
		}else{
			x = system( "WMIC CPU Get DeviceID,NumberOfCores", intern = TRUE )
			sum( utils::read.table( text = x, header = TRUE ) $ NumberOfCores )
		}
	}else{
		systems = list(

			linux =
				if( logical )
					"grep processor /proc/cpuinfo 2>/dev/null | wc -l"
				else
					"cat /proc/cpuinfo | grep 'cpu cores'| uniq | cut -f2 -d:",

			darwin =
				if( logical )
					"/usr/sbin/sysctl -n hw.logicalcpu 2>/dev/null"
				else
					"/usr/sbin/sysctl -n hw.physicalcpu 2>/dev/null",

			solaris =
				if( logical )
					"/usr/sbin/psrinfo -v | grep 'Status of.*processor' | wc -l"
				else
					"/bin/kstat -p -m cpu_info | grep :core_id | cut -f2 | uniq | wc -l",

			freebsd = "/sbin/sysctl -n hw.ncpu 2>/dev/null",

			openbsd = "/sbin/sysctl -n hw.ncpu 2>/dev/null",

			irix = c( "hinv | grep Processors | sed 's: .*::'", "hinv | grep '^Processor '| wc -l" )
		)

		for( i in seq( systems ) )
		{
			if( all.tests || length( grep( paste0( "^", names( systems )[i] ), R.version $ os ) ) )
				for( cmd in systems[i] )
				{
					a = try( suppressWarnings( system( cmd, TRUE ) ), silent = TRUE )
					if( inherits( a, "try-error" ) ) next
					a <- gsub( "^ +", "", a[1] )
					if( length( grep( "^[1-9]", a ) ) ) return( as.integer( a ) )
				}
		}

		NA_integer_
	}
}

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
