Return-Path: <SRS0=55Bk=XA=gmx.net=Juergen.Thieme@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37971C369A2
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Apr 2025 16:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6561C4CEEB; Mon, 14 Apr 2025 16:36:50 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9D2EC4CEEC
	for <linux-firmware@kernel.org>; Mon, 14 Apr 2025 16:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9D2EC4CEEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744648606; x=1745253406; i=juergen.thieme@gmx.net;
	bh=6SUT0CTh/esDb9vsYIDwGCzzk7SGEmY/Q4Pq/Jwsgwc=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:To:
	 From:Subject:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=CPsiwaZKBVMb0MQSB0qktAgvOIj1oqNQxSk4j6re1R6lxwdq0O0JQEIwoimi5THq
	 prPZKj1Zav3SslaOyyxutBt8TjBNnTv9mBTFXepvPTlsalvPzuD8OycFG4ACDiFKQ
	 nhoSIGMrpLUWVWyZQdns63n6zrOVh2yja0vdrxic9DW1TdWrloGobUL7VuFHP/+fo
	 oKTSPAbZLH20oLK2dlXy45o++o6q9fGTPw2j8QSqMbh8/YrpU1JE+z+WtQyMV8JgA
	 9bJiDjamoGcpx/G5mACHlpRoGdyxWVIydQ04MDmyLqLcB+VNdc5AbQT7PFcETLXKv
	 OQIX+LzytzorrkLpNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.5.130] ([188.193.74.146]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwbp-1tt34R1gIj-00Arsf for
 <linux-firmware@kernel.org>; Mon, 14 Apr 2025 18:36:46 +0200
Content-Type: multipart/alternative;
 boundary="------------C8jjimKEHuDPuXdvyPwjV70W"
Message-ID: <f433a4d3-37b2-48d9-8e3b-cf289dcfed06@gmx.net>
Date: Mon, 14 Apr 2025 18:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: =?UTF-8?Q?J=C3=BCrgen_Thieme?= <Juergen.Thieme@gmx.net>
Subject: I need some useful help
X-Provags-ID: V03:K1:0JPh+IcEGCXbvfSP4G0x7T7b/G4YCmI/JNmgw1WLbBkgW8hct8d
 d3PA/UAmyeKaR7K9Z8ldU951ehzwHgDAlUOENh4NpvxXKxidKaUfi0lyDvOh3KKce0sd4eY
 OePB9WDDoLrzzS8CISgXuLwvr1DFrStLx8IvAfDgumbCfe+kmXwPK+mtKxj5W5CgHpWKQhm
 goiixyxGfXtUObPIzzKZw==
UI-OutboundReport: notjunk:1;M01:P0:SIlbg/cYgNs=;w0CD4E5WzU8Zm8Q6ORCPXFGd0Ld
 X0CFrr6rDFpHd8qC38fa163Ko96Zs+s9aLr2g9Q7hWJfiUA42yIaDztVziZly/9BCBoHbEyOh
 dJaTnBftJjBO2y7dSTopyjaOZoxbgIZeem+h4aSZZ26kidg/anfnoWT++zTHQQaLUSgkmmRWt
 oiOlH/APCLCLOjzpt1ha1fDNsgxiAlHYCZWpdhR5fqdP8YwW+IGA7k4pYebtt/7K120y9eFG9
 Q6C2ofOFo01cKyicPQ2Z+AMVz+kvo1Mc4NsYdRhsPKYu//1WAu92fKaIgICuyhk4puuHTT5hM
 fosZehjMxGf1n551OsF6ajZzT9fdzVybDLw5XVOkui25YxcPI+2rjkkxS48bwOekmoHB4sT/i
 KKu2D5MJh/8lNlPjPPURATW/r0yaroXs321X7H+IlvbL5S4IWZT8PGs9j8zJaI37LPlXHjBCp
 nE/Vya9Gk7udmpz6tMIiqtA2ztENG1m7F7z5ppCQeW1rsHrwg7qo/Bc7gDl6wsc4AP35PRS0Z
 CqFN9W/K+jxAEDIRh1f75BjHzKumPR39HNO4Ql0mzJBhl8dHFg+UmBETs/ZinER+O15qgb91b
 qHcfnUzI5NKrTfDJr5m+yN8wfi3S1CCO8aJSsQb4xlPG/yidgmTfYvvUuuhjoiPPxOahA9XoN
 g9Y6eIeZbsS9v6xbmxd1nu+oKFHZO3mbfNH2EQDsADe2F295e+Rk0hU5QsNm2605JX9iPUgRf
 +G6wYpMVjFOtyqc5TGz9N6RYypviU9QcOxsk8yaxkXIDRCaEiY8KCwrRriXs9ha/eGQigBAce
 PQRe5y5ImVUkzzLcR+F2/prNMfrAdihEjzSEmBGJrFfEkADguxhijx7V281TmdwLi8S68TQz9
 6yjKjnuac+yXU9IZQQ5yPasZMd7+lpBTXpV3t0nhZSjwjJbix/NqJnnI4F54Q7/Up1zw9R2S2
 8suSmSQHOMryOtABzZSsN0WjczRcOyaEywVIxSxwy6bhAVrsdQVTYZi3/OZwta1/mZgW6074U
 d8iyq6GesPTmbkIS2ZJJulFy+pKoqq+Sd+buzS7sjpfAXC7cyswiyHP45PubG5lkqtlADkvU0
 d8SPmlb8rPsX1XUDsxLaGLdkVE2I5YmBCCyBzXRx71T8h1xWZfGMfXn1Ak8CtTJ+J4o+88A1m
 XqHoMTbGvuY7iN4HOyritjSSDaqUB3+hqImdkm+MXqMXxJF2kljZQ1NHjXXM1dKI9skJC0i7J
 htMRXHScinT1F5aQlxITFWSoD+gHkvm42+OJobp4EzYRmLZZikTlOvfgG32OCBj3uovHWZA6q
 EI99atRKr0YdmbPQAFYQJ+D1OK6xFBJGbM+sPNOre/w9nTkvNE5FyfUYUKl/F/+y0G48+On0u
 l3MKNiTu35EVQG3Ep5zk2IRanJ9mrlJ7L5FfllQGb1nlYIpVNJXbHmv7ROTBoECmSjP4wYSs1
 KH+3ofJi8wU+uGmg7ndncVwZBcGQ=

This is a multi-part message in MIME format.
--------------C8jjimKEHuDPuXdvyPwjV70W
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



--------------C8jjimKEHuDPuXdvyPwjV70W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><spa=
n
            class=3D"ryNqvb">Hello experts!</span></span><span
          class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">=C2=A0</span></spa=
n></span></p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><spa=
n
            class=3D"ryNqvb">I need some useful help, because
            unfortunately, I'm not a Linux expert. </span></span></span><s=
pan
        class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span
            class=3D"ryNqvb">I've been trying for days to install
            Debian-live-11.0.0 or 12.10.0-amd64-standard on a Fujitsu
            Futro S520 ThinClient AMD GX-212ZC 4GB 4GB SSD. </span></span>=
</span><span
        class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span
            class=3D"ryNqvb">Unfortunately, I keep getting the error
            message that "rtl8168g-2.fw" is missing, and even on Github,
            I haven't been able to find how to install it.</span></span>
        <span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">Also, I'm
            missing this file, and I don't know where to download it.</spa=
n></span>
        <span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">I was able to
            find a file called "rtl8168g-2.fw" on Github, but since I'm
            a complete newbie, I don't know what to do with it. </span></s=
pan></span><span
        class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span
            class=3D"ryNqvb">I'm installing using the graphical interface
            and watching this video for support: <a
              href=3D"https://www.youtube.com/watch?v=3D_guk3Mx6UbM"
              class=3D"moz-txt-link-freetext">https://www.youtube.com/watc=
h?v=3D_guk3Mx6UbM</a><br>
          </span></span></span></p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><spa=
n
            class=3D"ryNqvb">Without step-by-step instructions, I'm really
            stuck.</span></span> <span class=3D"jCAhz ChMk0b"><span
            class=3D"ryNqvb">How do I open a console in the graphical
            installation? </span></span></span><span class=3D"HwtZe"
        lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">Pe=
rhaps
            a personal comment about all Linux versions.</span></span> <sp=
an
          class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">Linux is on the
            rise, and that would be a really, really good thing. </span></=
span></span><span
        class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span
            class=3D"ryNqvb">But as long as users encounter such
            unsolvable problems, it simply won't work.</span></span> <span
          class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb">No matter how much
            we long for a truly good Linux system that can run, for
            example, Microsoft Flight Simulator, no Linux programmer can
            imagine that!</span></span> <span class=3D"jCAhz ChMk0b"><span
            class=3D"ryNqvb">Everything has to run smoothly, though, and
            that's the crux of the matter.</span></span></span></p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><spa=
n
            class=3D"ryNqvb">Greetings J=C3=BCrgen</span></span></span></p=
>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><spa=
n
            class=3D"ryNqvb"><br>
          </span></span></span></p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><spa=
n
            class=3D"ryNqvb"><br>
          </span></span></span></p>
  </body>
</html>

--------------C8jjimKEHuDPuXdvyPwjV70W--
