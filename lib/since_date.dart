library since_date;


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:since_date/master.dart';

class SinceDate extends StatelessWidget {

  getSince(local){
     int currentLocal = local == "ar" ? 0 : 1; 
     return MasterData.locals[currentLocal][local]!["since"].toString() + " ";
  }

  getNamed(local,named){
         int currentLocal = local == "ar" ? 0 : 1; 
     return MasterData.locals[currentLocal][local]![named].toString();
  }

   timeSince (DateTime value,String local) {
        int currentLocal = local == "ar" ? 0 : 1; 

    if (value != null) {
        var data = value;

        DateTime currentDate = new DateTime.now();
        int seconds = currentDate.difference(data).inSeconds;
        int years = (seconds / 31536000).floor();
        int months = (seconds / 2592000).floor();
        int days = (seconds / 86400).floor();
        int hours = (seconds / 3600).floor();
        int minutes = (seconds / 60).floor();

        if (years > 0) {
            if (years == 1) return getSince(local) + getNamed(local, "year1");
            if (years == 2) return getSince(local) + getNamed(local, "year2");;
            if (years >= 3 && years <= 10) return getSince(local) + " ${years} " + getNamed(local, "year3");
            else return getSince(local) + " ${years} " + getNamed(local, "year3");
        } else if (months > 0) {
            if (months == 1) return getSince(local) + getNamed(local, "month1");
            if (months == 2) return getSince(local) + getNamed(local, "month2");
            if (months >= 3 && months <= 10) return getSince(local) + " ${months} " + getNamed(local, "month3");
            else return getSince(local) + " ${months} " + getNamed(local, "month4");
        } else if (days > 0) {
            if (days == 1) return getSince(local) + getNamed(local, "day1");
            if (days == 2) return getSince(local) + getNamed(local, "day2");
            if (days >= 3 && days <= 10) return getSince(local) + " ${days} " + getNamed(local, "day3");
            else return getSince(local) + " ${days} " + getNamed(local, "day4");
        } else if (hours > 0) {
            if (hours == 1) return getSince(local) + getNamed(local, "hour1");
            if (hours == 2) return getSince(local) + getNamed(local, "hour2");
            if (hours >= 3 && hours <= 10) return getSince(local) + " ${hours} " + getNamed(local, "hour3");
            else return getSince(local) + " ${hours} " + getNamed(local, "hour1");
        } else if (minutes > 0) {
            if (minutes == 1) return getSince(local) + getNamed(local, "minute1");
            if (minutes == 2) return getSince(local) + getNamed(local, "minute2");
            if (minutes >= 3 && minutes <= 10) return getSince(local) + " ${minutes} " + getNamed(local, "minute3");
            else return  getSince(local) + " ${minutes} " + getNamed(local, "minute1");
        } else if (seconds > 0) {
            if (seconds == 1) return getSince(local) + getNamed(local, "second1");
            if (seconds == 2) return getSince(local) + getNamed(local, "second2");
            if (seconds >= 3 && seconds <= 10) return getSince(local) + " ${seconds} " + getNamed(local, "second3");
            else return getSince(local) + " ${seconds} " + getNamed(local, "second1");
        } else {
            return "الآن";
        }
    }
}
  
  final DateTime date;
  final String local;
  TextStyle? textStyle;
  SinceDate(this.date,{Key? key, this.textStyle,this.local = "en"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(timeSince(date,local));
  }
}