Return-Path: <SRS0=55Bk=XA=gmx.net=Juergen.Thieme@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C3EC369A2
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Apr 2025 16:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF66DC4CEE2; Mon, 14 Apr 2025 16:37:54 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBCE4C4CEEA
	for <linux-firmware@kernel.org>; Mon, 14 Apr 2025 16:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBCE4C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744648671; x=1745253471; i=juergen.thieme@gmx.net;
	bh=e4XU77DUtftPOtHRdVyvCXLC/42z8xy/DZBP1ofyEK4=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:References:To:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V1d4QXLvRV9HSXvQksXVqNiHCeuZoxZiXTyFzH5ZA6zMZwra5WIgdI+aj+1YAQd4
	 xbj/nFfeIbP2x6gNoY7gabQuEFu+Zw+2tGTYu1sxOL/KIr9RxPJuY05+whYAzsTZa
	 +oo+1ZvTsaNQTm0lDbrdywR+3dMDWJ+OLSIM3idRwuhks7YqP28la85nqxfdJZRMI
	 JuwYtDhu9Ij3yw1d4VB3Pds79dko/BvpJi6bXFmRJH7WXWJKeFtdrg0kbmFSkeFab
	 UaiiuV5HtWUiMcYe4pnkm8O0ZQrsMt9s+tXgVfs/1iT2JxP10pLkdnDlg6ybuqY/k
	 z21OqO6ZvGF7JDi2Ug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.5.130] ([188.193.74.146]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1tYUSg3wAu-00Xl4a for
 <linux-firmware@kernel.org>; Mon, 14 Apr 2025 18:37:50 +0200
Content-Type: multipart/alternative;
 boundary="------------s1UbW85OTqGqDndC01cV410i"
Message-ID: <eebd3fe8-3891-44d7-8ae2-286b9cbb7332@gmx.net>
Date: Mon, 14 Apr 2025 18:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: I need some useful help
Content-Language: de-DE
References: <f433a4d3-37b2-48d9-8e3b-cf289dcfed06@gmx.net>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: =?UTF-8?Q?J=C3=BCrgen_Thieme?= <Juergen.Thieme@gmx.net>
In-Reply-To: <f433a4d3-37b2-48d9-8e3b-cf289dcfed06@gmx.net>
X-Forwarded-Message-Id: <f433a4d3-37b2-48d9-8e3b-cf289dcfed06@gmx.net>
X-Provags-ID: V03:K1:h5kxPKQosHmCAQ+mQrY3swxleO0bEgIEavP7ERatTpGcNvAWPe7
 B49LQc9fCKbT/3Kd6bRSm3Cwaqr4FTFOBUiW5KR5jDZznD2DdQc9Lpn44K+9PyPRiLYIasZ
 AXEZqZGtNz/hPVZ1eNi97Xp2GSefrSj+LcGLHQy7DozP7/fCt/X0j8n0L91Ud08l/DtE3bu
 4/GQeoqW7kSrFEoGRi+TQ==
UI-OutboundReport: notjunk:1;M01:P0:HirUZIedI/c=;gNuroRwHN/BCWCyqj8/EV2jtk7E
 zyygKzxOxkxEvU9nv8CVZSqKz2zcoAEHHADyKTh70qYbkr5GTuGMk5P2QUFeNOUcWu3iQgkmq
 h6SOZqOelGbjy+P6Pky+ujsgkY1b1RpUaQFniHQFLPSaHn1Wwu54H/XZfg8ZcckDPfE+34Hsn
 s0bP8ecq9FodeRZ6uAIhcESq4fUsdvCoqCWKqdcAtBa7cfNnve5Rlfdw6cU0k35+8OZZBaGsG
 xs6rviitaBjfLEHrIx6SFlLiXrecNCdv7+yR7oLRC5uePz+MHZ8e7IbeJXusumEpV7mhZtwWL
 OeMcQy32RjjqLtOOvH/vHb5l1cdANM4QxA/jVYSmUdf3nwWteOgQqpEdSlMZMjyM6Qn93JYgg
 iO+PhJ9+7LOShFQPTb6fvrKjjmSr6W1xn2o1KrBkXuwWiEGisgEIFPF5PGz9lhAz/YoF0e3Gv
 c6njPu+CjrFMGmIY2eP3U/fXfjdVLNpueU4tRowdRNVIqfsb6ZCr/DOJZp53JrlXgKDHHK+Hj
 ngrZ6LweEMz6wm0INORFVZccfth2oKm0sLPbnPSh9SwiQ6w1Y4sbIN3JmksV3LbPCgL0m8q7+
 ImLi1Baqle7oDFoxbEEcCGUlVKgI4v55f5kEi2ae4eDHAnz883Asz8QhgAkzAExCks+GboV4y
 fem1fFooR/kq/sf3P9SppRgbpfOYldOA2pfPZdmmfFU4DTt6TqSbOc18DymQutND/sqSrQcGl
 p2sW8Iyi/bMAHd7xnXUMpERjhnxle830DOeGzXKg+Q1p9wgMfDUcgqS8hPJEHtpHPh9ItZFU1
 U9snForY7FdmRBpcEHnLqCPOqCNoIvhyWaWQwdrSEz7Pc6E5y/uItBwK9yzmPZS5kgVhUHMhS
 +fhXIPjn6DrSyd0I2N7SzDXBRHEtpFFdY0SVS4rqhaWvSY4uJojWWBdUXOC0gjK7mzanDkDSf
 EEEHVUwbLbIrVuAK5ojY7ycG1M0p3uKqeuW3tguEDMw/bGdbd2mSIv//tSRsYeMKDEAkw81TH
 GnvrS23xB1d4pXd1XvWnHfFdwQFTTHH+ewjXweinI8xSweZTF5Sca/oNTzxdJy0h4A2MNXZJ0
 BAhtWrv4DSnGZR0CvigcggRxqu2dczETQPTd8lMe1Gu+FzZ5sHvcNe67CLmdaHkp63Tfii6E+
 be3h4YWn7fyVBHGTJ394anReHsbWbzrkjkyOmSugYimG3P6LuMKCBy+tLLWeytQsEYbHRN9JL
 MC8W495dJZflW/0/2VrIgsCtEzwPnUi/wijU9zpRJA7VTXN+9T23LSj/5mjIxps7AhNrr5zul
 21eoGN+DTIW6H9vRkoCAxVpG4teaN5ijCHGsHzfEks2aYYRz3NI+hIMuOY3v1qwfKyzQlEjbW
 SSlDCuGNhdAjjzPokVDDrdz0qmW7OxmLQAr8OEw6SuEp7uOPDQJbQyVCLHo2q8mwG/9okWLDE
 zDNcaWYCSdtVOQqeFF9cVEFDhtEc=

This is a multi-part message in MIME format.
--------------s1UbW85OTqGqDndC01cV410i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello experts!

I need some useful help, because unfortunately, I'm not a Linux expert.
I've been trying for days to install Debian-live-11.0.0 or
12.10.0-amd64-standard on a Fujitsu Futro S520 ThinClient AMD GX-212ZC
4GB 4GB SSD. Unfortunately, I keep getting the error message that
"rtl8168g-2.fw" is missing, and even on Github, I haven't been able to
find how to install it. Also, I'm missing this file, and I don't know
where to download it. I was able to find a file called "rtl8168g-2.fw"
on Github, but since I'm a complete newbie, I don't know what to do with
it. I'm installing using the graphical interface and watching this video
for support: https://www.youtube.com/watch?v=3D_guk3Mx6UbM

Without step-by-step instructions, I'm really stuck. How do I open a
console in the graphical installation? Perhaps a personal comment about
all Linux versions. Linux is on the rise, and that would be a really,
really good thing. But as long as users encounter such unsolvable
problems, it simply won't work. No matter how much we long for a truly
good Linux system that can run, for example, Microsoft Flight Simulator,
no Linux programmer can imagine that! Everything has to run smoothly,
though, and that's the crux of the matter.

Greetings J=C3=BCrgen



--------------s1UbW85OTqGqDndC01cV410i
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-forward-container">
      <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><s=
pan
              class=3D"ryNqvb">Hello experts!</span></span><span
            class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">=C2=A0</span></s=
pan></span></p>
      <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><s=
pan
              class=3D"ryNqvb">I need some useful help, because
              unfortunately, I'm not a Linux expert. </span></span></span>=
<span
          class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span
              class=3D"ryNqvb">I've been trying for days to install
              Debian-live-11.0.0 or 12.10.0-amd64-standard on a Fujitsu
              Futro S520 ThinClient AMD GX-212ZC 4GB 4GB SSD. </span></spa=
n></span><span
          class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span
              class=3D"ryNqvb">Unfortunately, I keep getting the error
              message that "rtl8168g-2.fw" is missing, and even on
              Github, I haven't been able to find how to install it.</span=
></span>
          <span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">Also, I'm
              missing this file, and I don't know where to download it.</s=
pan></span>
          <span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">I was able t=
o
              find a file called "rtl8168g-2.fw" on Github, but since
              I'm a complete newbie, I don't know what to do with it. </sp=
an></span></span><span
          class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span
              class=3D"ryNqvb">I'm installing using the graphical
              interface and watching this video for support: <a
                href=3D"https://www.youtube.com/watch?v=3D_guk3Mx6UbM"
                class=3D"moz-txt-link-freetext" moz-do-not-send=3D"true">h=
ttps://www.youtube.com/watch?v=3D_guk3Mx6UbM</a><br>
            </span></span></span></p>
      <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><s=
pan
              class=3D"ryNqvb">Without step-by-step instructions, I'm
              really stuck.</span></span> <span class=3D"jCAhz ChMk0b"><sp=
an
              class=3D"ryNqvb">How do I open a console in the graphical
              installation? </span></span></span><span class=3D"HwtZe"
          lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">=
Perhaps
              a personal comment about all Linux versions.</span></span>
          <span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">Linux is on
              the rise, and that would be a really, really good thing. </s=
pan></span></span><span
          class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span
              class=3D"ryNqvb">But as long as users encounter such
              unsolvable problems, it simply won't work.</span></span> <sp=
an
            class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">No matter how mu=
ch
              we long for a truly good Linux system that can run, for
              example, Microsoft Flight Simulator, no Linux programmer
              can imagine that!</span></span> <span
            class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">Everything has t=
o
              run smoothly, though, and that's the crux of the matter.</sp=
an></span></span></p>
      <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><s=
pan
              class=3D"ryNqvb">Greetings J=C3=BCrgen</span></span></span><=
/p>
      <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><s=
pan
              class=3D"ryNqvb"><br>
            </span></span></span></p>
      <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><s=
pan
              class=3D"ryNqvb"><br>
            </span></span></span></p>
    </div>
  </body>
</html>

--------------s1UbW85OTqGqDndC01cV410i--
