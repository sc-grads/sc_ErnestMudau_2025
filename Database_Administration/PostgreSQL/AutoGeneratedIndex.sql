select relname,relkind
from pg_class
where relkind = 'i'