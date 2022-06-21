Return-Path: <SRS0=E7Vh=W4=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EF8C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jun 2022 15:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 133C9C341C0; Tue, 21 Jun 2022 15:51:52 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FA24C3411C;
	Tue, 21 Jun 2022 15:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FA24C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id bb7so3940498vkb.9;
        Tue, 21 Jun 2022 08:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HRsGWI9/VDWQDVHe6O1h9IWL2dYqcpuyqklEcMHS8Go=;
        b=kcIdzELUQrVwPHUTGNwOa6jGhUo4QlqLneqRlFxUnTuP8jtxZzWTcCSvOw6JZqpmRt
         KnhSoLBbvqEop9QWiHAA6mDrTeOfknwKWfKGJLeu6gbBNKw/P4C/4HevSCxdGjv2MZWg
         Ax5DLmLWL1xoECRMPMa6gPegMkqDl3t+eihvcLEJOvd8LpGgC//czeBfmOCM8NJpJuN5
         sg14F3bdxYivDQGmelpBz0BttSIEbTUeJEtx2/KYI5ruUuMBKlSgz+IPtJNhjsInReg8
         q80BPpto0HmNRfu0LIdzxMk3OfQ7jfmPo6vAprxyF959d2QBz/8ajw6Rc9U3BwCxnGf+
         MO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HRsGWI9/VDWQDVHe6O1h9IWL2dYqcpuyqklEcMHS8Go=;
        b=JI6WKxuKuXtmSqW+I0Of+7GBZwQvg+TCLXkvlWPdjsPhfB9l/ialTRvBxT5aP8EYRV
         FWH/tWhTFNFWBGYRBeJGAADJMKLI8c2KpSb2qRAsdEU0MPBFWG7vJJqOEC/iQSn814W8
         2dWi7YfrT+hEwoUzrezhltfqJsUaC6pUVT+3D51Yq0a3pKugq/ZslCOxA9okANcqJDcR
         CKMCf3Xby+7Hf48NW3BufEocWP5NJn2fWtNKaH8EJNIO6UXAOnhYpQ2UmtTFy8wN5qkz
         GlDzD+YIElLaUqytCnSnHLWJt8Eh0NVtisK5bdAAF7EAjlukrpaH5FxCy6T5HdhgcQ8Q
         Uabw==
X-Gm-Message-State: AJIora8a8zapY3WuOASGl8lQGP0tD3bgBMEOUpNY5yT5foXUj6+Bu3kX
	EhNnJz33p5WyIiGM/rwW/Vd4L/ejPz4fdNfSJaMjjtHW
X-Google-Smtp-Source: AGRyM1t8zEXAQDKiuegB4r+NnKS5YFW6sZ4NjJDf0C2LHx1bs9OXZ87DAtLGH7mSCxEA0KfLMuL9pgTY8sWWeoI6FE0=
X-Received: by 2002:a1f:738a:0:b0:36c:4f03:b0ec with SMTP id
 o132-20020a1f738a000000b0036c4f03b0ecmr2943746vkc.18.1655826710011; Tue, 21
 Jun 2022 08:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220610114051.2663502-1-strit@manjaro.org> <CA+5PVA5eYmZhCN_E=ZxzEo2uEoNG4m3HKmH-XN6JpNyUCwQB+A@mail.gmail.com>
In-Reply-To: <CA+5PVA5eYmZhCN_E=ZxzEo2uEoNG4m3HKmH-XN6JpNyUCwQB+A@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 21 Jun 2022 16:51:38 +0100
Message-ID: <CALeDE9NdQ=XuwDreZPX7jXkO_a5nsvB35Avf3DPoBdCJy5engQ@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add NVRAM file for Pinebook Pro from Pine64
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dan Johansen <strit@manjaro.org>, Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 2:12 PM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Peter, is this going to have the same problem that the Quartz patch had?

Yes, but it's also covered by my 2/2 patch that links a few devices in
the other thread.

P

> josh
>
> On Fri, Jun 10, 2022 at 7:43 AM Dan Johansen <strit@manjaro.org> wrote:
>>
>> This file is based on the existing "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt" NVRAM file.
>> Also update the WHENCE file.
>>
>> The new batch of Pine64 Pinebook Pro ships with a new wifi/bt module, that uses this firmware, so add the config file to get it detected.
>>
>> Signed-off-by: Dan Johansen <strit@manjaro.org>
>> ---
>>  WHENCE                                        |  1 +
>>  ...brcmfmac43455-sdio.pine64,pinebook-pro.txt | 83 +++++++++++++++++++
>>  2 files changed, 84 insertions(+)
>>  create mode 100644 brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
>>
>> diff --git a/WHENCE b/WHENCE
>> index 776dd8b..853bed6 100644
>> --- a/WHENCE
>> +++ b/WHENCE
>> @@ -2952,6 +2952,7 @@ File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>>  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>>  File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
>> +File: "brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt"
>>  File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
>>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>> diff --git a/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt b/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
>> new file mode 100644
>> index 0000000..83ca9f4
>> --- /dev/null
>> +++ b/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.
>> +# NVRAM config file for the BCM43455 WiFi/BT chip as found on the
>> +# Pine64 Pinebook Pro
>> +aa2g=1
>> +aa5g=1
>> +AvVmid_c0=1,165,2,100,2,100,2,100,2,100
>> +boardflags=0x00480201
>> +boardflags2=0x40800000
>> +boardflags3=0x44200100
>> +boardrev=0x1304
>> +boardtype=0x6e4
>> +btc_mode=1
>> +btc_params1=0x7530
>> +btc_params8=0x4e20
>> +btc_params50=0x972c
>> +cbfilttype=1
>> +cckPwrIdxCorr=3
>> +cckTssiDelay=150
>> +deadman_to=481500000
>> +devid=0x43ab
>> +dot11agofdmhrbw202gpo=0x4442
>> +dot11b_opts=0x3aa85
>> +ed_thresh2g=-54
>> +ed_thresh5g=-54
>> +eu_edthresh2g=-54
>> +eu_edthresh5g=-54
>> +extpagain2g=2
>> +extpagain5g=2
>> +fdsslevel_ch11=6
>> +femctrl=0
>> +itrsw=1
>> +ldo1=4
>> +ltecxfnsel=0x22
>> +ltecxgcigpio=0x32
>> +ltecxmux=0
>> +ltecxpadnum=0x0504
>> +macaddr=b8:27:eb:74:f2:6c
>> +manfid=0x2d0
>> +maxp2ga0=80
>> +maxp5ga0=82,82,82,82
>> +mcsbw202gpo=0x98444422
>> +mcsbw205ghpo=0xb9555000
>> +mcsbw205glpo=0xb9555000
>> +mcsbw205gmpo=0xb9555000
>> +mcsbw402gpo=0x98444422
>> +mcsbw405ghpo=0xb9555000
>> +mcsbw405glpo=0xb9555000
>> +mcsbw405gmpo=0xb9555000
>> +mcsbw805ghpo=0xb9555000
>> +mcsbw805glpo=0xb9555000
>> +mcsbw805gmpo=0xb9555000
>> +nocrc=1
>> +ofdmlrbw202gpo=0x0022
>> +ofdmTssiDelay=150
>> +pa2ga0=-129,6525,-718
>> +pa2ga1=-149,4408,-601
>> +pa5ga0=-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818
>> +pa5ga1=-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575
>> +pdoffset2g40ma0=16
>> +pdoffset2gperchan=0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0
>> +pdoffset40ma0=0x8888
>> +pdoffset80ma0=0x8888
>> +pdoffsetcckma0=2
>> +phycal_tempdelta=15
>> +prodid=0x06e4
>> +rawtempsense=0x1ff
>> +rxchain=1
>> +sromrev=11
>> +swctrlmap_2g=0x00000000,0x00000000,0x00000000,0x010000,0x3ff
>> +swctrlmap_5g=0x00100010,0x00200020,0x00200020,0x010000,0x3fe
>> +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x3
>> +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x3
>> +tssipos2g=1
>> +tssipos5g=1
>> +tworangetssi2g=1
>> +tworangetssi5g=1
>> +txchain=1
>> +txpwr2gAdcScale=1
>> +txpwr5gAdcScale=1
>> +vcodivmode=1
>> +vendid=0x14e4
>> +xtalfreq=37400
>> --
>> 2.36.1
>>
