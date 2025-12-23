# Relatorio de Otimizacao de Bateria - Samsung A54

**Data:** 2024-12-22
**Dispositivo:** Samsung Galaxy A54 5G (RQCW304A5TY)

---

## STATUS DA BATERIA

| Metrica | Valor |
|---------|-------|
| Nivel atual | 80% |
| Capacidade | 4905 mAh |
| Saude (BSOH) | 99% |
| Data primeiro uso | 12/09/2023 |
| Protecao 80% | Ativa |

---

## PROBLEMAS IDENTIFICADOS

### 1. Apps com Alto Consumo de Bateria

| App | UID | Problema |
|-----|-----|----------|
| WhatsApp | u0a331 | 6.4% CPU, 275MB RAM - TOP CONSUMER |
| Life360 | u0a566 | BYPASS DOZE - GPS constante |
| Google Maps | u0a239 | BYPASS DOZE - Localizacao ativa |
| Instagram | u0a358 | Sincronizacao em background |
| Google Play Services | u0a220 | Servicos persistentes |

### 2. Configuracoes Problematicas (ANTES)

- Nearby scanning: **ATIVO** (drena bateria)
- BLE scan always: **ATIVO** (Bluetooth constante)
- Screen timeout: **10 minutos** (muito longo)
- WiFi power save: **DESLIGADO**
- 84+ apps na whitelist do Doze

### 3. Apps na Doze Whitelist (Ignoram economia de energia)

- `com.life360.android.safetymapd` - Life360 (PROBLEMA CRITICO)
- `com.google.android.apps.maps` - Google Maps
- `com.samsung.android.sidegesturepad` - Samsung Gestures
- `com.sec.android.app.launcher` - Launcher

---

## OTIMIZACOES APLICADAS

### Sistema

```bash
# Nearby scanning desabilitado
adb shell settings put system nearby_scanning_permission_allowed 0
adb shell settings put system nearby_scanning_enabled 0

# BLE scan always desabilitado
adb shell settings put global ble_scan_always_enabled 0

# WiFi power save ativado
adb shell settings put global wifi_power_save 1

# Screen timeout reduzido para 2 minutos
adb shell settings put system screen_off_timeout 120000

# Adaptive sleep ativado
adb shell settings put secure adaptive_sleep 1

# Automatic power save ativado
adb shell settings put global automatic_power_save_mode 1

# Gestos que acordam desabilitados
adb shell settings put secure doze_quick_pickup_gesture 0
adb shell settings put system lift_to_wake 0

# Samsung enhanced CPU desabilitado
adb shell settings put global sem_enhanced_cpu_responsiveness 0

# Intelligent sleep mode ativado
adb shell settings put system intelligent_sleep_mode 1
```

### Apps Restritos em Background

```bash
# Redes Sociais
adb shell cmd appops set com.instagram.android RUN_ANY_IN_BACKGROUND ignore
adb shell cmd appops set com.instagram.android WAKE_LOCK ignore
adb shell cmd appops set com.twitter.android RUN_ANY_IN_BACKGROUND ignore
adb shell cmd appops set com.twitter.android WAKE_LOCK ignore

# Streaming
adb shell cmd appops set com.netflix.mediaclient RUN_ANY_IN_BACKGROUND ignore
adb shell cmd appops set com.shazam.android RUN_ANY_IN_BACKGROUND ignore

# Delivery
adb shell cmd appops set br.com.brainweb.ifood RUN_ANY_IN_BACKGROUND ignore

# Crypto
adb shell cmd appops set com.gateio.gateio RUN_ANY_IN_BACKGROUND ignore
adb shell cmd appops set com.coinex.trade.play RUN_ANY_IN_BACKGROUND ignore
adb shell cmd appops set com.kubi.kucoin RUN_ANY_IN_BACKGROUND ignore
adb shell cmd appops set com.coinbase.android RUN_ANY_IN_BACKGROUND ignore

# Outros
adb shell cmd appops set com.opera.max.oem RUN_ANY_IN_BACKGROUND ignore
```

---

## CONFIGURACOES VERIFICADAS (DEPOIS)

| Configuracao | Valor |
|--------------|-------|
| nearby_scanning_enabled | 0 (desabilitado) |
| ble_scan_always_enabled | 0 (desabilitado) |
| screen_off_timeout | 120000 (2 minutos) |
| wifi_power_save | 1 (ativado) |
| automatic_power_save_mode | 1 (ativado) |
| Instagram background | IGNORE (bloqueado) |

---

## ACOES MANUAIS RECOMENDADAS

### 1. Life360 (MAIOR PROBLEMA)

O Life360 esta na whitelist do Doze e consome ~10% extra de bateria por dia.

**Opcoes:**
- Se nao precisa de rastreamento constante, va em:
  - Configuracoes > Apps > Life360 > Bateria > Restrito
- Ou desinstale se nao usa

### 2. Deep Sleeping Apps

Va em: **Configuracoes > Bateria > Limites de uso em segundo plano**

Adicione estes apps em "Apps em suspensao profunda":
- Instagram
- Twitter/X
- Netflix
- iFood
- Apps de crypto
- Shazam

### 3. Limpar Cache de Particao

Apos atualizacoes do sistema:
1. Desligue o celular
2. Pressione Volume Cima + Volume Baixo + Power
3. Selecione "Wipe cache partition"

### 4. Brilho Automatico

Ative o brilho automatico em vez de manual:
- Configuracoes > Tela > Brilho automatico

### 5. Sincronizacao

Desative sincronizacao automatica de apps que nao precisa:
- Configuracoes > Contas > Desativar sincronizacao de apps desnecessarios

---

## ECONOMIA ESPERADA

Com todas as otimizacoes aplicadas, voce deve notar:

| Metrica | Economia Esperada |
|---------|-------------------|
| Bateria em standby | +15-25% |
| Tempo de tela | +1-2 horas |
| Temperatura | Reducao de 2-5C |

---

## COMANDOS PARA REVERTER

Se algo parar de funcionar, reverta com:

```bash
# Restaurar scanning
adb shell settings put system nearby_scanning_enabled 1
adb shell settings put global ble_scan_always_enabled 1

# Restaurar Instagram
adb shell cmd appops set com.instagram.android RUN_ANY_IN_BACKGROUND allow

# Restaurar screen timeout (10 min)
adb shell settings put system screen_off_timeout 600000
```

---

## FONTES

- [ADB Commands for Battery Optimization - Technastic](https://technastic.com/adb-battery-optimization-commands/)
- [Android Battery Optimization - GitHub](https://github.com/Aatricks/Android-battery-optimization)
- [Optimize for Doze - Android Developers](https://developer.android.com/training/monitoring-device-state/doze-standby)
- [Life360 Battery Usage - Life360 Support](https://support.life360.com/hc/en-us/articles/23053716563223-Life360-and-Battery-Usage)
- [Samsung Galaxy A54 Battery Drain Fix - PhoneWiz](https://phoneswiz.com/fix-samsung-galaxy-a54-battery-drain/)

---

**Otimizacao realizada em:** 22/12/2024 23:40
