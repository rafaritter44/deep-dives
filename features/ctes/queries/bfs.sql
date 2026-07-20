with recursive search_tree(id, link, data) as (
    select t.id, t.link, t.data
    from   tree t
  union all
    select t.id, t.link, t.data
    from   tree t, search_tree st
    where  t.id = st.link
) search breadth first by id set ordercol
select * from search_tree order by ordercol;