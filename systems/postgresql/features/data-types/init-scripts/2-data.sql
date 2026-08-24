insert into test (d, t, ttz, ts, tstz, i)
values ('1999-01-08', '04:05:06.789', '04:05:06.789-8', '1999-01-08 04:05:06.789', '1999-01-08 04:05:06.789-8', '2 years 15 months 100 weeks 99 hours 123456789 milliseconds'),
       (null, null, null, null, null, '2 years 15 months 100 weeks 99 hours 123456789 milliseconds ago')
       (epoch, null, null, epoch, epoch, null),
       (infinity, null, null, infinity, infinity, infinity),
       (-infinity, null, null, -infinity, -infinity, -infinity),
       (now, now, now, now, now, null),
       (today, null, null, today, today, null),
       (tomorrow, null, null, tomorrow, tomorrow, null),
       (yesterday, null, null, yesterday, yesterday, null),
       (null, allballs, allballs, null, null, null),
       (current_date, current_time, current_time, current_timestamp, current_timestamp, null),
       (null, localtime, localtime, localtimestamp, localtimestamp, null);
