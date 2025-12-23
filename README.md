# Samsung Galaxy A54 Debloat Guide

Guia completo para otimizar seu Samsung Galaxy A54 removendo bloatware via ADB, sem necessidade de root.

## Resultados Reais

| Metrica | Antes | Depois | Ganho |
|---------|-------|--------|-------|
| Apps instalados | 520 | 474 | **-46 apps** |
| Bloatware Samsung | ~80 | ~35 | **-45 apps** |
| Bloatware Microsoft | 3 | 0 | **-3 apps** |
| Bloatware Facebook | 3 | 0 | **-3 apps** |
| Bixby | 6+ | 0 | **Removido** |

### Beneficios
- Menos processos em background
- Menor consumo de bateria
- Menos notificacoes indesejadas
- Mais espaco de armazenamento
- Sistema mais responsivo

---

## Pre-requisitos

### No PC (Windows)
1. Baixar [ADB Platform Tools](https://developer.android.com/studio/releases/platform-tools)
2. Extrair em `C:\adb\`
3. Adicionar ao PATH (opcional)

### No Celular
1. **Configuracoes** > **Sobre o telefone** > **Informacoes do software**
2. Tocar 7x em **Numero da versao** para ativar Modo Desenvolvedor
3. Voltar em **Configuracoes** > **Opcoes do desenvolvedor**
4. Ativar **Depuracao USB**

### Conexao
1. Conectar celular via USB
2. No celular, aceitar popup "Permitir depuracao USB?"
3. Marcar "Sempre permitir deste computador"
4. Testar conexao:
```bash
adb devices
# Deve mostrar: XXXXXXXX    device
```

---

## Comandos Essenciais

### Listar apps
```bash
# Todos os apps
adb shell pm list packages

# Apenas Samsung
adb shell pm list packages | grep samsung

# Apenas Google
adb shell pm list packages | grep google

# Apps desabilitados
adb shell pm list packages -d

# Apps de terceiros
adb shell pm list packages -3
```

### Remover app
```bash
# Remover (mantendo dados para possivel restauracao)
adb shell pm uninstall -k --user 0 <package.name>

# Remover (apagando dados)
adb shell pm uninstall --user 0 <package.name>
```

### Restaurar app removido
```bash
adb shell cmd package install-existing <package.name>
```

### Desabilitar app (mais seguro)
```bash
adb shell pm disable-user --user 0 <package.name>
```

### Reabilitar app
```bash
adb shell pm enable <package.name>
```

---

## Niveis de Debloat

### NIVEL 1 - Conservador (100% Seguro)

Apps que NUNCA afetam funcionalidade do sistema.

#### Microsoft (3 apps)
```bash
adb shell pm uninstall -k --user 0 com.linkedin.android
adb shell pm uninstall -k --user 0 com.microsoft.skydrive
adb shell pm uninstall -k --user 0 com.microsoft.appmanager
```

#### Facebook (3 apps)
```bash
adb shell pm uninstall -k --user 0 com.facebook.katana
adb shell pm uninstall -k --user 0 com.facebook.system
adb shell pm uninstall -k --user 0 com.facebook.appmanager
adb shell pm uninstall -k --user 0 com.facebook.services
```

#### Bixby (6 apps)
```bash
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.agent
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.wakeup
adb shell pm uninstall -k --user 0 com.samsung.android.bixbyvision.framework
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.service
adb shell pm uninstall -k --user 0 com.samsung.android.visionintelligence
adb shell pm uninstall -k --user 0 com.samsung.systemui.bixby2
```

#### AR/Realidade Aumentada (2 apps)
```bash
adb shell pm uninstall -k --user 0 com.samsung.android.arzone
adb shell pm uninstall -k --user 0 com.samsung.android.aremoji
adb shell pm uninstall -k --user 0 com.google.ar.core
```

---

### NIVEL 2A - Samsung Extras

Apps Samsung nao essenciais.

```bash
# Temas e personalizacao
adb shell pm uninstall -k --user 0 com.samsung.android.themestore
adb shell pm uninstall -k --user 0 com.samsung.android.wallpaper.live
adb shell pm uninstall -k --user 0 com.samsung.android.dynamiclock

# Midia
adb shell pm uninstall -k --user 0 com.samsung.android.video
adb shell pm uninstall -k --user 0 com.samsung.android.stickercenter

# Games (se nao joga)
adb shell pm uninstall -k --user 0 com.samsung.android.game.gamehome
adb shell pm uninstall -k --user 0 com.samsung.android.game.gametools

# Outros
adb shell pm uninstall -k --user 0 com.sec.android.usermanual
adb shell pm uninstall -k --user 0 com.sec.android.gallery3d
adb shell pm uninstall -k --user 0 com.sec.android.app.samsungapps
```

---

### NIVEL 2B - Samsung Conectividade

Remover se nao usa DeX, Smart View, Samsung Pay.

```bash
adb shell pm uninstall -k --user 0 com.samsung.android.smartmirroring
adb shell pm uninstall -k --user 0 com.samsung.android.mdx
adb shell pm uninstall -k --user 0 com.samsung.android.mdx.kit
adb shell pm uninstall -k --user 0 com.samsung.android.hdmapp
adb shell pm uninstall -k --user 0 com.samsung.android.inputshare
adb shell pm uninstall -k --user 0 com.samsung.android.audiomirroring
adb shell pm uninstall -k --user 0 com.samsung.android.spayfw
adb shell pm uninstall -k --user 0 com.samsung.android.coldwalletservice
adb shell pm uninstall -k --user 0 com.samsung.android.allshare.service.mediashare
```

---

### NIVEL 2C - Google Extras

Remover se usa alternativas.

```bash
adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon
adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.creator
adb shell pm uninstall -k --user 0 com.google.android.apps.nbu.files
```

---

### NIVEL 3 - Samsung Escondidos

Apps de servico que rodam em background.

```bash
# Samsung Pass (use Google Password Manager)
adb shell pm uninstall -k --user 0 com.samsung.android.samsungpass
adb shell pm uninstall -k --user 0 com.samsung.android.samsungpassautofill

# Samsung Cloud (use Google backup)
adb shell pm uninstall -k --user 0 com.samsung.android.scloud

# Bixby Routines
adb shell pm uninstall -k --user 0 com.samsung.android.app.routines

# Servicos diversos
adb shell pm uninstall -k --user 0 com.samsung.android.app.clipboardedge
adb shell pm uninstall -k --user 0 com.samsung.android.app.sharelive
adb shell pm uninstall -k --user 0 com.samsung.storyservice
adb shell pm uninstall -k --user 0 com.samsung.android.photoremasterservice
adb shell pm uninstall -k --user 0 com.samsung.android.rubin.app
adb shell pm uninstall -k --user 0 com.samsung.android.smartswitchassistant
adb shell pm uninstall -k --user 0 com.samsung.android.kidsinstaller
adb shell pm uninstall -k --user 0 com.samsung.android.lool
adb shell pm uninstall -k --user 0 com.samsung.android.app.dofviewer
adb shell pm uninstall -k --user 0 com.samsung.android.widget.pictureframe

# AppLovin (adware pre-instalado)
adb shell pm uninstall -k --user 0 com.applovin.array.apphub.samsung
```

---

## NUNCA REMOVER

Estes apps sao criticos para o sistema:

| Package | App | Motivo |
|---------|-----|--------|
| `com.samsung.android.provider.filterprovider` | Filter Provider | Crash na camera |
| `com.samsung.android.app.smartcapture` | Smart Capture | Crash na camera |
| `com.sec.android.app.launcher` | Launcher | Tela inicial |
| `com.samsung.android.messaging` | Mensagens | SMS |
| `com.samsung.android.dialer` | Telefone | Ligacoes |
| `com.sec.android.app.camera` | Camera | Fotos |
| `com.samsung.android.incallui` | In Call UI | Tela de chamada |
| `com.samsung.android.honeyboard` | Teclado | Digitacao |
| `com.samsung.android.mobileservice` | Samsung Account | Muitas dependencias |
| `com.samsung.android.themecenter` | Theme Center | Protegido pelo sistema |
| `com.samsung.android.app.cocktailbarservice` | **Edge Panel** | Barra lateral util! |

> **Aviso:** O Edge Panel (`cocktailbarservice`) pode parecer bloatware, mas e a barra lateral que muitos usuarios usam para atalhos. Se remover por engano, reinstale via [Galaxy Store](https://galaxystore.samsung.com/detail/com.samsung.android.app.cocktailbarservice) ou [APKMirror](https://www.apkmirror.com/apk/samsung-electronics-co-ltd/edge-screen/).

---

## Backup de Apps

Antes de remover, faca backup do APK:

```bash
# Descobrir caminho do APK
adb shell pm path <package.name>

# Baixar APK para o PC
adb pull <caminho_do_apk> backup/<package.name>.apk
```

---

## Restaurar Apps

### App removido com -k (dados mantidos)
```bash
adb shell cmd package install-existing <package.name>
```

### App removido completamente
Reinstalar via Play Store ou Galaxy Store.

### Factory Reset
Todos os apps pre-instalados voltam.

---

## Ferramentas Recomendadas

1. **ADB AppControl** - Interface grafica para gerenciar apps
2. **Universal Android Debloater (UAD)** - Listas pre-definidas de bloatware

---

## Modelo Testado

- **Dispositivo:** Samsung Galaxy A54 5G (SM-A546E)
- **Android:** 14
- **One UI:** 6.x
- **Data:** Dezembro 2024

---

## Referencias

- [XDA - Galaxy A54 Safe Debloat List](https://xdaforums.com/t/samsung-safe-debloat-list-for-galaxy-a54-or-more-devices.4650694/)
- [Technastic - Samsung Bloatware 2025](https://technastic.com/remove-samsung-bloatware-safe-to-remove-apps/)
- [GitHub - debloat-samsung-android](https://github.com/khlam/debloat-samsung-android)

---

## Aviso Legal

Use por sua conta e risco. Remover apps do sistema pode causar instabilidade. Sempre faca backup antes. Em caso de problemas, um factory reset restaura todos os apps originais.

---

## Contribuicoes

Encontrou um app que pode ser removido com seguranca? Abra uma Issue ou Pull Request!

---

## Licenca

MIT License - Use, modifique e compartilhe livremente.
