
USE tango;

#
# Create all database tables
#

#source create_db_tables.sql

#
# Table structure for table 'access_address'
#

CREATE TABLE IF NOT EXISTS access_address (
  user varchar(255) default NULL,
  address varchar(255) default NULL,
  netmask varchar(255) default 'FF.FF.FF.FF',
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00'
) ENGINE=MyISAM;



#
# Table structure for table 'access_device'
#

CREATE TABLE IF NOT EXISTS access_device (
  user varchar(255) default NULL,
  device varchar(255) default NULL,
  rights varchar(255) default NULL,
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00'
) ENGINE=MyISAM;

#
# Table structure for table 'attribute_alias'
#

CREATE TABLE IF NOT EXISTS attribute_alias (
  alias varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  device varchar(255) NOT NULL default '',
  attribute varchar(255) NOT NULL default '',
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_attribute_alias (alias(64),name(64))
) ENGINE=MyISAM;

#
# Table structure for table 'attribute_class'
#

CREATE TABLE IF NOT EXISTS attribute_class (
  class varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_attribute_class (class(64),name(64))
) ENGINE=MyISAM;

#
# Table structure for table 'device'
#

CREATE TABLE IF NOT EXISTS device (
  name varchar(255) NOT NULL default 'nada',
  alias varchar(255) default NULL,
  domain varchar(85) NOT NULL default 'nada',
  family varchar(85) NOT NULL default 'nada',
  member varchar(85) NOT NULL default 'nada',
  exported int(11) default 0,
  ior text,
  host varchar(255) NOT NULL default 'nada',
  server varchar(255) NOT NULL default 'nada',
  pid int(11) default 0,
  class varchar(255) NOT NULL default 'nada',
  version varchar(8) NOT NULL default 'nada',
  started datetime NULL default NULL,
  stopped datetime NULL default NULL,
  comment text,
  KEY name (name(64),alias(64))
) ENGINE=MyISAM;

#
# Table structure for table 'event'
#

CREATE TABLE IF NOT EXISTS event (
  name varchar(255) default NULL,
  exported int(11) default NULL,
  ior text,
  host varchar(255) default NULL,
  server varchar(255) default NULL,
  pid int(11) default NULL,
  version varchar(8) default NULL,
  started datetime NULL default NULL,
  stopped datetime NULL default NULL,
  KEY index_name (name(64))
) ENGINE=MyISAM;

#
# Table structure for table 'property'
#

CREATE TABLE IF NOT EXISTS property (
  object varchar(255) default NULL,
  name varchar(255) default NULL,
  count int(11) default NULL,
  value text default NULL,
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_name (object(64),name(64))
) ENGINE=MyISAM;

#
# Table structure for table 'property_attribute_class'
#

CREATE TABLE IF NOT EXISTS property_attribute_class (
  class varchar(255) NOT NULL default '',
  attribute varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text default NULL,
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_property_attribute_class (class(64),attribute(64),name(64),count)
) ENGINE=MyISAM;

#
# Table structure for table 'property_attribute_device'
#

CREATE TABLE IF NOT EXISTS property_attribute_device (
  device varchar(255) NOT NULL default '',
  attribute varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text default NULL,
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_property_attribute_device (device(64),attribute(64),name(64),count)
) ENGINE=MyISAM;

#
# Table structure for table 'property_class'
#

CREATE TABLE IF NOT EXISTS property_class (
  class varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text default NULL,
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_property (class(64),name(64),count)
) ENGINE=MyISAM;

#
# Table structure for table 'property_device'
#

CREATE TABLE IF NOT EXISTS property_device (
  device varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  domain varchar(255) NOT NULL default '',
  family varchar(255) NOT NULL default '',
  member varchar(255) NOT NULL default '',  
  count int(11) NOT NULL default '0',
  value text default NULL,
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_resource (device(64),name(64),count)
) ENGINE=MyISAM;

#
# Table structure for table 'property_pipe_class'
#

CREATE TABLE IF NOT EXISTS property_pipe_class (
  class varchar(255) NOT NULL default '',
  pipe varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text default NULL,
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_property_pipe_class (class(64),pipe(64),name(64),count)
) ENGINE=MyISAM;

#
# Table structure for table 'property_pipe_device'
#

CREATE TABLE IF NOT EXISTS property_pipe_device (
  device varchar(255) NOT NULL default '',
  pipe varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text default NULL,
  updated timestamp NOT NULL,
  accessed timestamp NOT NULL default '2000-01-01 00:00:00',
  comment text,
  KEY index_property_pipe_device (device(64),pipe(64),name(64),count)
) ENGINE=MyISAM;


#
# Table structure for table 'server'
#

CREATE TABLE IF NOT EXISTS server (
  name varchar(255) NOT NULL default '',
  host varchar(255) NOT NULL default '',
  mode int(11) default '0',
  level int(11) default '0',
  KEY index_name (name(64))
) ENGINE=MyISAM;

#
# Tables for history identifiers
#

CREATE TABLE IF NOT EXISTS device_history_id (
  id bigint unsigned NOT NULL default '0'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS device_attribute_history_id (
  id bigint unsigned NOT NULL default '0'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS device_pipe_history_id (
  id bigint unsigned NOT NULL default '0'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS class_history_id (
  id bigint unsigned NOT NULL default '0'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS class_attribute_history_id (
  id bigint unsigned NOT NULL default '0'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS class_pipe_history_id (
  id bigint unsigned NOT NULL default '0'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS object_history_id (
  id bigint unsigned NOT NULL default '0'
) ENGINE=MyISAM;

#
# Tables for history
#

CREATE TABLE IF NOT EXISTS property_hist (
  id bigint unsigned NOT NULL default '0',
  date timestamp NOT NULL,
  object varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text,
  KEY index_id (id),
  KEY index_object (object),
  KEY index_name (name)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS property_device_hist (
  id bigint unsigned NOT NULL default '0',
  date timestamp NOT NULL,
  device varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text,
  KEY index_id (id),
  KEY index_device (device),
  KEY index_name (name)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS property_class_hist (
  id bigint unsigned NOT NULL default '0',
  date timestamp NOT NULL,
  class varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text,
  KEY index_id (id),
  KEY index_class (class),
  KEY index_name (name)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS property_attribute_class_hist (
  id bigint unsigned NOT NULL default '0',
  date timestamp NOT NULL,
  class varchar(255) NOT NULL default '',
  attribute varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text,
  KEY index_id (id),
  KEY index_class (class),
  KEY index_attribute (attribute),
  KEY index_name (name)  
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS property_attribute_device_hist (
  id bigint unsigned NOT NULL default '0',
  date timestamp NOT NULL,
  device varchar(255) NOT NULL default '',
  attribute varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text,
  KEY index_id (id),
  KEY index_device (device),
  KEY index_attribute (attribute),
  KEY index_name (name)  
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS property_pipe_class_hist (
  id bigint unsigned NOT NULL default '0',
  date timestamp NOT NULL,
  class varchar(255) NOT NULL default '',
  pipe varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text,
  KEY index_id (id),
  KEY index_class (class),
  KEY index_pipe (pipe),
  KEY index_name (name)  
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS property_pipe_device_hist (
  id bigint unsigned NOT NULL default '0',
  date timestamp NOT NULL,
  device varchar(255) NOT NULL default '',
  pipe varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  count int(11) NOT NULL default '0',
  value text,
  KEY index_id (id),
  KEY index_device (device),
  KEY index_pipe (pipe),
  KEY index_name (name)  
) ENGINE=MyISAM;

#
# Load the stored procedures
#

#source stored_proc.sql
DROP PROCEDURE IF EXISTS tango.ds_start;
DROP PROCEDURE IF EXISTS tango.import_event;
DROP PROCEDURE IF EXISTS tango.import_device;
DROP PROCEDURE IF EXISTS tango.class_prop;
DROP PROCEDURE IF EXISTS tango.dev_prop;
DROP PROCEDURE IF EXISTS tango.class_att_prop;
DROP PROCEDURE IF EXISTS tango.get_dev_list;
DROP PROCEDURE IF EXISTS tango.dev_att_prop;
DROP PROCEDURE IF EXISTS tango.obj_prop;
DROP PROCEDURE IF EXISTS tango.class_pipe_prop;
DROP PROCEDURE IF EXISTS tango.dev_pipe_prop;
DROP PROCEDURE IF EXISTS tango.proc_release_nb;

DROP PROCEDURE IF EXISTS tango.init_history_ids;
DROP PROCEDURE IF EXISTS tango.init_tac_tables;

#########################################################
#														#
#			MAIN PROCEDURE								#
#														#
# Procedure input parameters:							#
# 1 - Device server name (executable/inst_name)			#
# 2 - Host name											#
# Procedure output parameters:							#
# 1 - A huge string with several elements and a			#
#	  separator set to 0 (binary 0)						#
#														#
#########################################################


#
# If you change something in these procedures, do not forget
# to also change the COMMENT part of the ds_start procedure
# CREATE command
#

DELIMITER |
CREATE PROCEDURE tango.ds_start 
(IN ds_name VARCHAR(255),
 IN recev_host VARCHAR(255),
 OUT res_str MEDIUMBLOB) READS SQL DATA COMMENT 'release 1.13'
proc: BEGIN

	DECLARE notifd_event_name VARCHAR(255) DEFAULT 'notifd/factory/';
	DECLARE adm_dev_name VARCHAR(255) DEFAULT 'dserver/';
	DECLARE done, dev_nb,class_nb INT DEFAULT 0;
	DECLARE tmp_class,d_name,rel_str VARCHAR(255);
	DECLARE dev_list BLOB;
	DECLARE start,pos,ds_pipe INT DEFAULT 1;
	DECLARE class_nb_pos INT;
	DECLARE ca_dev_name VARCHAR(255);
	DECLARE host VARCHAR(255);

	DECLARE cur_class_list CURSOR FOR 
	SELECT DISTINCT class 
	FROM tango.device 
	WHERE server = ds_name;
		
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET adm_dev_name = CONCAT(adm_dev_name,ds_name);

#
# Do we have Tango release added in host name?
#

	SET pos = LOCATE('%%',recev_host);
	IF pos != 0 THEN
		SET rel_str = SUBSTRING(recev_host,pos+2);
		SET host = SUBSTRING(recev_host,1,pos-1);
		IF rel_str >= 9 THEN
			SET ds_pipe = 1;
		ELSE
			SET ds_pipe = 0;
		END IF;
	ELSE
		SET ds_pipe = 0;
		SET host = recev_host;
	END IF;

#
# get procedure release number
#

	IF ds_pipe = 1 THEN
		CALL tango.proc_release_nb(res_str);
	END IF;

#
# import admin device
#

	CALL tango.import_device(adm_dev_name,res_str);

	IF LOCATE('Not Found',res_str) != 0 OR LOCATE('MySQL Error',res_str) != 0 THEN
		LEAVE proc;
	END IF;
	
#
# import event factory for notification service running on that host
#

	SET notifd_event_name = CONCAT(notifd_event_name,host);
	CALL tango.import_event(notifd_event_name,res_str);
	SET done = 0;
	
	IF LOCATE('MySQL Error',res_str) != 0 THEN
		SET res_str = 'MySQL ERROR during import_event procedure for event factory';
		LEAVE proc;
	END IF;

#
# import event channel for this server
#
	
	CALL tango.import_event(adm_dev_name,res_str);
	SET done = 0;
	
	IF LOCATE('MySQL Error',res_str) != 0 THEN
		SET res_str = 'MySQL ERROR during import_event procedure for DS event channel';
		LEAVE proc;
	END IF;
	
#
# Get all class properties for DServer class
#

	CALL tango.class_prop('DServer',res_str);
	SET done = 0;
	
	IF LOCATE('MySQL Error',res_str) != 0 THEN
		SET res_str = 'MySQL ERROR while getting DServer class property(ies)';
		LEAVE proc;
	END IF;

#
# Get all class properties for Default class
#

	CALL tango.class_prop('Default',res_str);
	SET done = 0;
	
	IF LOCATE('MySQL Error',res_str) != 0 THEN
		SET res_str = 'MySQL ERROR while getting Default class property(ies)';
		LEAVE proc;
	END IF;
	
#
# Get all device properties for admin device
#

	CALL tango.dev_prop(adm_dev_name,res_str);
	SET done = 0;
	
#
#
#
	SET res_str = CONCAT_WS(CHAR(0),res_str,ds_name);
	SET class_nb_pos = LENGTH(res_str);		
#
# A loop for each class embedded within the server
#
	
	OPEN cur_class_list;

	REPEAT
		FETCH cur_class_list INTO tmp_class;
		IF NOT done THEN

			IF tmp_class != 'dserver' THEN
				SET class_nb = class_nb + 1;
						
				CALL tango.class_prop(tmp_class,res_str);
				
				IF LOCATE('MySQL Error',res_str) != 0 THEN
					SET res_str = 'MySQL ERROR while getting DS class(es) property(ies)';
					CLOSE cur_class_list;
					LEAVE proc;
				END IF;
				
				CALL tango.class_att_prop(tmp_class,res_str);
				
				IF LOCATE('MySQL Error',res_str) != 0 THEN
					SET res_str = 'MySQL ERROR while getting DS class(es) attribute(s) property(ies)';
					CLOSE cur_class_list;
					LEAVE proc;
				END IF;

				IF ds_pipe = 1 THEN
					CALL tango.class_pipe_prop(tmp_class,res_str);
				
					IF LOCATE('MySQL Error',res_str) != 0 THEN
						SET res_str = 'MySQL ERROR while getting DS class(es) pipe(s) property(ies)';
						CLOSE cur_class_list;
						LEAVE proc;
					END IF;
				END IF;
				
				CALL tango.get_dev_list(tmp_class,ds_name,res_str,dev_list,dev_nb);
				
				IF LOCATE('MySQL Error',res_str) != 0 THEN
					SET res_str = 'MySQL ERROR while getting DS class(es) device list';
					CLOSE cur_class_list;
					LEAVE proc;
				END IF;

#
# A loop for each device in the class
#
				
				WHILE dev_nb > 0 DO
					SET pos = LOCATE(CHAR(0),dev_list,start);
					IF pos = 0 THEN
						SET d_name = SUBSTRING(dev_list,start);
					ELSE
						SET d_name = SUBSTRING(dev_list,start,pos-start);
						SET start = pos + 1;
					END IF;
#					select dev_list,d_name,pos,start;
										
					CALL tango.dev_prop(d_name,res_str);
					
					IF LOCATE('MySQL Error',res_str) != 0 THEN
						SET res_str = 'MySQL ERROR while getting device property(ies)';
						CLOSE cur_class_list;
						LEAVE proc;
					END IF;
					
					CALL tango.dev_att_prop(d_name,res_str);
					
					IF LOCATE('MySQL Error',res_str) != 0 THEN
						SET res_str = 'MySQL ERROR while getting device attribute property(ies)';
						CLOSE cur_class_list;
						LEAVE proc;
					END IF;

					IF ds_pipe = 1 THEN
						CALL tango.dev_pipe_prop(d_name,res_str);
					
						IF LOCATE('MySQL Error',res_str) != 0 THEN
							SET res_str = 'MySQL ERROR while getting device pipe property(ies)';
							CLOSE cur_class_list;
							LEAVE proc;
						END IF;
					END IF;
					
					SET dev_nb = dev_nb - 1;
				END WHILE;
				SET start = 1;
			END IF;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_class_list;
	
	SET res_str = INSERT(res_str,class_nb_pos+1,1,CONCAT_WS(CONCAT(class_nb),CHAR(0),CHAR(0)));
	
#
# Get service(s) property
#

	SET ca_dev_name = 'Empty';
	
	CALL tango.obj_prop('CtrlSystem',ca_dev_name,res_str);
	
	IF ca_dev_name != 'Empty' THEN

#
# import control access service device
#

		CALL tango.import_device(ca_dev_name,res_str);

	END IF;
	
	
END proc|

#########################################################
#														#
#		IMPORT EVENT PROCEDURE							#
#														#
#########################################################


CREATE PROCEDURE tango.import_event 
(IN ev_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_ior TEXT;
	DECLARE tmp_version VARCHAR(8);
	DECLARE tmp_host VARCHAR(255);
	DECLARE tmp_ev_name VARCHAR(255);
	DECLARE tmp_ev_name_canon VARCHAR(255);
	DECLARE tmp_exp, tmp_pid, dot INT;
	DECLARE not_found INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET not_found = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET tmp_ev_name = ev_name;
	SET tmp_ev_name = REPLACE(tmp_ev_name,'_','\_');
		
	SELECT exported,ior,version,pid,host
	INTO tmp_exp,tmp_ior,tmp_version,tmp_pid,tmp_host
	FROM tango.event
	WHERE name = tmp_ev_name;
	
	IF not_found = 1 THEN
		SET dot = LOCATE('.',tmp_ev_name);
		IF dot != 0 THEN
			SET tmp_ev_name_canon = SUBSTRING(tmp_ev_name,1,dot - 1);
			SET not_found = 0;

			SELECT exported,ior,version,pid,host
			INTO tmp_exp,tmp_ior,tmp_version,tmp_pid,tmp_host
			FROM tango.event
			WHERE name = tmp_ev_name_canon;
	
			IF not_found = 1 THEN
				SET res_str = CONCAT_WS(CHAR(0),res_str,ev_name,'Not Found');
			ELSE
				SET res_str = CONCAT_WS(CHAR(0),res_str,ev_name,tmp_ior,tmp_version,tmp_host,CONCAT(tmp_exp),CONCAT(tmp_pid));
			END IF;
		ELSE
			SET res_str = CONCAT_WS(CHAR(0),res_str,ev_name,'Not Found');
		END IF;
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,ev_name,tmp_ior,tmp_version,tmp_host,CONCAT(tmp_exp),CONCAT(tmp_pid));
	END IF;
END |


#########################################################
#														#
#		IMPORT DEVICE PROCEDURE							#
#														#
#########################################################


CREATE PROCEDURE tango.import_device 
(IN dev_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
imp_proc: BEGIN
	DECLARE tmp_ior TEXT;
	DECLARE tmp_version VARCHAR(8);
	DECLARE tmp_host,tmp_server,tmp_class VARCHAR(255);
	DECLARE tmp_exp, tmp_pid INT;
	DECLARE not_found INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET not_found = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');
		
	SELECT exported,ior,version,pid,server,host,class
	INTO tmp_exp,tmp_ior,tmp_version,tmp_pid,tmp_server,tmp_host,tmp_class
	FROM tango.device 
	WHERE name = dev_name;
	
	SET res_str = CONCAT_WS(CHAR(0),res_str,dev_name);
	
	IF not_found = 1 THEN
		SET res_str = CONCAT_WS(CHAR(0),res_str,'Not Found');
		LEAVE imp_proc;
	END IF;
	
	IF tmp_ior IS NULL THEN
		SET res_str = CONCAT_WS(CHAR(0),res_str,'');
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_ior);
	END IF;

	IF tmp_version IS NULL THEN
		SET res_str = CONCAT_WS(CHAR(0),res_str,'');
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_version);
	END IF;
			
	SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_server,tmp_host,CONCAT(tmp_exp));
	
	IF tmp_pid IS NULL THEN
		SET res_str = CONCAT_WS(CHAR(0),res_str,'');
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,CONCAT(tmp_pid));
	END IF;

	SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_class);	
END imp_proc |


#########################################################
#														#
#		GET CLASS PROPERTIES PROCEDURE					#
#														#
#########################################################


CREATE PROCEDURE tango.class_prop 
(IN class_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_name VARCHAR(255);
	DECLARE tmp_value TEXT;
	DECLARE tmp_count INT;
	DECLARE done,prop_nb,prop_elt_nb INT DEFAULT 0;
	DECLARE class_name_pos,prop_name_pos INT;
	
	DECLARE cur_class CURSOR FOR 
	SELECT name,count,value 
	FROM tango.property_class 
	WHERE class = class_name ORDER BY name,count;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET res_str = CONCAT_WS(CHAR(0),res_str,class_name);
	SET class_name_pos = LENGTH(res_str);
	OPEN cur_class;

	REPEAT
		FETCH cur_class INTO tmp_name,tmp_count,tmp_value;
		IF NOT done THEN
		
			IF tmp_count = 1 THEN
				IF prop_elt_nb != 0 THEN
					SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
				END IF;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_name);
				SET prop_name_pos = LENGTH(res_str);
				SET prop_nb = prop_nb + 1;
				SET prop_elt_nb = 0;
			END IF;
						
			SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_value);
			SET prop_elt_nb = prop_elt_nb + 1;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_class;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
	END IF;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,class_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,0);
	END IF;
END |


#########################################################
#														#
#		GET DEVICE PROPERTIES PROCEDURE					#
#														#
#########################################################


CREATE PROCEDURE tango.dev_prop 
(IN dev_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_name VARCHAR(255);
	DECLARE tmp_value TEXT;
	DECLARE tmp_count INT;
	DECLARE done,prop_nb,prop_elt_nb INT DEFAULT 0;
	DECLARE dev_name_pos,prop_name_pos INT;
	
	DECLARE cur_dev CURSOR FOR 
	SELECT name,count,value 
	FROM tango.property_device 
	WHERE device = dev_name ORDER BY name,count;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');
	
	SET res_str = CONCAT_WS(CHAR(0),res_str,dev_name);
	SET dev_name_pos = LENGTH(res_str);

	OPEN cur_dev;

	REPEAT
		FETCH cur_dev INTO tmp_name,tmp_count,tmp_value;
		IF NOT done THEN
		
			IF tmp_count = 1 THEN
				IF prop_elt_nb != 0 THEN
					SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
				END IF;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_name);
				SET prop_name_pos = LENGTH(res_str);
				SET prop_nb = prop_nb + 1;
				SET prop_elt_nb = 0;
			END IF;
						
			SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_value);
			SET prop_elt_nb = prop_elt_nb + 1;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_dev;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
	END IF;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,dev_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,0);
	END IF;
END |


#########################################################
#														#
#		GET CLASS ATTRIBUTE PROPERTIES PROCEDURE		#
#														#
#########################################################


CREATE PROCEDURE tango.class_att_prop 
(IN class_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_name,tmp_attribute VARCHAR(255);
	DECLARE known_att VARCHAR(255) DEFAULT '';
	DECLARE tmp_value TEXT;
	DECLARE tmp_count INT;
	DECLARE done,prop_nb,att_nb,prop_elt_nb INT DEFAULT 0;
	DECLARE class_name_pos,att_name_pos,prop_name_pos INT;
	
	DECLARE cur_class_att_prop CURSOR FOR 
	SELECT attribute,name,count,value 
	FROM tango.property_attribute_class 
	WHERE class = class_name ORDER BY attribute,name,count;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET res_str = CONCAT_WS(CHAR(0),res_str,class_name);
	SET class_name_pos = LENGTH(res_str);

	OPEN cur_class_att_prop;

	REPEAT
		FETCH cur_class_att_prop INTO tmp_attribute,tmp_name,tmp_count,tmp_value;
		IF NOT done THEN
		
			IF tmp_attribute != known_att THEN
				IF prop_nb != 0 THEN
					SET res_str = INSERT(res_str,att_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
					IF prop_nb < 10 THEN
						SET prop_name_pos = prop_name_pos + 2;
					ELSEIF prop_nb < 100 THEN
						SET prop_name_pos = prop_name_pos + 3;
					ELSE
						SET prop_name_pos = prop_name_pos + 4;
					END IF;
				END IF;
				SET known_att = tmp_attribute;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_attribute);
				SET att_name_pos = LENGTH(res_str);
				SET att_nb = att_nb + 1;
				SET prop_nb = 0;
			END IF;
			
			IF tmp_count = 1 THEN
				IF prop_elt_nb != 0 THEN
					SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
					IF prop_nb = 0 THEN
						IF prop_elt_nb < 10 THEN
							SET att_name_pos = att_name_pos + 2;
						ELSEIF prop_elt_nb < 100 THEN
							SET att_name_pos = att_name_pos + 3;
						ELSE
							SET att_name_pos = att_name_pos + 4;
						END IF;
					END IF;
				END IF;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_name);
				SET prop_name_pos = LENGTH(res_str);
				SET prop_nb = prop_nb + 1;
				SET prop_elt_nb = 0;
			END IF;
						
			SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_value);
			SET prop_elt_nb = prop_elt_nb + 1;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_class_att_prop;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,att_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
		IF prop_nb < 10 THEN
			SET prop_name_pos = prop_name_pos + 2;
		ELSEIF prop_nb < 100 THEN
			SET prop_name_pos = prop_name_pos + 3;
		ELSE
			SET prop_name_pos = prop_name_pos + 4;
		END IF;	
		IF prop_elt_nb != 0 THEN
			SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
		END IF;
	END IF;

	IF att_nb != 0 THEN	
		SET res_str = INSERT(res_str,class_name_pos+1,1,CONCAT_WS(CONCAT(att_nb),CHAR(0),CHAR(0)));
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,0);
	END IF;
END |


#########################################################
#														#
#		GET DEVICE ATTRIBUTE PROPERTIES PROCEDURE		#
#														#
#########################################################


CREATE PROCEDURE tango.dev_att_prop 
(IN dev_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_name,tmp_attribute VARCHAR(255);
	DECLARE known_att VARCHAR(255) DEFAULT '';
	DECLARE tmp_value TEXT;
	DECLARE tmp_count INT;
	DECLARE done,prop_nb,att_nb,prop_elt_nb INT DEFAULT 0;
	DECLARE dev_name_pos,att_name_pos,prop_name_pos INT;
	
	DECLARE cur_dev_att_prop CURSOR FOR 
	SELECT attribute,name,count,value 
	FROM tango.property_attribute_device 
	WHERE device = dev_name ORDER BY attribute,name,count;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET res_str = CONCAT_WS(CHAR(0),res_str,dev_name);
	SET dev_name_pos = LENGTH(res_str);

	OPEN cur_dev_att_prop;

	REPEAT
		FETCH cur_dev_att_prop INTO tmp_attribute,tmp_name,tmp_count,tmp_value;
		IF NOT done THEN
		
			IF tmp_attribute != known_att THEN
				IF prop_nb != 0 THEN
					SET res_str = INSERT(res_str,att_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
					IF prop_nb < 10 THEN
						SET prop_name_pos = prop_name_pos + 2;
					ELSEIF prop_nb < 100 THEN
						SET prop_name_pos = prop_name_pos + 3;
					ELSE
						SET prop_name_pos = prop_name_pos + 4;
					END IF;
				END IF;
				SET known_att = tmp_attribute;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_attribute);
				SET att_name_pos = LENGTH(res_str);
				SET att_nb = att_nb + 1;
				SET prop_nb = 0;
			END IF;
			
			IF tmp_count = 1 THEN
				IF prop_elt_nb != 0 THEN
					SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
					IF prop_nb = 0 THEN
						IF prop_elt_nb < 10 THEN
							SET att_name_pos = att_name_pos + 2;
						ELSEIF prop_elt_nb < 100 THEN
							SET att_name_pos = att_name_pos + 3;
						ELSE
							SET att_name_pos = att_name_pos + 4;
						END IF;
					END IF;
				END IF;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_name);
				SET prop_name_pos = LENGTH(res_str);
				SET prop_nb = prop_nb + 1;
				SET prop_elt_nb = 0;
			END IF;
						
			SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_value);
			SET prop_elt_nb = prop_elt_nb + 1;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_dev_att_prop;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,att_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
		IF prop_nb < 10 THEN
			SET prop_name_pos = prop_name_pos + 2;
		ELSEIF prop_nb < 100 THEN
			SET prop_name_pos = prop_name_pos + 3;
		ELSE
			SET prop_name_pos = prop_name_pos + 4;
		END IF;	
		IF prop_elt_nb != 0 THEN
			SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
		END IF;
	END IF;

	IF att_nb != 0 THEN	
		SET res_str = INSERT(res_str,dev_name_pos+1,1,CONCAT_WS(CONCAT(att_nb),CHAR(0),CHAR(0)));
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,0);
	END IF;
END |


#########################################################
#														#
#		GET DEVICE LIST PROCEDURE						#
#														#
#########################################################


CREATE PROCEDURE tango.get_dev_list 
(IN class_name VARCHAR(255), IN serv VARCHAR(255),
 INOUT res_str MEDIUMBLOB, OUT d_list TEXT, OUT d_num INT) READS SQL DATA
BEGIN
	DECLARE tmp_name VARCHAR(255);
	DECLARE done INT DEFAULT 0;
	DECLARE nb_dev INT DEFAULT 0;
	DECLARE class_name_pos INT;
		
	DECLARE cur_dev_list CURSOR FOR 
	SELECT DISTINCT name 
	FROM tango.device 
	WHERE class = class_name AND server = serv ORDER BY name;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET res_str = CONCAT_WS(CHAR(0),res_str,class_name);
	SET class_name_pos = LENGTH(res_str);
	
	OPEN cur_dev_list;

	REPEAT
		FETCH cur_dev_list INTO tmp_name;
		IF NOT done THEN						
			SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_name);
			IF nb_dev = 0 THEN
				SET d_list = CONCAT_WS("",d_list,tmp_name);
			ELSE
				SET d_list = CONCAT_WS(CHAR(0),d_list,tmp_name);
			END IF;
			SET nb_dev = nb_dev + 1;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_dev_list;
	
	SET res_str = INSERT(res_str,class_name_pos+1,1,CONCAT_WS(CONCAT(nb_dev),CHAR(0),CHAR(0)));
	SET d_num = nb_dev;
END |


#########################################################
#														#
#		GET CLASS PIPE PROPERTIES PROCEDURE				#
#														#
#########################################################


CREATE PROCEDURE tango.class_pipe_prop 
(IN class_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_name,tmp_pipe VARCHAR(255);
	DECLARE known_pipe VARCHAR(255) DEFAULT '';
	DECLARE tmp_value TEXT;
	DECLARE tmp_count INT;
	DECLARE done,prop_nb,pipe_nb,prop_elt_nb INT DEFAULT 0;
	DECLARE class_name_pos,pipe_name_pos,prop_name_pos INT;
	
	DECLARE cur_class_pipe_prop CURSOR FOR 
	SELECT pipe,name,count,value 
	FROM tango.property_pipe_class 
	WHERE class = class_name ORDER BY pipe,name,count;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET res_str = CONCAT_WS(CHAR(0),res_str,class_name);
	SET class_name_pos = LENGTH(res_str);

	OPEN cur_class_pipe_prop;

	REPEAT
		FETCH cur_class_pipe_prop INTO tmp_pipe,tmp_name,tmp_count,tmp_value;
		IF NOT done THEN
		
			IF tmp_pipe != known_pipe THEN
				IF prop_nb != 0 THEN
					SET res_str = INSERT(res_str,pipe_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
					IF prop_nb < 10 THEN
						SET prop_name_pos = prop_name_pos + 2;
					ELSEIF prop_nb < 100 THEN
						SET prop_name_pos = prop_name_pos + 3;
					ELSE
						SET prop_name_pos = prop_name_pos + 4;
					END IF;
				END IF;
				SET known_pipe = tmp_pipe;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_pipe);
				SET pipe_name_pos = LENGTH(res_str);
				SET pipe_nb = pipe_nb + 1;
				SET prop_nb = 0;
			END IF;
			
			IF tmp_count = 1 THEN
				IF prop_elt_nb != 0 THEN
					SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
					IF prop_nb = 0 THEN
						IF prop_elt_nb < 10 THEN
							SET pipe_name_pos = pipe_name_pos + 2;
						ELSEIF prop_elt_nb < 100 THEN
							SET pipe_name_pos = pipe_name_pos + 3;
						ELSE
							SET pipe_name_pos = pipe_name_pos + 4;
						END IF;
					END IF;
				END IF;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_name);
				SET prop_name_pos = LENGTH(res_str);
				SET prop_nb = prop_nb + 1;
				SET prop_elt_nb = 0;
			END IF;
						
			SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_value);
			SET prop_elt_nb = prop_elt_nb + 1;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_class_pipe_prop;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,pipe_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
		IF prop_nb < 10 THEN
			SET prop_name_pos = prop_name_pos + 2;
		ELSEIF prop_nb < 100 THEN
			SET prop_name_pos = prop_name_pos + 3;
		ELSE
			SET prop_name_pos = prop_name_pos + 4;
		END IF;	
		IF prop_elt_nb != 0 THEN
			SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
		END IF;
	END IF;

	IF pipe_nb != 0 THEN	
		SET res_str = INSERT(res_str,class_name_pos+1,1,CONCAT_WS(CONCAT(pipe_nb),CHAR(0),CHAR(0)));
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,0);
	END IF;
END |


#########################################################
#														#
#		GET DEVICE PIPE PROPERTIES PROCEDURE			#
#														#
#########################################################


CREATE PROCEDURE tango.dev_pipe_prop 
(IN dev_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_name,tmp_pipe VARCHAR(255);
	DECLARE known_pipe VARCHAR(255) DEFAULT '';
	DECLARE tmp_value TEXT;
	DECLARE tmp_count INT;
	DECLARE done,prop_nb,pipe_nb,prop_elt_nb INT DEFAULT 0;
	DECLARE dev_name_pos,pipe_name_pos,prop_name_pos INT;
	
	DECLARE cur_dev_pipe_prop CURSOR FOR 
	SELECT pipe,name,count,value 
	FROM tango.property_pipe_device 
	WHERE device = dev_name ORDER BY pipe,name,count;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET res_str = CONCAT_WS(CHAR(0),res_str,dev_name);
	SET dev_name_pos = LENGTH(res_str);

	OPEN cur_dev_pipe_prop;

	REPEAT
		FETCH cur_dev_pipe_prop INTO tmp_pipe,tmp_name,tmp_count,tmp_value;
		IF NOT done THEN
		
			IF tmp_pipe != known_pipe THEN
				IF prop_nb != 0 THEN
					SET res_str = INSERT(res_str,pipe_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
					IF prop_nb < 10 THEN
						SET prop_name_pos = prop_name_pos + 2;
					ELSEIF prop_nb < 100 THEN
						SET prop_name_pos = prop_name_pos + 3;
					ELSE
						SET prop_name_pos = prop_name_pos + 4;
					END IF;
				END IF;
				SET known_pipe = tmp_pipe;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_pipe);
				SET pipe_name_pos = LENGTH(res_str);
				SET pipe_nb = pipe_nb + 1;
				SET prop_nb = 0;
			END IF;
			
			IF tmp_count = 1 THEN
				IF prop_elt_nb != 0 THEN
					SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
					IF prop_nb = 0 THEN
						IF prop_elt_nb < 10 THEN
							SET pipe_name_pos = pipe_name_pos + 2;
						ELSEIF prop_elt_nb < 100 THEN
							SET pipe_name_pos = pipe_name_pos + 3;
						ELSE
							SET pipe_name_pos = pipe_name_pos + 4;
						END IF;
					END IF;
				END IF;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_name);
				SET prop_name_pos = LENGTH(res_str);
				SET prop_nb = prop_nb + 1;
				SET prop_elt_nb = 0;
			END IF;
						
			SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_value);
			SET prop_elt_nb = prop_elt_nb + 1;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_dev_pipe_prop;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,pipe_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
		IF prop_nb < 10 THEN
			SET prop_name_pos = prop_name_pos + 2;
		ELSEIF prop_nb < 100 THEN
			SET prop_name_pos = prop_name_pos + 3;
		ELSE
			SET prop_name_pos = prop_name_pos + 4;
		END IF;	
		IF prop_elt_nb != 0 THEN
			SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
		END IF;
	END IF;

	IF pipe_nb != 0 THEN	
		SET res_str = INSERT(res_str,dev_name_pos+1,1,CONCAT_WS(CONCAT(pipe_nb),CHAR(0),CHAR(0)));
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,0);
	END IF;
END |

#########################################################
#														#
#		STORED PROCEDURE RELEASE PROCEDURE				#
#														#
#########################################################


CREATE PROCEDURE tango.proc_release_nb 
(INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_rel VARCHAR(255);
	DECLARE not_found INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET not_found = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');
	
	SELECT ROUTINE_COMMENT
	INTO tmp_rel
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'ds_start' AND ROUTINE_SCHEMA = 'tango';
	
	IF not_found = 1 THEN
		SET res_str = CONCAT_WS(CHAR(0),res_str,'Not Found');
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_rel);
	END IF;
END |


#########################################################
#														#
#		GET OBJECT PROPERTIES PROCEDURE					#
#														#
#########################################################


CREATE PROCEDURE tango.obj_prop 
(IN obj_name VARCHAR(255),OUT serv_dev_name VARCHAR(255),
 INOUT res_str MEDIUMBLOB) READS SQL DATA
BEGIN
	DECLARE tmp_name VARCHAR(255);
	DECLARE tmp_value TEXT;
	DECLARE tmp_count INT;
	DECLARE done,prop_nb,prop_elt_nb INT DEFAULT 0;
	DECLARE dev_name_pos,prop_name_pos INT;
	DECLARE serv_defined INT DEFAULT 0;
	
	DECLARE cur_dev CURSOR FOR 
	SELECT name,count,value 
	FROM tango.property 
	WHERE object = obj_name ORDER BY name,count;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET res_str = CONCAT_WS(CHAR(0),res_str,'MySQL Error');

	SET res_str = CONCAT_WS(CHAR(0),res_str,obj_name);
	SET dev_name_pos = LENGTH(res_str);
	
	OPEN cur_dev;

	REPEAT
		FETCH cur_dev INTO tmp_name,tmp_count,tmp_value;
		IF NOT done THEN
		
			IF tmp_count = 1 THEN
				IF prop_elt_nb != 0 THEN
					SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
				END IF;
				SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_name);
				SET prop_name_pos = LENGTH(res_str);
				SET prop_nb = prop_nb + 1;
				SET prop_elt_nb = 0;
				IF tmp_name = 'Services' THEN
					SET serv_defined = 1;
				ELSE
					SET serv_defined = 0;
				END IF;
			END IF;

			IF serv_defined = 1 THEN
				IF LOCATE('AccessControl/tango:',tmp_value) != 0 THEN
					SET serv_dev_name = SUBSTRING(tmp_value,21);
						IF LOCATE('tango://',serv_dev_name) != 0 THEN
							SET serv_dev_name = SUBSTRING_INDEX(serv_dev_name,'/',-3);
						END IF;
				END IF;
			END IF;
								
			SET res_str = CONCAT_WS(CHAR(0),res_str,tmp_value);
			SET prop_elt_nb = prop_elt_nb + 1;
		END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur_dev;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,prop_name_pos+1,1,CONCAT_WS(CONCAT(prop_elt_nb),CHAR(0),CHAR(0)));
	END IF;

	IF prop_nb != 0 THEN	
		SET res_str = INSERT(res_str,dev_name_pos+1,1,CONCAT_WS(CONCAT(prop_nb),CHAR(0),CHAR(0)));
	ELSE
		SET res_str = CONCAT_WS(CHAR(0),res_str,0);
	END IF;
END |

###############################################################
#														      #
#		INIT HISTORY ID IN HISTORY TABLES IF NOT ALREADY DONE #
#														      #
###############################################################

CREATE PROCEDURE tango.init_history_ids()
BEGIN
	DECLARE ret_id INT DEFAULT -1;

    SELECT COUNT(*) INTO ret_id FROM tango.object_history_id;
    IF ret_id = 0 THEN
        INSERT INTO tango.object_history_id VALUES (0);
    END IF;


    SET ret_id = -1;
    SELECT COUNT(*) INTO ret_id FROM tango.class_attribute_history_id;
    IF ret_id = 0 THEN
        INSERT INTO tango.class_attribute_history_id VALUES (0);
    END IF;


    SET ret_id = -1;
    SELECT COUNT(*) INTO ret_id FROM tango.class_history_id;
    IF ret_id = 0 THEN
        INSERT INTO tango.class_history_id VALUES (0);
    END IF;


    SET ret_id = -1;
    SELECT COUNT(*) INTO ret_id FROM tango.class_pipe_history_id;
    IF ret_id = 0 THEN
        INSERT INTO tango.class_pipe_history_id VALUES (0);
    END IF;


    SET ret_id = -1;
    SELECT COUNT(*) INTO ret_id FROM tango.device_attribute_history_id;
    IF ret_id = 0 THEN
        INSERT INTO tango.device_attribute_history_id VALUES (0);
    END IF;


    SET ret_id = -1;
    SELECT COUNT(*) INTO ret_id FROM tango.device_history_id;
    IF ret_id = 0 THEN
        INSERT INTO tango.device_history_id VALUES (0);
    END IF;


    SET ret_id = -1;
    SELECT COUNT(*) INTO ret_id FROM tango.device_pipe_history_id;
    IF ret_id = 0 THEN
        INSERT INTO tango.device_pipe_history_id VALUES (0);
    END IF;
END |

###############################################################
#														      #
#		INIT TAC RELATED TABLES IF NOT ALREADY DONE           #
#														      #
###############################################################

CREATE PROCEDURE tango.init_tac_tables()
BEGIN
	DECLARE ret_id INT DEFAULT -1;

    SELECT COUNT(*) INTO ret_id FROM tango.access_address WHERE user='*' and address='*.*.*.*';
    IF ret_id = 0 THEN
        INSERT INTO tango.access_address VALUES ('*','*.*.*.*','FF.FF.FF.FF',20060824131221,20060824131221);
    END IF;


    SET ret_id = -1;
    SELECT COUNT(*) INTO ret_id FROM tango.access_device WHERE user='*' and device='*/*/*';
    IF ret_id = 0 THEN
        INSERT INTO tango.access_device VALUES ('*','*/*/*','write',20060824131221,20060824131221);
    END IF;
END |


DELIMITER ;

#
# Init the history identifiers
#

CALL init_history_ids();

#
# Create entry for database device server in device table
#

DELETE FROM device WHERE server='DataBaseds/2';

INSERT INTO device VALUES ('sys/database/2',NULL,'sys','database','2',0,'nada','nada','DataBaseds/2',0,'DataBase','nada',NULL,NULL,'nada');
INSERT INTO device VALUES ('dserver/DataBaseds/2',NULL,'dserver','DataBaseds','2',0,'nada','nada','DataBaseds/2',0,'DServer','nada',NULL,NULL,'nada');

#
# Create entry for TangoRestServer device server in device table
#

DELETE FROM device WHERE server='TangoRestServer/rest';

INSERT INTO device VALUES ('sys/rest/0',NULL,'sys','rest','0',0,'nada','nada','TangoRestServer/rest',0,'TangoRestServer','nada',NULL,NULL,'nada');
INSERT INTO device VALUES ('dserver/TangoRestServer/rest',NULL,'dserver','TangoRestServer','rest',0,'nada','nada','TangoRestServer/rest',0,'DServer','nada',NULL,NULL,'nada');


#
# Create entry for test device server in device table
#

DELETE FROM device WHERE server='TangoTest/test';

INSERT INTO device VALUES ('sys/tg_test/1',NULL,'sys','tg_test','1',0,'nada','nada','TangoTest/test',0,'TangoTest','nada',NULL,NULL,'nada');
INSERT INTO device VALUES ('dserver/TangoTest/test',NULL,'dserver','TangoTest','test',0,'nada','nada','TangoTest/test',0,'DServer','nada',NULL,NULL,'nada');

#
# Create entry for Tango Control Access in device table
#

DELETE FROM device WHERE server='TangoAccessControl/1';
DELETE FROM server WHERE name='tangoaccesscontrol/1';

INSERT INTO device VALUES ('sys/access_control/1',NULL,'sys','access_control','1',0,'nada','nada','TangoAccessControl/1',0,'TangoAccessControl','nada',NULL,NULL,'nada');
INSERT INTO device VALUES ('dserver/TangoAccessControl/1',NULL,'dserver','TangoAccessControl','1',0,'nada','nada','TangoAccessControl/1',0,'DServer','nada',NULL,NULL,'nada');
INSERT INTO server VALUES ('tangoaccesscontrol/1','',0,0);

#
# Create default user access
#

CALL tango.init_tac_tables();

#
# Create entries in the property_class tables for controlled access service
#

DELETE FROM property_class WHERE class='Database';

INSERT INTO property_class VALUES('Database','AllowedAccessCmd',1,'DbGetServerInfo',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',2,'DbGetServerNameList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',3,'DbGetInstanceNameList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',4,'DbGetDeviceServerClassList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',5,'DbGetDeviceList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',6,'DbGetDeviceDomainList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',7,'DbGetDeviceFamilyList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',8,'DbGetDeviceMemberList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',9,'DbGetClassList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',10,'DbGetDeviceAliasList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',11,'DbGetObjectList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',12,'DbGetPropertyList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',13,'DbGetProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',14,'DbGetClassPropertyList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',15,'DbGetClassProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',16,'DbGetDevicePropertyList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',17,'DbGetDeviceProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',18,'DbGetClassAttributeList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',19,'DbGetDeviceAttributeProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',20,'DbGetDeviceAttributeProperty2',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',21,'DbGetLoggingLevel',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',22,'DbGetAliasDevice',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',23,'DbGetClassForDevice',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',24,'DbGetClassInheritanceForDevice',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',25,'DbGetDataForServerCache',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',26,'DbInfo',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',27,'DbGetClassAttributeProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',28,'DbGetClassAttributeProperty2',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',29,'DbMysqlSelect',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',30,'DbGetDeviceInfo',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',31,'DbGetDeviceWideList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',32,'DbImportEvent',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',33,'DbGetDeviceAlias',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',34,'DbGetCSDbServerList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',35,'DbGetDeviceClassList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',36,'DbGetDeviceExportedList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',37,'DbGetHostServerList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',38,'DbGetAttributeAlias2',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',39,'DbGetAliasAttribute',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',40,'DbGetClassPipeProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',41,'DbGetDevicePipeProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',42,'DbGetClassPipeList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',43,'DbGetDevicePipeList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',44,'DbGetAttributeAliasList',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('Database','AllowedAccessCmd',45,'DbGetForwardedAttributeListForDevice',NOW(),NOW(),NULL);

#
#
#

DELETE FROM property_class WHERE class='DServer';

INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',1,'QueryClass',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',2,'QueryDevice',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',3,'EventSubscriptionChange',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',4,'DevPollStatus',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',5,'GetLoggingLevel',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',6,'GetLoggingTarget',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',7,'QueryWizardDevProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',8,'QueryWizardClassProperty',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',9,'QuerySubDevice',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',10,'ZMQEventSubscriptionChange',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES('DServer','AllowedAccessCmd',11,'EventConfirmSubscription',NOW(),NOW(),NULL);

#
#
#

DELETE FROM property_class WHERE class='Starter';

INSERT INTO property_class VALUES ('Starter','AllowedAccessCmd',1,'DevReadLog',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('Starter','AllowedAccessCmd',2,'DevStart',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('Starter','AllowedAccessCmd',3,'DevGetRunningServers',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('Starter','AllowedAccessCmd',4,'DevGetStopServers',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('Starter','AllowedAccessCmd',5,'UpdateServersInfo',NOW(),NOW(),NULL);

#
#
#

DELETE FROM property_class WHERE class='TangoAccessControl';

INSERT INTO property_class VALUES ('TangoAccessControl','AllowedAccessCmd',1,'GetUsers',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('TangoAccessControl','AllowedAccessCmd',2,'GetAddressByUser',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('TangoAccessControl','AllowedAccessCmd',3,'GetDeviceByUser',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('TangoAccessControl','AllowedAccessCmd',4,'GetAccess',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('TangoAccessControl','AllowedAccessCmd',5,'GetAllowedCommands',NOW(),NOW(),NULL);
INSERT INTO property_class VALUES ('TangoAccessControl','AllowedAccessCmd',6,'GetAllowedCommandClassList',NOW(),NOW(),NULL);

INSERT INTO property_device VALUES ('dserver/TangoTest/test','polling_threads_pool_conf','','','',1,'sys/tg_test/1',NOW(),NOW(),NULL);
INSERT INTO property_device VALUES ('sys/tg_test/1','polled_attr','','','',1,'double_scalar',NOW(),NOW(),NULL);
INSERT INTO property_device VALUES ('sys/tg_test/1','polled_attr','','','',2,'5000',NOW(),NOW(),NULL);
INSERT INTO property_attribute_device VALUES ('sys/tg_test/1','double_scalar','abs_change',1,'-1',NOW(),NOW(),NULL);
INSERT INTO property_attribute_device VALUES ('sys/tg_test/1','double_scalar','abs_change',2,'1',NOW(),NOW(),NULL);
