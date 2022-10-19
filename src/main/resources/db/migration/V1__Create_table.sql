





CREATE DATABASE  IF NOT EXISTS `wvp`;

use wvp;


CREATE TABLE IF NOT EXISTS device
(
    id           int auto_increment primary key,
    deviceId      varchar(50)  not null,
    name          varchar(255) null,
    manufacturer  varchar(255) null,
    model         varchar(255) null,
    firmware      varchar(255) null,
    transport     varchar(50)  null,
    streamMode    varchar(50)  null,
    online        varchar(50)  null,
    registerTime  varchar(50)  null,
    keepaliveTime varchar(50)  null,
    ip            varchar(50)  not null,
    createTime    varchar(50)  not null,
    updateTime    varchar(50)  not null,
    port          int          not null,
    expires       int          not null,
    subscribeCycleForCatalog       int  not null,
    hostAddress   varchar(50)  not null,
    charset       varchar(50)  not null,
    subscribeCycleForMobilePosition int null,
    mobilePositionSubmissionInterval int default '5',
    subscribeCycleForAlarm int null,
    ssrcCheck int default '0',
    geoCoordSys varchar(50)  not null,
    treeType varchar(50)  not null,
    CONSTRAINT device_deviceId_uindex UNIQUE(deviceId)
    );


create table if not exists device_alarm
(
    id                int auto_increment primary key,
    deviceId          varchar(50) not null,
    channelId         varchar(50) not null,
    alarmPriority     varchar(50) not null,
    alarmMethod       varchar(50),
    alarmTime         varchar(50) not null,
    alarmDescription  varchar(255),
    longitude         double null,
    latitude          double null,
    alarmType         varchar(50),
    createTime        varchar(50)
    );


create table if not exists device_channel
(
    id          int auto_increment primary key,
    channelId   varchar(50)  not null,
    name        varchar(255) null,
    manufacture varchar(50)  null,
    model       varchar(50)  null,
    owner       varchar(50)  null,
    civilCode   varchar(50)  null,
    block       varchar(50)  null,
    address     varchar(50)  null,
    parentId    varchar(50)  null,
    safetyWay   int          null,
    registerWay int          null,
    certNum     varchar(50)  null,
    certifiable int          null,
    errCode     int          null,
    endTime     varchar(50)  null,
    secrecy     varchar(50)  null,
    ipAddress   varchar(50)  null,
    port        int          null,
    password    varchar(255) null,
    PTZType     int          null,
    status      int          null,
    longitude   double       null,
    latitude    double       null,
    streamId    varchar(50)  null,
    deviceId    varchar(50)  not null,
    parental    varchar(50)  null,
    hasAudio    bit          null,
    createTime  varchar(50)  not null,
    updateTime  varchar(50)  not null,
    subCount    int   default '0',
    longitudeGcj02 double null,
    latitudeGcj02 double null,
    longitudeWgs84 double null,
    latitudeWgs84 double null,
    businessGroupId varchar(50) null,
    gpsTime varchar(50) null,
    CONSTRAINT device_channel_id_uindex UNIQUE(id),
    CONSTRAINT device_channel_pk UNIQUE(channelId, deviceId)
    );





create table if not exists device_mobile_position
(
    id             int auto_increment primary key,
    deviceId       varchar(50)  not null,
    channelId      varchar(50)  not null,
    deviceName     varchar(255) null,
    time           varchar(50)  not null,
    longitude      double       not null,
    latitude       double       not null,
    altitude       double       null,
    speed          double       null,
    direction      double       null,
    reportSource   varchar(50)  null,
    longitudeGcj02 double null,
    latitudeGcj02  double null,
    longitudeWgs84 double null,
    latitudeWgs84  double null,
    createTime varchar(50) null
    );



create table if not exists gb_stream
(
    gbStreamId    int auto_increment primary key,
    app           varchar(255) not null,
    stream        varchar(255) not null,
    gbId          varchar(50)  not null,
    name          varchar(255) null,
    longitude     double       null,
    latitude      double       null,
    streamType    varchar(50)  null,
    mediaServerId varchar(50)  null,
    createTime    varchar(50)  null,
    CONSTRAINT app UNIQUE(app, stream),
    CONSTRAINT gbId UNIQUE(gbId)
    );


create table if not exists log
(
    id         int auto_increment primary key,
    name        varchar(50)     not null,
    type        varchar(50)     not null,
    uri         varchar(200)    not null,
    address     varchar(50)     not null,
    result      varchar(50)     not null,
    timing      bigint          not null,
    username    varchar(50)     not null,
    createTime  varchar(50)     not null
    );



create table if not exists media_server
(
    id     varchar(255) not null primary key UNIQUE,
    ip                      varchar(50)  not null,
    hookIp                  varchar(50)  not null,
    sdpIp                   varchar(50)  not null,
    streamIp                varchar(50)  not null,
    httpPort                int          not null,
    httpSSlPort             int          not null,
    rtmpPort                int          not null,
    rtmpSSlPort             int          not null,
    rtpProxyPort            int          not null,
    rtspPort                int          not null,
    rtspSSLPort             int          not null,
    autoConfig              int          not null,
    secret                  varchar(50)  not null,
    streamNoneReaderDelayMS int          not null,
    rtpEnable               int          not null,
    rtpPortRange            varchar(50)  not null,
    sendRtpPortRange        varchar(50)  not null,
    recordAssistPort        int          not null,
    defaultServer           int          not null,
    createTime              varchar(50)  not null,
    updateTime              varchar(50)  not null,
    hookAliveInterval	    int          not null,
    constraint media_server_i unique (ip, httpPort)
    );




create table if not exists parent_platform
(
    id             int auto_increment primary key,
    enable         int          null,
    name           varchar(255) null,
    serverGBId     varchar(50)  not null,
    serverGBDomain varchar(50)  null,
    serverIP       varchar(50)  null,
    serverPort     int          null,
    deviceGBId     varchar(50)  not null,
    deviceIp       varchar(50)  null,
    devicePort     varchar(50)  null,
    username       varchar(255) null,
    password       varchar(50)  null,
    expires        varchar(50)  null,
    keepTimeout    varchar(50)  null,
    transport      varchar(50)  null,
    characterSet   varchar(50)  null,
    catalogId      varchar(50)  not null,
    ptz            int          null,
    rtcp           int          null,
    status         bit          null,
    startOfflinePush  int  default '0',
    administrativeDivision varchar(50) not null,
    catalogGroup    int  default '1',
    createTime      varchar(50) null,
    updateTime      varchar(50) null,
    treeType        varchar(50) not null,
    constraint parent_platform_id_uindex unique (id),
    constraint parent_platform_pk unique (serverGBId)
    );


create table if not exists platform_catalog
(
    id          varchar(50)  not null primary key,
    platformId  varchar(50) not null,
    name        varchar(255) not null,
    parentId    varchar(50)  null,
    civilCode   varchar(50) null,
    businessGroupId varchar(50) null
    );


create table if not exists platform_gb_channel
(
    id             int auto_increment primary key,
    platformId         varchar(50) not null,
    catalogId          varchar(50) not null,
    deviceChannelId int not null
    );


create table if not exists platform_gb_stream
(
    id             int auto_increment primary key,
    platformId     varchar(50)  not null,
    catalogId      varchar(50) not null,
    gbStreamId     int not null,
    constraint platform_gb_stream_pk unique (platformId, catalogId, gbStreamId)
    );


create table if not exists stream_proxy
(
    id             int auto_increment primary key,
    type           varchar(50)  not null,
    app            varchar(255) not null,
    stream         varchar(255) not null,
    url            varchar(255) null,
    src_url        varchar(255) null,
    dst_url        varchar(255) null,
    timeout_ms     int          null,
    ffmpeg_cmd_key varchar(255) null,
    rtp_type       varchar(50)  null,
    mediaServerId  varchar(50)  null,
    enable_hls     bit          null,
    enable_mp4     bit          null,
    enable         bit          not null,
    status         bit          not null,
    enable_remove_none_reader    bit          not null,
    createTime     varchar(50)  not null,
    name           varchar(255) null,
    updateTime     varchar(50)  null,
    constraint stream_proxy_pk unique (app, stream)
    );


create table if not exists stream_push
(
    id             int auto_increment primary key,
    app              varchar(255) not null,
    stream           varchar(255) not null,
    totalReaderCount varchar(50)  null,
    originType       int          null,
    originTypeStr    varchar(50)  null,
    createTime       varchar(50)  null,
    aliveSecond      int          null,
    mediaServerId    varchar(50)  null,
    serverId        varchar(50)   not null,
    pushTime    varchar(50)  null,
    status      int null,
    updateTime  varchar(50)  null,
    pushIng     int null,
    self        int null,
    constraint  stream_push_pk unique (app, stream)
    );



create table if not exists user
(
    id         int auto_increment primary key,
    username    varchar(255) not null,
    password    varchar(255) not null,
    roleId      int          not null,
    createTime varchar(50)  not null,
    updateTime varchar(50)  not null,
    pushKey    varchar(50)  null,
    constraint  user_username_uindex unique (username)
    );

/* password: admin */
INSERT INTO user VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1,'2021-04-13 14:14:57','2021-04-13 14:14:57','3e80d1762a324d5b0ff636e0bd16f1e3');



create table if not exists user_role
(
    id         int auto_increment primary key,
    name       varchar(50)  not null,
    authority       varchar(50)  not null,
    createTime       varchar(50)  not null,
    updateTime       varchar(50)  not null
    );


insert into user_role values (1, 'admin', '0', '2021-04-13 14:14:57', '2021-04-13 14:14:57');