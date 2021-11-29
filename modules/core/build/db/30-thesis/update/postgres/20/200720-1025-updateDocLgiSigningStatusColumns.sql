update DF_DOC d set lgi_signing_in_status = 20
where d.package_doc_id is not null and d.lgi_signing_in_status = 10
and exists(select * from WF_CARD cc where cc.id = d.card_id and cc.is_edm_inbound = false)^

update DF_DOC d set lgi_signing_out_status = 20
where d.package_doc_id is not null and d.lgi_signing_out_status is null and d.lgi_sign_required = true
and exists(select * from WF_CARD cc where cc.id = d.card_id and cc.is_edm_inbound = false)^

update DF_DOC d set lgi_signing_out_status = 10
where d.package_doc_id is not null and d.lgi_signing_out_status is null and d.lgi_sign_required = false
and exists(select * from WF_CARD cc where cc.id = d.card_id and cc.is_edm_inbound = false)^

