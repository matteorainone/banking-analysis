/*n° totale di conti posseduti*/
CREATE TEMPORARY TABLE banca.numero_conti_cliente as
select cl.id_cliente, count(con.id_conto) as n_conti
from banca.cliente cl
left join banca.conto con
on cl.id_cliente=con.id_cliente
group by cl.id_cliente
order by cl.id_cliente
;
/*n° di transazioni in uscita ed in entrata su tutti i conti*/
CREATE TEMPORARY TABLE banca.numero_transazioni_in_out_conti as
select cl.id_cliente,
sum(case when ttr.segno ='+' then 1 else 0 end) as n_trans_in,
sum(case when ttr.segno ='-' then 1 else 0 end) as n_trans_out
from banca.cliente cl 
left join banca.conto con
on cl.id_cliente=con.id_cliente
left join banca.transazioni tr
on tr.id_conto=con.id_conto 
left join banca.tipo_transazione ttr
on tr.id_tipo_trans=ttr.id_tipo_transazione
group by cl.id_cliente
order by cl.id_cliente
;
/*importo transato in uscita ed in entrata su tutti i conti*/
CREATE TEMPORARY TABLE banca.importo_in_out_conti as
select cl.id_cliente,
round(sum(case when ttr.segno ='+' then tr.importo else 0 end),3) as importo_in,
round(sum(case when ttr.segno ='-' then tr.importo else 0 end),3) as importo_out
from banca.cliente cl 
left join banca.conto con
on cl.id_cliente=con.id_cliente
left join banca.transazioni tr
on tr.id_conto=con.id_conto 
left join banca.tipo_transazione ttr
on tr.id_tipo_trans=ttr.id_tipo_transazione
group by cl.id_cliente
order by cl.id_cliente
;
/*n° di conti per tipologia*/
CREATE TEMPORARY TABLE banca.n_conti_tipologia as
select cl.id_cliente,
sum(case when tc.desc_tipo_conto ='Conto Base' then 1 else 0 end) as n_conti_base,
sum(case when tc.desc_tipo_conto ='Conto Business' then 1 else 0 end) as n_conti_business,
sum(case when tc.desc_tipo_conto ='Conto Privati' then 1 else 0 end) as n_conti_privati,
sum(case when tc.desc_tipo_conto ='Conto Famiglie' then 1 else 0 end) as n_conti_famiglie
from banca.cliente cl
left join banca.conto con
on cl.id_cliente=con.id_cliente
left join banca.tipo_conto tc
on con.id_tipo_conto=tc.id_tipo_conto
group by cl.id_cliente
order by cl.id_cliente
;
/*n° di transazioni per tipologia*/
CREATE TEMPORARY TABLE banca.n_transazioni_tipologia as
select cl.id_cliente,
sum(case when ttr.desc_tipo_trans ='Stipendio' then 1 else 0 end) as n_tr_stipendio,
sum(case when ttr.desc_tipo_trans ='Pensione' then 1 else 0 end) as n_tr_pensione,
sum(case when ttr.desc_tipo_trans ='Dividendi' then 1 else 0 end) as n_tr_dividendi,
sum(case when ttr.desc_tipo_trans ='Acquisto su Amazon' then 1 else 0 end) as n_tr_amazon,
sum(case when ttr.desc_tipo_trans ='Rata mutuo' then 1 else 0 end) as n_tr_mutuo,
sum(case when ttr.desc_tipo_trans ='Hotel' then 1 else 0 end) as n_tr_hotel,
sum(case when ttr.desc_tipo_trans ='Biglietto aereo' then 1 else 0 end) as n_tr_aereo,
sum(case when ttr.desc_tipo_trans ='Supermercato' then 1 else 0 end) as n_tr_supermercato
from banca.cliente cl 
left join banca.conto con
on cl.id_cliente=con.id_cliente
left join banca.transazioni tr
on tr.id_conto=con.id_conto 
left join banca.tipo_transazione ttr
on tr.id_tipo_trans=ttr.id_tipo_transazione
group by cl.id_cliente
order by cl.id_cliente
;
/*importo transato in ingresso ed uscita per tipologia di conto*/
CREATE TEMPORARY TABLE banca.importo_tipologia_conto as
select cl.id_cliente,
sum(case when tc.desc_tipo_conto ='Conto Base' and tr.id_tipo_trans in (0,1,2) then tr.importo else 0 end) as tot_trans_base_in,
sum(case when tc.desc_tipo_conto ='Conto Base' and tr.id_tipo_trans in (3,4,5,6,7) then tr.importo else 0 end) as tot_trans_base_out,
sum(case when tc.desc_tipo_conto ='Conto Business' and tr.id_tipo_trans in (0,1,2) then tr.importo else 0 end) as tot_trans_business_in,
sum(case when tc.desc_tipo_conto ='Conto Business' and tr.id_tipo_trans in (3,4,5,6,7) then tr.importo else 0 end) as tot_trans_business_out,
sum(case when tc.desc_tipo_conto ='Conto Privati' and tr.id_tipo_trans in (0,1,2) then tr.importo else 0 end) as tot_trans_privati_in,
sum(case when tc.desc_tipo_conto ='Conto Privati' and tr.id_tipo_trans in (3,4,5,6,7) then tr.importo else 0 end) as tot_trans_privati_out,
sum(case when tc.desc_tipo_conto ='Conto Famiglie' and tr.id_tipo_trans in (0,1,2) then tr.importo else 0 end) as tot_trans_famiglie_in,
sum(case when tc.desc_tipo_conto ='Conto Famiglie' and tr.id_tipo_trans in (3,4,5,6,7) then tr.importo else 0 end) as tot_trans_famiglie_out
from banca.cliente cl 
left join banca.conto con
on cl.id_cliente=con.id_cliente
left join banca.transazioni tr
on tr.id_conto=con.id_conto 
left join banca.tipo_conto tc
on tc.id_tipo_conto=con.id_tipo_conto
group by cl.id_cliente
order by cl.id_cliente
;
/*tabella finale contenente tutte le features per singolo id_cliente*/
CREATE TEMPORARY TABLE banca.cliente_features as
select cl.id_cliente,
timestampdiff(YEAR,cl.data_nascita,current_date()) as eta,
nt.n_trans_in, nt.n_trans_out,
it.importo_in, it.importo_out,
ncc.n_conti as n_conti_tot,
nct.n_conti_base, nct.n_conti_business, nct.n_conti_privati, nct.n_conti_famiglie,
ntt.n_tr_stipendio, ntt.n_tr_pensione, ntt.n_tr_dividendi, ntt.n_tr_amazon, ntt.n_tr_mutuo, ntt.n_tr_hotel, ntt.n_tr_aereo, ntt.n_tr_supermercato,
round(itc.tot_trans_base_in,3) as tot_trans_base_in,
round(itc.tot_trans_base_out,3) as tot_trans_base_out,
round(itc.tot_trans_business_in,3) as tot_trans_business_in,
round(itc.tot_trans_business_out,3) as tot_trans_business_out,
round(itc.tot_trans_privati_in,3) as tot_trans_privati_in,
round(itc.tot_trans_privati_out,3) as tot_trans_privati_out,
round(itc.tot_trans_famiglie_in,3) as tot_trans_famiglie_in,
round(itc.tot_trans_famiglie_out,3) as tot_trans_famiglie_out
from banca.cliente cl
inner join banca.numero_transazioni_in_out_conti nt
on cl.id_cliente=nt.id_cliente
inner join banca.importo_in_out_conti it
on cl.id_cliente=it.id_cliente
inner join banca.numero_conti_cliente ncc
on cl.id_cliente = ncc.id_cliente
inner join banca.n_conti_tipologia nct
on cl.id_cliente=nct.id_cliente
inner join banca.n_transazioni_tipologia ntt
on cl.id_cliente=ntt.id_cliente
inner join banca.importo_tipologia_conto itc
on cl.id_cliente=itc.id_cliente
order by cl.id_cliente
;