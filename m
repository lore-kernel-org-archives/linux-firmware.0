Return-Path: <SRS0=QSo0=W4=manjaro.org=strit@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D82BC43334
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jun 2022 13:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46CDDC3411D; Tue, 21 Jun 2022 13:14:15 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00591C3411C;
	Tue, 21 Jun 2022 13:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00591C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=manjaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Content-Type: multipart/alternative;
 boundary="------------qam8XzETSyeChn9AtYkjmZzA"
Message-ID: <bf35b0c6-62fe-cca0-ca7c-516a61679fc9@manjaro.org>
Date: Tue, 21 Jun 2022 15:14:01 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] brcm: Add NVRAM file for Pinebook Pro from Pine64
Content-Language: da-DK
To: Josh Boyer <jwboyer@kernel.org>, Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
References: <20220610114051.2663502-1-strit@manjaro.org>
 <CA+5PVA5eYmZhCN_E=ZxzEo2uEoNG4m3HKmH-XN6JpNyUCwQB+A@mail.gmail.com>
From: Dan Johansen <strit@manjaro.org>
Organization: Manjaro ARM
In-Reply-To: <CA+5PVA5eYmZhCN_E=ZxzEo2uEoNG4m3HKmH-XN6JpNyUCwQB+A@mail.gmail.com>

This is a multi-part message in MIME format.
--------------qam8XzETSyeChn9AtYkjmZzA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

It will, as it used the same file. Sorry about that.

Links should be fine then?

Den 21.06.2022 kl. 15.12 skrev Josh Boyer:
> Peter, is this going to have the same problem that the Quartz patch had?
>
> josh
>
> On Fri, Jun 10, 2022 at 7:43 AM Dan Johansen <strit@manjaro.org> wrote:
>
>     This file is based on the existing
>     "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt" NVRAM file.
>     Also update the WHENCE file.
>
>     The new batch of Pine64 Pinebook Pro ships with a new wifi/bt
>     module, that uses this firmware, so add the config file to get it
>     detected.
>
>     Signed-off-by: Dan Johansen <strit@manjaro.org>
>     ---
>      WHENCE                                        |  1 +
>      ...brcmfmac43455-sdio.pine64,pinebook-pro.txt | 83
>     +++++++++++++++++++
>      2 files changed, 84 insertions(+)
>      create mode 100644 brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
>
>     diff --git a/WHENCE b/WHENCE
>     index 776dd8b..853bed6 100644
>     --- a/WHENCE
>     +++ b/WHENCE
>     @@ -2952,6 +2952,7 @@ File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>      File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>      Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt ->
>     brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>      File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
>     +File: "brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt"
>      File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
>      File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>      Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt ->
>     brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>     diff --git a/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
>     b/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
>     new file mode 100644
>     index 0000000..83ca9f4
>     --- /dev/null
>     +++ b/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
>     @@ -0,0 +1,83 @@
>     +# SPDX-License-Identifier: GPL-2.0+
>     +# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.
>     +# NVRAM config file for the BCM43455 WiFi/BT chip as found on the
>     +# Pine64 Pinebook Pro
>     +aa2g=1
>     +aa5g=1
>     +AvVmid_c0=1,165,2,100,2,100,2,100,2,100
>     +boardflags=0x00480201
>     +boardflags2=0x40800000
>     +boardflags3=0x44200100
>     +boardrev=0x1304
>     +boardtype=0x6e4
>     +btc_mode=1
>     +btc_params1=0x7530
>     +btc_params8=0x4e20
>     +btc_params50=0x972c
>     +cbfilttype=1
>     +cckPwrIdxCorr=3
>     +cckTssiDelay=150
>     +deadman_to=481500000
>     +devid=0x43ab
>     +dot11agofdmhrbw202gpo=0x4442
>     +dot11b_opts=0x3aa85
>     +ed_thresh2g=-54
>     +ed_thresh5g=-54
>     +eu_edthresh2g=-54
>     +eu_edthresh5g=-54
>     +extpagain2g=2
>     +extpagain5g=2
>     +fdsslevel_ch11=6
>     +femctrl=0
>     +itrsw=1
>     +ldo1=4
>     +ltecxfnsel=0x22
>     +ltecxgcigpio=0x32
>     +ltecxmux=0
>     +ltecxpadnum=0x0504
>     +macaddr=b8:27:eb:74:f2:6c
>     +manfid=0x2d0
>     +maxp2ga0=80
>     +maxp5ga0=82,82,82,82
>     +mcsbw202gpo=0x98444422
>     +mcsbw205ghpo=0xb9555000
>     +mcsbw205glpo=0xb9555000
>     +mcsbw205gmpo=0xb9555000
>     +mcsbw402gpo=0x98444422
>     +mcsbw405ghpo=0xb9555000
>     +mcsbw405glpo=0xb9555000
>     +mcsbw405gmpo=0xb9555000
>     +mcsbw805ghpo=0xb9555000
>     +mcsbw805glpo=0xb9555000
>     +mcsbw805gmpo=0xb9555000
>     +nocrc=1
>     +ofdmlrbw202gpo=0x0022
>     +ofdmTssiDelay=150
>     +pa2ga0=-129,6525,-718
>     +pa2ga1=-149,4408,-601
>     +pa5ga0=-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818
>     +pa5ga1=-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575
>     +pdoffset2g40ma0=16
>     +pdoffset2gperchan=0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0
>     +pdoffset40ma0=0x8888
>     +pdoffset80ma0=0x8888
>     +pdoffsetcckma0=2
>     +phycal_tempdelta=15
>     +prodid=0x06e4
>     +rawtempsense=0x1ff
>     +rxchain=1
>     +sromrev=11
>     +swctrlmap_2g=0x00000000,0x00000000,0x00000000,0x010000,0x3ff
>     +swctrlmap_5g=0x00100010,0x00200020,0x00200020,0x010000,0x3fe
>     +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x3
>     +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x3
>     +tssipos2g=1
>     +tssipos5g=1
>     +tworangetssi2g=1
>     +tworangetssi5g=1
>     +txchain=1
>     +txpwr2gAdcScale=1
>     +txpwr5gAdcScale=1
>     +vcodivmode=1
>     +vendid=0x14e4
>     +xtalfreq=37400
>     -- 
>     2.36.1
>
-- 
Kind regards
*Dan Johansen*
Project lead of the *Manjaro ARM* project
Manjaro-ARM <https://manjaro.org>
--------------qam8XzETSyeChn9AtYkjmZzA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>It will, as it used the same file. Sorry about that.</p>
    <p>Links should be fine then?<br>
    </p>
    <div class="moz-cite-prefix">Den 21.06.2022 kl. 15.12 skrev Josh
      Boyer:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+5PVA5eYmZhCN_E=ZxzEo2uEoNG4m3HKmH-XN6JpNyUCwQB+A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Peter, is this going to have the same problem that
        the Quartz patch had?
        <div><br>
        </div>
        <div>josh</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Jun 10, 2022 at 7:43
          AM Dan Johansen &lt;<a href="mailto:strit@manjaro.org"
            moz-do-not-send="true" class="moz-txt-link-freetext">strit@manjaro.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This
          file is based on the existing
          "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt" NVRAM
          file.<br>
          Also update the WHENCE file.<br>
          <br>
          The new batch of Pine64 Pinebook Pro ships with a new wifi/bt
          module, that uses this firmware, so add the config file to get
          it detected.<br>
          <br>
          Signed-off-by: Dan Johansen &lt;<a
            href="mailto:strit@manjaro.org" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">strit@manjaro.org</a>&gt;<br>
          ---<br>
           WHENCE                                        |  1 +<br>
           ...brcmfmac43455-sdio.pine64,pinebook-pro.txt | 83
          +++++++++++++++++++<br>
           2 files changed, 84 insertions(+)<br>
           create mode 100644
          brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt<br>
          <br>
          diff --git a/WHENCE b/WHENCE<br>
          index 776dd8b..853bed6 100644<br>
          --- a/WHENCE<br>
          +++ b/WHENCE<br>
          @@ -2952,6 +2952,7 @@ File:
          "brcm/brcmfmac43430-sdio.MUR1DX.txt"<br>
           File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"<br>
           Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt
          -&gt; brcmfmac43430-sdio.raspberrypi,3-model-b.txt<br>
           File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"<br>
          +File: "brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt"<br>
           File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"<br>
           File:
          "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"<br>
           Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
          -&gt; brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt<br>
          diff --git a/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
          b/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt<br>
          new file mode 100644<br>
          index 0000000..83ca9f4<br>
          --- /dev/null<br>
          +++ b/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt<br>
          @@ -0,0 +1,83 @@<br>
          +# SPDX-License-Identifier: GPL-2.0+<br>
          +# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.<br>
          +# NVRAM config file for the BCM43455 WiFi/BT chip as found on
          the<br>
          +# Pine64 Pinebook Pro<br>
          +aa2g=1<br>
          +aa5g=1<br>
          +AvVmid_c0=1,165,2,100,2,100,2,100,2,100<br>
          +boardflags=0x00480201<br>
          +boardflags2=0x40800000<br>
          +boardflags3=0x44200100<br>
          +boardrev=0x1304<br>
          +boardtype=0x6e4<br>
          +btc_mode=1<br>
          +btc_params1=0x7530<br>
          +btc_params8=0x4e20<br>
          +btc_params50=0x972c<br>
          +cbfilttype=1<br>
          +cckPwrIdxCorr=3<br>
          +cckTssiDelay=150<br>
          +deadman_to=481500000<br>
          +devid=0x43ab<br>
          +dot11agofdmhrbw202gpo=0x4442<br>
          +dot11b_opts=0x3aa85<br>
          +ed_thresh2g=-54<br>
          +ed_thresh5g=-54<br>
          +eu_edthresh2g=-54<br>
          +eu_edthresh5g=-54<br>
          +extpagain2g=2<br>
          +extpagain5g=2<br>
          +fdsslevel_ch11=6<br>
          +femctrl=0<br>
          +itrsw=1<br>
          +ldo1=4<br>
          +ltecxfnsel=0x22<br>
          +ltecxgcigpio=0x32<br>
          +ltecxmux=0<br>
          +ltecxpadnum=0x0504<br>
          +macaddr=b8:27:eb:74:f2:6c<br>
          +manfid=0x2d0<br>
          +maxp2ga0=80<br>
          +maxp5ga0=82,82,82,82<br>
          +mcsbw202gpo=0x98444422<br>
          +mcsbw205ghpo=0xb9555000<br>
          +mcsbw205glpo=0xb9555000<br>
          +mcsbw205gmpo=0xb9555000<br>
          +mcsbw402gpo=0x98444422<br>
          +mcsbw405ghpo=0xb9555000<br>
          +mcsbw405glpo=0xb9555000<br>
          +mcsbw405gmpo=0xb9555000<br>
          +mcsbw805ghpo=0xb9555000<br>
          +mcsbw805glpo=0xb9555000<br>
          +mcsbw805gmpo=0xb9555000<br>
          +nocrc=1<br>
          +ofdmlrbw202gpo=0x0022<br>
          +ofdmTssiDelay=150<br>
          +pa2ga0=-129,6525,-718<br>
          +pa2ga1=-149,4408,-601<br>
+pa5ga0=-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818<br>
+pa5ga1=-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575<br>
          +pdoffset2g40ma0=16<br>
          +pdoffset2gperchan=0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0<br>
          +pdoffset40ma0=0x8888<br>
          +pdoffset80ma0=0x8888<br>
          +pdoffsetcckma0=2<br>
          +phycal_tempdelta=15<br>
          +prodid=0x06e4<br>
          +rawtempsense=0x1ff<br>
          +rxchain=1<br>
          +sromrev=11<br>
          +swctrlmap_2g=0x00000000,0x00000000,0x00000000,0x010000,0x3ff<br>
          +swctrlmap_5g=0x00100010,0x00200020,0x00200020,0x010000,0x3fe<br>
          +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x3<br>
          +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x3<br>
          +tssipos2g=1<br>
          +tssipos5g=1<br>
          +tworangetssi2g=1<br>
          +tworangetssi5g=1<br>
          +txchain=1<br>
          +txpwr2gAdcScale=1<br>
          +txpwr5gAdcScale=1<br>
          +vcodivmode=1<br>
          +vendid=0x14e4<br>
          +xtalfreq=37400<br>
          -- <br>
          2.36.1<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <div class="moz-signature">-- <br>
      Kind regards <br>
      <b>Dan Johansen</b> <br>
      Project lead of the <b>Manjaro ARM</b> project<br>
      <a href="https://manjaro.org">Manjaro-ARM</a></div>
  </body>
</html>

--------------qam8XzETSyeChn9AtYkjmZzA--
