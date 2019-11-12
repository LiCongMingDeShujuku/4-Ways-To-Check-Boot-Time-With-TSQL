![CLEVER DATA GIT REPO](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/0-clever-data-github.png "李聪明的数据库")


# 4种用SQL检查启动时间的方法
**发布-日期: 2017年11月10日 (评论)**

![Check Boot Time With SQL](images/image0012.png?raw=true "SQL Boot Time")

## Contents

- [中文](#中文)
- [English](#English)
- [SQL Logic](#Logic)
- [Build Quality](#Build-Quality)
- [Author](#Author)
- [License](#License) 


## 中文
很多时候我们需要检查服务器或者数据库的启动时间。参照下面的例子，有一个快速的脚本可以让你用4种有效的数据方式返回去检测包括sql服务器以及它的操作系统的启动时间。通过下面的例子我们可以清楚地看到当服务器重新启动的时候数据库是最后重启的。


## English
Often times you’ll need to check server or database server start times. In this example; there is a quick script that will show you 4 valid types of date types that can be returned to detect the start time both of sql server, and the operating system. Here you can easily see that the database service was last restarted at the time when the server was rebooted.


---
## Logic
```SQL
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

```

[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Build-Quality 
| [![Build-Status](https://ci.appveyor.com/api/projects/status/pjxh5g91jpbh7t84?svg=true)](#) | [![Coverage](https://coveralls.io/repos/github/tygerbytes/ResourceFitness/badge.svg?branch=master)](#) | [![Nuget](https://img.shields.io/nuget/v/TW.Resfit.Core.svg?style=flat-square)](#) |
|-|-|-|

### Build History

[![Build history](https://buildstats.info/appveyor/chart/tygerbytes/resourcefitness)](https://ci.appveyor.com/project/tygerbytes/resourcefitness/history)

| #### | #### | 
|------|------|
| #### | #### |
| #### | #### |


| #### | #### |
|--|--|
|<table> <tr><th>Table 1 Heading 1</th><th>Table 1 Heading 2</th></tr><tr><td>Row 1 Column 1</td><td>Row 1 Column 2</td></tr> </table>| <table> <tr><th>Table 2 Heading 1</th><th>Table 2 Heading 2</th></tr><tr><td>Row 1 Column 1</td><td>Row 1 Column 2</td></tr> </table>|

| Build Quality | Build History |
|--|--|
|<table> <tr><th>Table 1 Heading 1</th></tr><tr><td>Row 1 Column 1</td><tr><td>Row 2 Column 1</td><tr><td>Row 3 Column 1</td></tr> </table>| <table> <tr><th>Table 2 Heading 1</th></tr><tr><td>Row 1 Column 1</td></tr> </table>|

| Build Quality | Build History |
|--|--|
|<table>
<tr><td>[![Build-Status](https://ci.appveyor.com/api/projects/status/pjxh5g91jpbh7t84?svg?style=flat-square)](#)</td></tr>
<tr><td>[![Coverage](https://coveralls.io/repos/github/tygerbytes/ResourceFitness/badge.svg?style=flat-square)](#)</td></tr>
<tr><td>[![Nuget](https://img.shields.io/nuget/v/TW.Resfit.Core.svg?style=flat-square)](#)</td></tr>
</table>|<table><tr><td>[![Build history](https://buildstats.info/appveyor/chart/tygerbytes/resourcefitness)](#)</td></tr></table>|



<span style="display:block" class="note">It **works!**</span>






》》》>>>



## Author

- **李聪明的数据库 Lee's Clever Data**
- **Mike的数据库宝典 Mikes Database Collection**
- **李聪明的数据库** "Lee Songming"

[![Gist](https://img.shields.io/badge/Gist-李聪明的数据库-<COLOR>.svg)](https://gist.github.com/congmingshuju)
[![Twitter](https://img.shields.io/badge/Twitter-mike的数据库宝典-<COLOR>.svg)](https://twitter.com/mikesdatawork?lang=en)
[![Wordpress](https://img.shields.io/badge/Wordpress-mike的数据库宝典-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

---
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Lee Songming](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/1-clever-data-github.png "李聪明的数据库")

