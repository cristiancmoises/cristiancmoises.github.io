title: Torsite — guia de site na rede Tor
date: 2024-02-24 12:00
lang: pt-BR
slug: -torsite
tags: archive
summary: Tutorial de 2024 sobre um serviço onion com Tor e servidor web local.
---

> Arquivo histórico de 2024. Revise a documentação atual do Tor e do servidor web antes de seguir comandos ou configurações.

## Create your website on TOR

![Ilustração do artigo sobre um site na rede Tor](/images/torsite.png)

## \[1\] Installing and Configuring Tor

Tor comes in two components: the Tor browser, and the Tor server. The Tor browser is used to access either websites on the Clearnet while maintaining your anonymity, or websites hidden on the Tor network itself. In both cases, you remain anonymous to the website. However, if you want to hide your own website, you will need the Tor server. To install those two components on your Kali Linux system, you will need to issue the following commands:

```
    apt update
    apt install tor torbrowser-launcher torsocks apache2 -y
```

## \[2\] Setting up an HTTP Server

It is time now to configure your web server. You can use any webserver you like. For the sake of this tutorial, however, we will use Apache server on Kali Linux. One important consideration you should be aware of is the fact that your web server must run on localhost only; that is, it must be listening only on 127.0.0.1. The reason this is important is that it guarantees the anonymity we are after. The default behavior of Apache server — once you start it — is to listen on all available interfaces. If you do not change that, your web server may become accessible from Clearnet in addition to the Tor network, and you do not want that. You want your website to be accessible only from Tor. To change this behavior, we will edit the file /etc/apache2/ports.conf:

```
    edit /etc/apache2/ports.conf
```

Then, change the IP address 0.0.0.0 to 127.0.0.1 for port 80 and 443 (SSL/TLS) as follows:

Then, save the file ports.conf.

Add the files of your website to the director /var/www/html. For the sake of this tutorial, we will create the file oursite.html which will include the following HTML code:

Now, we will save the file oursite.html in /var/www/html. It is time to start Apache:

```
    /etc/init.d/apache2 restart
```

We can now verify that our website is accessible on the locahost by accessing it through a normal web browser, e.g., Firefox, with the address

```
     http://localhost/torsite.html
```

## \[3\] Add the Website to Tor

Now that we have our web server listening on localhost, we can configure our Tor program to designate this server as a Tor hidden service. We do this by editing Tor configuration file /etc/tor/torrc as follows:

```
HiddenServiceDir /var/lib/tor/hidden_service/
HiddenServicePort 80 127.0.0.1:80
HiddenServiceDir /var/lib/tor/hidden_service1/
HiddenService1Port 81 127.0.0.1:81
```

We need to uncomment the line starting with HiddenServiceDir. We can add as many HiddenServiceDir as we want depending on the number of hidden services we want to host. And then, we need to uncomment the line with the HiddenServicePort directive.

## \[4\] Run Tor Service

After editing the configuration file, we need to run the actual Tor service. It will perform all necessary work to register your website in the Tor network. It will also create private and public keys for encryption and will create an onion address which people are going to use to access your website.

```
     torNov 13 17:18:09.832 [notice] Tor 0.3.4.8 (git-5da0e95e4871a0a1) running on Linux
```

Nov 13 17:18:09.851 \[notice\] Tor can’t help you if you use it wrong! Nov 13 17:18:09.947 \[notice\] Read configuration file “/etc/tor/torrc”. Nov 13 17:18:36.000 \[notice\] Bootstrapped 90%: Establishing a Tor circuit Nov 13 17:18:37.000 \[notice\] Tor has successfully opened a circuit. Looks like client functionality is working. Nov 13 17:18:37.000 \[notice\] Bootstrapped 100%: Done

Once it is done, leave the terminal window open. The Tor program will create two files under the directory /var/lib/tor/hidden_services/ and those files are:

> hostname: this file contains the Onion address of your website. private_key: this file contains the private key. It should be completely secure.

One important note here is that the private_key file must be kept confidential and secure. Tor generates for your website two keys: public and private. The public key is sent to the actual Tor network and gets stored in a directory database along with many other public keys of other websites. Users wishing to access your website use that public key to make the connection. However, your local Tor service uses the private key to decrypt the traffic.

## \[5\] Accessing the Hidden Website

If you have done everything correctly up to now, you should have your onion address in the file /var/lib/tor/hidden_service/hostname. In our example, we have the following address:

```
    cd /var/lib/tor/hidden_service/
    cat hostname
```

http://idtirp7vx6rcpxgkmm3t6ungbuq6wcsinjggfhmppuv2e2prux4gc6qd.onion

All you need to do now is to open a Tor Browser — from any system on the Internet — and type the above address in the URL bar:

```
 torbrowser-launcher &
```

Notice that we also need to enter the html file name — we created earlier — after the address. Thus, our address looks exactly like this: idtirp7vx6rcpxgkmm3t6ungbuq6wcsinjggfhmppuv2e2prux4gc6qd.onion/torsite.html
