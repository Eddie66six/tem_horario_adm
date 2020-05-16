# para acessar api localhost de um emulador
- adicionar o caminho do adb na variavel ambiente
- adb reverse tcp:[porta que a api esta rodando] tcp:[porta que a api esta rodando]
- ex: adb reverse tcp:55859 tcp:55859