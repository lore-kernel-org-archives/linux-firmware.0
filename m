Return-Path: <SRS0=D+W1=EW=gmail.com=rogan.dawes@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EB5EE14AD
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 15:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1991C433CB; Wed,  6 Sep 2023 15:28:32 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59D44C433C8
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 15:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59D44C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dawes.za.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1d14bb44ad1so2976063fac.1
        for <linux-firmware@kernel.org>; Wed, 06 Sep 2023 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20230601.gappssmtp.com; s=20230601; t=1694014109; x=1694618909; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6laJjTaLENxcam6/eRe66IAuanZnXL1tp/yIfGBMbVg=;
        b=qm6HkFEOHBVLFaauWn5kzoR9qBdkQ0KUj4pbOCHiek/2BB3zWBzr3YJLkpia5iD3xH
         6QNOA9xPrPgAHUVCh6bLATqi3moTEsLzHRez5NBjGAs3bwKgs/sbG0IEblhETOfK5fBO
         i/DCqQZP316A7hkaQR9ZGUOVf2yUAAQ6YXBuXGdRoO3E5zYe4sxCXzp1KJ4XVsCzmclo
         hRdtlBQYLkTEw0frjlO+cM8rhI9yd3pS5o/i//P8qDRhetGMM6KdBujPFL7kTA7BL7Ur
         d/hXlycGbEJ0WIXmpw3p6tm2szGfYdt540JncI6lVl5IyMfoDthnk2pRdxcEJIB9aVkg
         CFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694014109; x=1694618909;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6laJjTaLENxcam6/eRe66IAuanZnXL1tp/yIfGBMbVg=;
        b=XIrTXQNudhPa2KDxMZqrdcCTEEMOZwKA4QtKtSQTwi/+c+xVM1tHyQy4TEfKw6+BTt
         k8e0OgeReB6JF2aRsbXS06PvERqzUg4HMxSMOlV3pR2lRRoHbukXxO5guz73+6jG2or5
         V8LaR3IJbipwH7cFgucoJcTbfAcn7zCLuJDE+9p6gbcgNH4UiyQ8T+R+W+TjHrrFNGhR
         Tw+iPsDTKFIhYYvkiCfbwDfZCvFzKfHa2lxGo725gp4ROrbu+1BWbEkhCCDIMcZwLVvD
         Czg9g4dWrl28NrRFFDiKZHBdCBe7TXErvAOaHXzfGehhLjdZR+83y9TEWY9dQoHhTRpC
         JUcA==
X-Gm-Message-State: AOJu0YzUC90Yu58EGji6bphYYZTrl2p1tHkrkoOllPGOycfAE5nleT/M
	8/v1M+t/hOdnX9KVy7GyCHgTJ5EL565ou6NW6pYdr7NvO+g=
X-Google-Smtp-Source: AGHT+IFpSDsHeRkNGy9A5mBgvdlJgtor9ft4ElC/9+Y4YUpAkCPV9wZMcY8P9yibQAhnpj/xOYst+tDFkJS+OcGw6iE=
X-Received: by 2002:a05:6870:440e:b0:1bf:9fa2:bf8e with SMTP id
 u14-20020a056870440e00b001bf9fa2bf8emr22119949oah.1.1694014108856; Wed, 06
 Sep 2023 08:28:28 -0700 (PDT)
MIME-Version: 1.0
From: Rogan Dawes <rogan@dawes.za.net>
Date: Wed, 6 Sep 2023 17:28:18 +0200
Message-ID: <CAOYdKdhsMWGtubm-sRs3f8Y0K4Raz1ATbV_NhGw+04MtALiLQw@mail.gmail.com>
Subject: [PATCH] brcm: Add 4334 NVRAM for the Wink Hub v1
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="00000000000033f4f00604b26544"

--00000000000033f4f00604b26544
Content-Type: text/plain; charset="UTF-8"

Add a NVRAM file for the Broadcom 4334 Wifi/BT module as used on the
Wink Hub v1 home automation gateway. This file has been lifted directly
from the vendor firmware image, and has been tested using a custom
OpenWrt build.

Signed-off-by: Rogan Dawes <rogan@dawes.za.net>
---
 ...cmfmac4334-sdio.wink,imx28-wink-hub-v1.txt | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt

diff --git a/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt
b/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt
new file mode 100644
index 00000000..e63019b0
--- /dev/null
+++ b/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt
@@ -0,0 +1,101 @@
+# SWB-B53_B1_R04_eLNA 10/21/2011
+
+manfid=0x2d0
+prodid=0x05c1
+vendid=0x14e4
+devid=0x4380
+boardtype=0x05de
+boardrev=0x1105
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+sromrev=0
+
+boardflags=0x10081a00
+xtalfreq=37400
+nocrc=1
+ag0=255
+aa2g=1
+ccode=ALL
+pa0itssit=0x20
+
+#PA parameters for 2.4GHz (0x15A7,0xFD54,0xFF4A)
+pa0b0=0x19B7
+pa0b1=0xFD2A
+pa0b2=0xFF7B
+extpagain2g=2
+extpagain5g=2
+
+# rssi params for 2.4GHz
+rssismf2g=0x2
+rssismc2g=0x7
+rssisav2g=0x1
+cckPwrOffset=0
+
+# rssi params for 5GHz
+rssismf5g=0x8
+rssismc5g=0x8
+rssisav5g=0x1
+
+
+#PA parameters for lower a-band
+pa1lob0=5516
+pa1lob1=-680
+pa1lob2=-182
+#PA parameters for midband
+pa1b0=5560
+pa1b1=-683
+pa1b2=-178
+#PA paramasdeters for high band
+pa1hib0=5438
+pa1hib1=-681
+pa1hib2=-193
+rxpo5g=0
+
+
+maxp2ga0=66
+ofdm2gpo=0x22222222
+mcs2gpo0=0x4444
+mcs2gpo1=0x4444
+
+maxp5ga0=0x4a
+maxp5gla0=0x4a
+maxp5gha0=0x4a
+ofdm5gpo=0x66666666
+ofdm5glpo=0x66666666
+ofdm5ghpo=0x66666666
+mcs5gpo0=0x8888
+mcs5gpo1=0x8888
+mcs5glpo0=0x8888
+mcs5glpo1=0x8888
+mcs5ghpo0=0x8888
+mcs5ghpo1=0x8888
+
+#il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+pagc2g=0x10
+#dacgc2g=4
+txalpfbyp=1
+
+#For SEMCO B53-R04-eLNA Module
+swctrlmap_2g=0x0c0c0c0c,0x12121212,0x02020202,0x11202,0x1ff
+swctrlmap_5g=0x40404040,0x20202020,0x20202020,0x12202,0x2f8
+
+gain=32
+triso2g=12
+triso5g=8
+
+hostwake=0x40
+hostrdy=0x41
+usbrdy=0x03
+usbrdydelay=100
+deadman_to=0xffffffff
+muxenab=0x1
+
+tssioffsetmax=27
+
+PwrOffset40mhz2g=0
+PwrOffset40mhz5g=-8
+
+tssioffsetmax5gl=21
+tssioffsetmax5gm=23
+tssioffsetmax5gh=20
-- 
2.34.1

--00000000000033f4f00604b26544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Add a NVRAM file for the Broadcom 4334 Wifi/BT module as u=
sed on the<br>Wink Hub v1 home automation gateway. This file has been lifte=
d directly<br>from the vendor firmware image, and has been tested using a c=
ustom<br>OpenWrt build.<br><br>Signed-off-by: Rogan Dawes &lt;<a href=3D"ma=
ilto:rogan@dawes.za.net">rogan@dawes.za.net</a>&gt;<br>---<br>=C2=A0...cmfm=
ac4334-sdio.wink,imx28-wink-hub-v1.txt | 101 ++++++++++++++++++<br>=C2=A01 =
file changed, 101 insertions(+)<br>=C2=A0create mode 100644 brcm/brcmfmac43=
34-sdio.wink,imx28-wink-hub-v1.txt<br><br>diff --git a/brcm/brcmfmac4334-sd=
io.wink,imx28-wink-hub-v1.txt b/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-=
v1.txt<br>new file mode 100644<br>index 00000000..e63019b0<br>--- /dev/null=
<br>+++ b/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt<br>@@ -0,0 +1,1=
01 @@<br>+# SWB-B53_B1_R04_eLNA 10/21/2011<br>+<br>+manfid=3D0x2d0<br>+prod=
id=3D0x05c1<br>+vendid=3D0x14e4<br>+devid=3D0x4380<br>+boardtype=3D0x05de<b=
r>+boardrev=3D0x1105<br>+boardnum=3D22<br>+macaddr=3D00:90:4c:c5:12:38<br>+=
sromrev=3D0<br>+<br>+boardflags=3D0x10081a00<br>+xtalfreq=3D37400<br>+nocrc=
=3D1<br>+ag0=3D255<br>+aa2g=3D1<br>+ccode=3DALL<br>+pa0itssit=3D0x20<br>+<b=
r>+#PA parameters for 2.4GHz (0x15A7,0xFD54,0xFF4A)<br>+pa0b0=3D0x19B7<br>+=
pa0b1=3D0xFD2A<br>+pa0b2=3D0xFF7B<br>+extpagain2g=3D2<br>+extpagain5g=3D2<b=
r>+<br>+# rssi params for 2.4GHz<br>+rssismf2g=3D0x2<br>+rssismc2g=3D0x7<br=
>+rssisav2g=3D0x1<br>+cckPwrOffset=3D0<br>+<br>+# rssi params for 5GHz<br>+=
rssismf5g=3D0x8<br>+rssismc5g=3D0x8<br>+rssisav5g=3D0x1<br>+<br>+<br>+#PA p=
arameters for lower a-band<br>+pa1lob0=3D5516<br>+pa1lob1=3D-680<br>+pa1lob=
2=3D-182<br>+#PA parameters for midband<br>+pa1b0=3D5560<br>+pa1b1=3D-683<b=
r>+pa1b2=3D-178<br>+#PA paramasdeters for high band<br>+pa1hib0=3D5438<br>+=
pa1hib1=3D-681<br>+pa1hib2=3D-193<br>+rxpo5g=3D0<br>+<br>+<br>+maxp2ga0=3D6=
6<br>+ofdm2gpo=3D0x22222222<br>+mcs2gpo0=3D0x4444<br>+mcs2gpo1=3D0x4444<br>=
+<br>+maxp5ga0=3D0x4a<br>+maxp5gla0=3D0x4a<br>+maxp5gha0=3D0x4a<br>+ofdm5gp=
o=3D0x66666666<br>+ofdm5glpo=3D0x66666666<br>+ofdm5ghpo=3D0x66666666<br>+mc=
s5gpo0=3D0x8888<br>+mcs5gpo1=3D0x8888<br>+mcs5glpo0=3D0x8888<br>+mcs5glpo1=
=3D0x8888<br>+mcs5ghpo0=3D0x8888<br>+mcs5ghpo1=3D0x8888<br>+<br>+#il0macadd=
r=3D00:90:4c:c5:12:38<br>+wl0id=3D0x431b<br>+pagc2g=3D0x10<br>+#dacgc2g=3D4=
<br>+txalpfbyp=3D1<br>+<br>+#For SEMCO B53-R04-eLNA Module<br>+swctrlmap_2g=
=3D0x0c0c0c0c,0x12121212,0x02020202,0x11202,0x1ff<br>+swctrlmap_5g=3D0x4040=
4040,0x20202020,0x20202020,0x12202,0x2f8<br>+<br>+gain=3D32<br>+triso2g=3D1=
2<br>+triso5g=3D8<br>+<br>+hostwake=3D0x40<br>+hostrdy=3D0x41<br>+usbrdy=3D=
0x03<br>+usbrdydelay=3D100<br>+deadman_to=3D0xffffffff<br>+muxenab=3D0x1<br=
>+<br>+tssioffsetmax=3D27<br>+<br>+PwrOffset40mhz2g=3D0<br>+PwrOffset40mhz5=
g=3D-8<br>+<br>+tssioffsetmax5gl=3D21<br>+tssioffsetmax5gm=3D23<br>+tssioff=
setmax5gh=3D20<br>-- <br>2.34.1<br><br></div>

--00000000000033f4f00604b26544--
