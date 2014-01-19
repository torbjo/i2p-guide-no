<style>
  img[title=maskot] {
    float: right;
    width: 250px;
  }
</style>

</style>

![I2P sin maskot](i2p-mascot.svg "maskot")
![I2P sin logo](i2p-logo.svg "logo")


Hvordan installere I2P
======================

_Sist oppdatert: @@LAST-UPDATE@@_


## Hva er I2P ##

I2P står for «The Invisible Internet Project» og er et alternativ til
det mer kjente verktøyet for anonymisering som kalles
[TOR](https://torproject.org/).

> I2P is an anonymous network that can be used to access certain secure
> pages and services. I'm not going to fully explain how that works, you
> can check the links below. It is not an Onion Router style network
> like TOR, though it does offer many of the same advantages. In
> a nutshell I2P allows encrypted access to other users of I2P without
> sharing your IP addresses directly. Users run websites, file-sharing
> networks, and other services and through I2P. Privoxy or another proxy
> server can be run to allow non-I2P programs to interface more smoothly
> with I2P.



## Lenker ##

* [I2P sin hjemmeside](https://geti2p.net/).
* [I2P sin FAQ](https://geti2p.net/en/faq)
* [Debian-/Ubuntu-pakken](https://geti2p.net/en/download/debian)
* [Mer hjelp](https://help.ubuntu.com/community/I2P)
* [Wikipedia](http://en.wikipedia.org/wiki/I2P)



## Installere på Debian GNU/Linux eller Ubuntu® ##

_Merk: Hvis du bruker
[Debian-/Ubuntu-pakken](https://geti2p.net/en/download/debian) er alt
i denne seksjon gjort for deg så du kan hoppe rett til «Konfigurere
I2P»._


### Installer Java ###

I2P er skrevet i Java så du må først sørge for at det er installert; noe
det høyst sannsynlig er. En måte å sjekke er å kjøre følgende kommando:

    $ java -version
    java version "1.6.0_27"
    OpenJDK Runtime Environment (IcedTea6 1.12.6) (6b27-1.12.6-1~deb6u1)
    OpenJDK Client VM (build 20.0-b12, mixed mode, sharing)

Hvis du insteden ser `java: command not found` må du installere:

    $ apt-get install default-jre-headless

Du kan også eksplisitt velge hvilken java-versjon du vil bruke:

    $ apt-get install openjdk-6-jre-headless
    $ apt-get install openjdk-7-jre-headless

Oracle® sin Java-versjon er *ikke* anbefalt!


### Last ned (download) ###

Besøk [nedlastningsisden](https://geti2p.net/en/download) til I2P eller
bruk kommandolinja:

    $ wget https://i2p.googlecode.com/files/i2pinstall_0.9.9.jar

Verifiser integriteten til installasjons-fila:

    $ echo "5028910d3fb9747a6724e39f8eccb6d9ebe0530ef017102c372871badfbf6d9f i2pinstall_0.9.9.jar" | sha256sum --check


### Installér ###

Sett opp en egen bruker for I2P-tjenesten:

    $ useradd -c "I2P Service" --create-home i2p
    $ chmod o= /home/i2p

Tekstbasert installasjon:

    $ su i2p
    $ java -jar i2pinstall_0.9.9.jar -console

Når du blir spurt om å «Select target path», skriver du `/home/i2p`, for
å installere I2P i den katalogen.

Når installasjonen er ferdig, skriv `exit` eller trykk `CTRL-d` for
å logge ut, så du ikke lenger er I2P-brukeren.


### Starte I2P ###

    $ su - i2p

    $ sh i2prouter start

    Starting I2P Service...
    Waiting for I2P Service......
    running: PID:8533

Hvis alt er i orden skal du se meldingen over (PID vil variere).

Har du installert I2P på samme maskinen som du sitter på, er det bare å
åpne nettleseren og gå til adressen `http://localhost:7657`. Du finner
mer informasjon om dette i seksjonen «Konfigurere I2P».

Du kan også sjekke I2P ruteren sin status:

    $ sh i2prouter status

    I2P Service is running: PID:8533, Wrapper:STARTED, Java:STARTED

Samt stoppe den:

    $ sh i2prouter stop

    Stopping I2P Service...
    Stopped I2P Service.

TODO: init.d skript som starter I2P ved boot. (See: i2prouter script)


### Diverse ###

For å forbedre sikkerheten kan du gjøre dette:

    $ chown -R 0.0     /home/i2p
    $ chown -R i2p.i2p /home/i2p/.i2p

… slik at I2P programmet ikke har rettigheter til å endre sine egne
programfiler. Ulempen med dette er funksjonen for automatisk oppgradering
ikke vil virke lenger.

**Viktig:** Konfigurasjons-filene i `/home/i2p` er ikke i bruk! De du
skal redigere ligger i `/home/i2p/.i2p`.



## Konfigurere I2P ##

For å konfigurere I2P-ruteren brukes det innebygde webgrensesnittet,
også kalt «router console». Det når du ved å peke nettleseren din på
adressen <http://localhost:7657/>.

### Bruke I2P-konsollet fra en annen maskin ###

<!--
Hvis du har installert I2P på en annen maskin enn den du sitter foran
nå (localhost), må du ...
-->

Av sikkerhetsmessige årsaker lytter ikke I2P-ruteren på IP-adressen til
maskinen den er installert på. Så hvis du har installert I2P på maskin
A med IP 10.1.1.1, mens du nå sitter på maskin B med IP 10.1.1.123, må
du be I2P lytte på 10.1.1.1 slik at du når den fra maskin B.

Det gjør du ved å åpne konfigurasjonfilen `/home/i2p/.i2p/clients.config`.
(Husk å stoppe I2P først!). Der finner du en linje à la dette:

    clientApp.0.args=7657 ::1,127.0.0.1 ./webapps/

Her må du legge til adressene du vil den skal lytte på:

    clientApp.0.args=7657 ::1,127.0.0.1,10.1.1.1 ./webapps/

Start så I2P igjen, og gå til adressen <http://10.1.1.1:7657>.


### Hvordan bruke konsollet ###

TODO: Skriv denne seksjonen.

I mellomtiden finner du mye informasjon om dette på internett:

* <http://wiki.vuze.com/w/I2P_HowTo>



## Hvordan bruke I2P ##

TODO: write me!

* vise grunnlegende konfig.
* sette opp proxy i nettleser så kan nå \*.i2p sites
* sette opp irc-tunell og nå #normal på i2p
* (fyll inn din idé her)

<!--
$ firefox -P I2P -new-instance
-->


<!-- NOTATER -->

<!--
## Redigere konfigurasjonsfiler ##

*Merk:* Dette er for viderekommende Jeg anbefaler å bruke det grafiske
konsolet for å gjøre endringer.

Husk å stoppe I2P ruteren før du endrer disse filene!

Hvis du ikke er ufeilbar, er det lurt å ta en backup av filene du skal
endre.

    $ cd /home/i2p/.i2p
    $ for file in *.config; do cp $file $file.orig; done
-->


<!--
FILER i /home/i2p/

wrapper.config
# wrapper.java.maxmemory=128

i2prouter
# startup script. contains changeable variables

.i2p/wrapper.log
.i2p/logs/log-router-0.txt

.i2p/i2p.status
# STARTED

.i2p/clients.config
# clientApp.0.args=7657 ::1,127.0.0.1,10.1.1.1 ./webapps/
-->

<!--
Select target path [/root] 
> /home/i2p

TODO: Filene til I2P burde ikke være skrivbare. Så splitt i statiske
og /var/run/i2p.  (Men da kan man ikke oppgradere fra GUI consolet).
-->

<!--
Grafisk installasjon. (Jeg har ikke testet denne.)

    $ java -jar i2pinstall_0.9.7.jar
-->
