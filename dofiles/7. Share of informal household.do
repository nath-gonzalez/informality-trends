*Household counts by year
use "$input/LAC_lastyear_var.dta", replace

egen hogar_sedlac = group(id pais year)

bys hogar_sedlac: egen hh_worker = max(ocupado)


bys hogar_sedlac: egen hh_informal = max(informal_ss)
bys hogar_sedlac: egen hh_formal = max(formal_ss)




gcollapse (mean) jefe hh_worker hh_informal hh_formal (sum) n_jefe=jefe n_hh_worker=hh_worker n_hh_informal=hh_informal n_hh_formal=hh_formal, by(pais year)



gen share_hh_worker = (n_hh_worker/n_jefe)*100
gen share_hh_informal =  (n_hh_informal/n_hh_worker)*100
gen share_hh_formal =  (n_hh_formal/n_hh_worker)*100

gen share_inf =







