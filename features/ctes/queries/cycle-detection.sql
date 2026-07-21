with recursive search_graph(id, link, data, depth) as (
    select g.id, g.link, g.data, 1
    from   graph g
  union all
    select g.id, g.link, g.data, sg.depth + 1
    from   graph g, search_graph sg
    where  g.id = sg.link
) cycle id set is_cycle using path
select * from search_graph;