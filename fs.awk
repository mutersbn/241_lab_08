#!/bin/gawk -f
BEGIN	{
	d = 0	# count for number of directories
	f = 0	# count for number of files
	l = 0	# count for number of links
	t = 0	# count for total
	s = 0	# count for storage (Bytes)
	}
	$1 ~ /^d[rwxts-]{9}/	{d += 1}		# directory
	$1 ~ /^-[rwxts-]{9}/    {f += 1}    	# files
	$1 ~ /^l[rwxts-]{9}/    {l += 1}    	# links
							{t = d + f + l} # total
	$5						{s += $5}		# storage (bytes)
END	{print ""
	 print "Here is the summary of files under your home directory:"
	 print ""
	 print "directories   files     links      total       storage(Bytes)"
	 print "============================================================="
	 printf "%-13d %-9d %-11d %-10d %-10d\n\n", d, f, l, t, s
	}

### In response to the question in part 1, we would simply adjust our command
### to say 'gawk -f filesummary.awk .' instead, where '.' is the current
### directory.
