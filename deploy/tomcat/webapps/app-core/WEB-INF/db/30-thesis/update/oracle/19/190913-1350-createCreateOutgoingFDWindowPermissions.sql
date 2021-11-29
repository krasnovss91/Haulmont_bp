-- $Id$

select create_or_update_sec_permissi('SimpleUser', 'createOutgoingFormalizedDocumentWindow', 10, 0) from dual^
select create_or_update_sec_permissi('Administrators', 'createOutgoingFormalizedDocumentWindow', 10, 1) from dual^