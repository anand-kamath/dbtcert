select * from 
{{ ref('hst_airports') }}
where aiport_ident = '01CN'