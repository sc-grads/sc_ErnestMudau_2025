begin tran
create sequence newSeq as bigint
start with 1
increment by 1
minvalue 1
--maxvalue 999999
--cycle
cache 50
create sequence secondSeq as int
select * from sys.sequences
rollback tran
