--$Id$


update wf_proc
set card_types = card_types + ',df$Doc,'
where ((card_types like '%$SimpleDoc%' or card_types like '%$Contract%') and card_types not like '%df$Doc%');