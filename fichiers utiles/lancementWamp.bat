echo off
NET STOP branchCache
NET START wampapache64
NET START wampmariadb64
NET START wampmysqld64
start c:\wamp64\wampmanager.exe