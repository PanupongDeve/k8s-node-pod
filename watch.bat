@echo off
:loop
cls
kubectl get deploy,rs,po
timeout /t 1 >nul
goto loop