-- $Id$

select create_or_update_sec_permissi('SimpleUser', 'createOutgoingFormalizedDocumentWindow', 10, 0)^
select create_or_update_sec_permissi('Administrators', 'createOutgoingFormalizedDocumentWindow', 10, 1)^