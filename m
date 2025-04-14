Return-Path: <SRS0=55Bk=XA=gmx.net=Juergen.Thieme@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7215BC369A2
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Apr 2025 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AB0EC4CEEA; Mon, 14 Apr 2025 16:37:38 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42347C4CEE2
	for <linux-firmware@kernel.org>; Mon, 14 Apr 2025 16:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42347C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744648654; x=1745253454; i=juergen.thieme@gmx.net;
	bh=QaCLin25QukscPoHFwrbYb7x1AMrl/T2jWxbu7yku6A=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:References:To:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RH+NzT//ob2dFj96z4PiQz01HDJUd2+gvyE+EXjDTAnFQTcO1NRvmcngJsn3Ps2j
	 bB3QyY1O2WN6o9juIyg7m+UFWF5Halc2V4cCH8zyTD1WWXapOlQmbT+KVOE4jKIlt
	 7dQ4TWJtQMfRxc7unOfU7N+5vrzwUTW5PdkHQJfsyySBmp9Stk41RUNwiErfiJv92
	 R5feO7sI7rsteaVo/JXBiSpUMVnfRBqUCEKV90D5/kecTJ/ecBi5PcSmmiOb13j8y
	 g5gbdmkjqcycMVHWPPb8xvrwEpD0Q2zqOAySLkZ2iSM8w3jY9ufhAXjC31mMOvyV/
	 3Oarz1zu5Qy7SGFCCg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.5.130] ([188.193.74.146]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8qj-1tPW9Y3Kp3-00ggKH for
 <linux-firmware@kernel.org>; Mon, 14 Apr 2025 18:37:33 +0200
Content-Type: multipart/alternative;
 boundary="------------rQ0UvVeaPLgYvfyyyhuaqLvX"
Message-ID: <e54945ea-df02-4466-8f3b-b7dc3e499523@gmx.net>
Date: Mon, 14 Apr 2025 18:37:33 +0200
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
X-Provags-ID: V03:K1:UoL1C7m3ZfKkFrM95XEth7cD0qYvzQPF1mKsO1Q3WwEB9HcdFuo
 Ol0MV3CK0C9Gh3oQGnZfgr9eb3b9DMfmJkFretLmvMDYd1khYrQaRQC58MYPl2HSPYbQT0S
 RzO29PxxOWHuq+ofJHbrHxjpOv08vGDoI3S/GMxhetBo1rTmOnEjpbYBv1Ds+q2SyMAOe2J
 5BjSwEylZVLP8wdLmCL+A==
UI-OutboundReport: notjunk:1;M01:P0:uSzVIGTLG/I=;IoKtZtAPC6yen/LqZGU6Ys1amLy
 MQ5BaCsOid1hw860JzUOYSApH29iBJfdnEL0mJxEAOWJFAjF685tYO37SC6zJ6ZCfzudyU4q2
 WoksZ7V2ngvarq1AENby93EZm0ndN+MqugN4LtOVqMxIdJVGP9jWcD7Y0LgJhRIVWHdnEkKlK
 0PWaILiO1NT9uYQLnFX0JtrvYE+ckvdRhq7ePP94J7S6qYlTVyyUyK4qeUt+8xw1ra93b58Mc
 tfVM0qV8ylLEQR+ilzzgj/SjmspxRkGFXs3toKCSYApqk9bg5A8m1//eIEtQS6CXqtmWfK9Tx
 SxG1u7oegOgDZiS21aIId2MDh0dnnO9YzGPbiSYfB5bF9NlgVWqqrMx9P4vlHsEpZRI+MqTzw
 vsEubipKhc4On7MJ91yBKmtPFIh/7Qf7E9qws+PCENFO6VfqAgcmgjD+T0skiIa/i7bmVQHcL
 GjxIxUViiR/swMbJCysabIux7ZwrZbpoDLnBy2SkUNCeIsuyNB8HiZFRbrikY9Yq7unk+oZm3
 z6tGzKwFGSB3qA+svEk2Onis0/kaAuyBTXP+e2j8zySR00wEz6EXW/0yRyx8y2yfM7r0LZW19
 /u2D1IIv0B8rA+/hCgPWXXe353VsTYYb6PPLy/PvFdoGaP/mFO+Y4KGU8jRKG5VcRY4Bq/7pn
 qEvO50K0oBItsyRNE7qmAhDGAYfzOc4TX9KPQma3w9YBMsMdgvsEUSD6g5qUxo/B3sf9uIlgJ
 opPpeLM+pg9qeEjhLovqvpsbDx3+PIa4Db2rarU4Tfn/wTcC7S1vZgt2Rdy/II/srvJJTwQGk
 5gPHLRt7SoaXy+MFqpHMgsWFIvnUHmEQy0y623a6qzPFkSeFjkvqc/pV32gUdcARqGBZPcDjG
 Y4xpE7hqyZv4/xlNBczKptRMoaEPTFn0EJakdFmg2RWIVaiXb1iGRhHZWIbf/xGYA6urxq1fX
 c56X5FX+l4kSTYMe/m00VH4U6fR28Y9h5oR3dAlRlFKDr8TS4BdI2EpXLGGoUTEqwpUxEVSPD
 jdQqbRy1geEQm4o8WfTxWdmlho9p3k28FlMi0K1LqqxnZY8gnVpMq7/fnrYkBniVvNG9iRI8E
 d0Ul47h6B+9aVMc8de5K+xn1Bq1/RiiU/U6rodnRFyRZSAKlM4684PYgLIQojM7EnZYsqyGeY
 buFp9PEpOHjVFB3J3OgRtU2UyOD28IebvFWSUzyQBFswOUhwX8Rhwuth5K7nfveg/6vnj/bY/
 Dy2k+czNScpYGysPeGR+6/hWRnXeldDEjR6tKpKECCbZGxtT6HKmSneU7fEbBSVBTVClZmrSr
 AzU6xWOkZ4gzNvDfqq0l4hT3oR4H7julmHfkLY1KgUto/fRHFlLyv2jJdYlhcKvdzJNGHv82P
 +S1M8eTKQTjDHXuFiexeRlC7lg2utrtBovKHpKPYCKYYjXXESfYD/JrPTnI9Rn+i3p0g+Wn9N
 76RspHa8Ur4v821PtBkwZ9ZkWFHw=

This is a multi-part message in MIME format.
--------------rQ0UvVeaPLgYvfyyyhuaqLvX
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



--------------rQ0UvVeaPLgYvfyyyhuaqLvX
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

--------------rQ0UvVeaPLgYvfyyyhuaqLvX--
