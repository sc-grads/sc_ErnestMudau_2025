--show search_path
--set search_path to test, public

--select * from users
--select * from public.users
set search_path to "$user", public