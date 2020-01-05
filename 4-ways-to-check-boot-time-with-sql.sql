use master;
set nocount on
 
declare @last_boot table ([os_boot] datetime, [first_session] datetime, [default_trace_start] datetime, [tempdb_created] datetime)
insert into @last_boot
select
    (select sqlserver_start_time from sys.dm_os_sys_info)
,   (select login_time from sys.dm_exec_sessions where session_id = 1)
,   (select start_time from sys.traces where is_default = 1)
,   (select create_date from sys.databases where name = 'tempdb')
 
select
    'boot_time'     		= left([os_boot], 19)
,   'days_since_boot'   	= datediff(day, [os_boot], getdate())
,   'sql__start'        	= left([tempdb_created], 19)
,   'days_since_sql_start'  = datediff(day, [os_boot], getdate())
,   'default_trace_start'   = left([default_trace_start], 19)
,   'first_session'     	= left([first_session], 19)
from
    @last_boot
