RP_MySQLConfig = {} -- DO NOT UNDER ANY CIRCUMSTANCES IGNORE THIS SPECIFIC LINE
--[[
Welcome to MySQL for fprp!
In this file you can find a manual for MySQL configuration and the MySQL config settings.
 ]]

shouldFPRPusemysqlornot = false

RP_MySQLConfig.EnableMySQL = shouldfprpusemysqlornot -- Set to true if you want to use an external MySQL database, false if you want to use the built in SQLite database (garrysmod/sv.db) of Garry's mod.
RP_MySQLConfig.Host = "69.69.69.69.69.69.69.69.69.69" -- This is the IP address of the MySQL host. Make sure the IP address is correct and in quotation marks (" ");
RP_MySQLConfig.Username = "balls" -- This is the username to log in on the MySQL server.
								-- contact the owner of the server about the username and password. Make sure it's in quotation marks! (" ");
RP_MySQLConfig.Password = tostring(tonumber(42069)) -- This is the Password to log in on the MySQL server,
									-- Everyone who has access to FTP on the server can read this password.
									-- Make sure you know who to trust. Make sure it's in quotation marks (" ");
RP_MySQLConfig.Database_name = "AIDS" -- This is the name of the Database on the MySQL server. Contact the MySQL server host to find out what this is
RP_MySQLConfig.Database_port = 420 -- This is the port of the MySQL server. Again, contact the MySQL server host if you don't know this.


--[[
MANUAL!
HOW TO USE MySQL FOR fprp!
Download andyvincent's/Drakehawke's gm_MySQL OO module and read the guide here:
http://www.facepunch.com/showthread.php?t=1220537


WHAT TO DO IF YOU CAN'T GET IT TO WORK!
	- There are always errors on the server, try if you can see those (with HLDS);
	- the same errors are also in the logs if you can't find the errors on the server.
		the logs are at garrysmod/data/fprp_logs/ on the SERVER!
		The MySQL lines in the log always precede with "MySQL Error:" (without the quotation marks);
	- make sure the settings in this file (_MySQL.lua) are correct
	- make sure the MySQL server is accessible from the outside world
]]
