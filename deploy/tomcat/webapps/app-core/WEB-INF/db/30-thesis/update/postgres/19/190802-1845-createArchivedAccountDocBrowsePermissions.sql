-- $Id$

select create_or_update_sec_permissi('SimpleUser', 'ts$ArchivedAccountDoc.browse', 10, 0)^
select create_or_update_sec_permissi('doc_secretary', 'ts$ArchivedAccountDoc.browse', 10, 1)^
select create_or_update_sec_permissi('Archivist', 'ts$ArchivedAccountDoc.browse', 10, 1)^
select create_or_update_sec_permissi('Archive access', 'ts$ArchivedAccountDoc.browse', 10, 1)^
select create_or_update_sec_permissi('Administrators', 'ts$ArchivedAccountDoc.browse', 10, 1)^