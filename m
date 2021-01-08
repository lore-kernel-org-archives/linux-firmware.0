Return-Path: <SRS0=T4X3=GL=linaro.org=manivannan.sadhasivam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59318C433E0
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 11:58:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2315A239FF; Fri,  8 Jan 2021 11:58:46 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E918B239FE
	for <linux-firmware@kernel.org>; Fri,  8 Jan 2021 11:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E918B239FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=manivannan.sadhasivam@linaro.org
Received: by mail-pj1-f47.google.com with SMTP id b5so6037457pjl.0
        for <linux-firmware@kernel.org>; Fri, 08 Jan 2021 03:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k9+yjNnD0jgOp+Je02/RwFzHkfd1/RSzNBrAnItNBFQ=;
        b=DeGHT9Bpg0c+Pju7RP1rQmfOPk/sycjygMsURMDUX/kYaDb64ZODP+Mf7a+auetd2P
         kiR+dhMOOg/xd26lxzYsJmvI1lWhoaXZeFRoXvuMWN2G8XYVlY1J61iTMAvyLHzy1qL5
         W0FF7HcR/K6Tan7cmm94NhqROAzEM3gjmHbLDIJkgZik9GS1BwIAFTPveknXjW2s3Wlj
         jb73NQO8BUA8CRAWkqG+VohIbpQ2Gy0/Gun7+yVhcVUosQlugTtf940DyiGxw3C/JHsW
         3Z2tLyKqPf9NxqIensrUbe0Dtbk9aqfxpEKp23KDgqkL2PvxIZwyuMWPq6h8Y7Z7I6Jq
         Zaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k9+yjNnD0jgOp+Je02/RwFzHkfd1/RSzNBrAnItNBFQ=;
        b=aTZAjvhfi4UvpRk0Ypr4qKqVfsJCZ2kvJbNswQy5XhB0Upzzr245wdpTgIsmSfrugW
         aVllwOKvSgFNCf08z0g1281qEY3i8aD4X3456kkB71e37sN0j4NX2b5poqLSDpQOUcfi
         gZUQm1OhvBD9Irk0FdwB0IFRAonPSJn5akT6s60l+aEH9KmCKCdJrQRTkn1BSBf+V/Cn
         vT+KN6Ex4n/GXhKE+e3J3gRb5SaCRq6pWs4pU0mDBUBXjtlFRuEboyipSmoWbdGbfA3N
         KFgzx/GPcdpEi61VYrEkM0c+ytTDXonTbOiCIgdeJl2xzm1tZjri6YHf1qj1DIG4/2rR
         8rpw==
X-Gm-Message-State: AOAM5319naoiokp6Djf3kcFx5OjTv9uAppGGOLddUwgOw4Ljbcyd5IKh
	4hO/0BsANDvUHjTaq/67l0PO
X-Google-Smtp-Source: ABdhPJxW4Npz7aqg9qBRahDCVtkXg5UghMM6uypv4jVnrNvXWtXCMuqSK7MHqvAhJ2UdN9Oe2CF2Vg==
X-Received: by 2002:a17:90a:7e90:: with SMTP id j16mr3340369pjl.163.1610107125046;
        Fri, 08 Jan 2021 03:58:45 -0800 (PST)
Received: from thinkpad ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id c5sm10191445pgt.73.2021.01.08.03.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:58:44 -0800 (PST)
Date: Fri, 8 Jan 2021 17:28:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
	Sahaj Sarup <sahaj.sarup@linaro.org>
Subject: Re: [PATCH] brcm: Add NVRAM for Vamrs 96boards Rock960
Message-ID: <20210108115840.GB74017@thinkpad>
References: <20210108115513.740899-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108115513.740899-1-pbrobinson@gmail.com>

On Fri, Jan 08, 2021 at 11:55:13AM +0000, Peter Robinson wrote:
> The 96boards Rock960 has a Cypress 4356 WiFi module, this adds the
> a NVRAM based on the downstream NVRAM.
> 
> https://people.linaro.org/~manivannan.sadhasivam/rock960_wifi/brcmfmac4356-sdio.txt
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Sahaj Sarup <sahaj.sarup@linaro.org>
> ---
>  WHENCE                                   |   1 +
>  brcm/brcmfmac4356-sdio.vamrs,rock960.txt | 122 +++++++++++++++++++++++
>  2 files changed, 123 insertions(+)
>  create mode 100644 brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> 
> diff --git a/WHENCE b/WHENCE
> index 676bb18..2602e03 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2713,6 +2713,7 @@ Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sd
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> +File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
>  
>  Licence: GPLv2. See GPL-2 for details.
>  
> diff --git a/brcm/brcmfmac4356-sdio.vamrs,rock960.txt b/brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> new file mode 100644
> index 0000000..4b38c26
> --- /dev/null
> +++ b/brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> @@ -0,0 +1,122 @@
> +aa2g=3
> +aa5g=3
> +aga0=2
> +aga1=2
> +agbg0=2
> +agbg1=2
> +antswitch=0
> +boardflags=0x02400201
> +boardflags2=0x00802000
> +boardflags3=0x0000010a
> +boardrev=0x1121
> +boardtype=0x073e
> +cckbw202gpo=0x1222
> +cckbw20ul2gpo=0x0000
> +ccode=0x5855
> +devid=0x43a3
> +dot11agduphrpo=0x0
> +dot11agduplrpo=0x0
> +dot11agofdmhrbw202gpo=0x4444
> +extpagain2g=2
> +extpagain5g=2
> +femctrl=10
> +macaddr=00:90:4c:1a:10:01
> +manfid=0x2d0
> +maxp2ga0=72
> +maxp2ga1=71
> +maxp5ga0=69,70,69,68
> +maxp5ga1=67,67,67,67
> +mcsbw202gpo=0x9E644422
> +mcsbw205ghpo=0xCC986663
> +mcsbw205glpo=0xEEA86661
> +mcsbw205gmpo=0xAAA86663
> +mcsbw402gpo=0xE9744424
> +mcsbw405ghpo=0xEEA86663
> +mcsbw405glpo=0xEEB86663
> +mcsbw405gmpo=0xECB86663
> +mcsbw805ghpo=0xEEA86663
> +mcsbw805glpo=0xEEB86663
> +mcsbw805gmpo=0xEEA86663
> +mcslr5ghpo=0x0000
> +mcslr5glpo=0x0000
> +mcslr5gmpo=0x0000
> +muxenab=0x10
> +nocrc=1
> +ofdmlrbw202gpo=0x0022
> +otpimagesize=502
> +pa2ga0=-135,5769,-647
> +pa2ga1=-143,6023,-677
> +pa5ga0=-183,5746,-697,-172,5801,-685,-176,5707,-680,-180,5445,-659
> +pa5ga1=-186,5543,-669,-193,5506,-675,-210,5282,-661,-199,5367,-665
> +paprdis=0
> +pdgain2g=4
> +pdgain5g=4
> +pdoffset40ma0=0x0000
> +pdoffset40ma1=0x0000
> +pdoffset80ma0=0x0000
> +pdoffset80ma1=0x0000
> +pdoffsetcckma0=0x4
> +pdoffsetcckma1=0x4
> +phycal_tempdelta=255
> +rawtempsense=0x1ff
> +regrev=1
> +rssicorrnorm5g_c0=1,2,3,1,2,3,6,6,8,6,6,8
> +rssicorrnorm5g_c1=1,2,3,2,2,2,7,7,8,7,7,8
> +rssicorrnorm_c0=4,4
> +rssicorrnorm_c1=4,4
> +rxchain=3
> +rxgains2gelnagaina0=0
> +rxgains2gelnagaina1=0
> +rxgains2gtrelnabypa0=0
> +rxgains2gtrelnabypa1=0
> +rxgains2gtrisoa0=7
> +rxgains2gtrisoa1=7
> +rxgains5gelnagaina0=0
> +rxgains5gelnagaina1=0
> +rxgains5ghelnagaina0=0
> +rxgains5ghelnagaina1=0
> +rxgains5ghtrelnabypa0=0
> +rxgains5ghtrelnabypa1=0
> +rxgains5ghtrisoa0=12
> +rxgains5ghtrisoa1=11
> +rxgains5gmelnagaina0=0
> +rxgains5gmelnagaina1=0
> +rxgains5gmtrelnabypa0=0
> +rxgains5gmtrelnabypa1=0
> +rxgains5gmtrisoa0=13
> +rxgains5gmtrisoa1=11
> +rxgains5gtrelnabypa0=0
> +rxgains5gtrelnabypa1=0
> +rxgains5gtrisoa0=11
> +rxgains5gtrisoa1=10
> +sb20in40hrpo=0x0
> +sb20in40lrpo=0x0
> +sb20in80and160hr5ghpo=0x0
> +sb20in80and160hr5glpo=0x0
> +sb20in80and160hr5gmpo=0x0
> +sb20in80and160lr5ghpo=0x0
> +sb20in80and160lr5glpo=0x0
> +sb20in80and160lr5gmpo=0x0
> +sb40and80hr5ghpo=0x0
> +sb40and80hr5glpo=0x0
> +sb40and80hr5gmpo=0x0
> +sb40and80lr5ghpo=0x0
> +sb40and80lr5glpo=0x0
> +sb40and80lr5gmpo=0x0
> +sromrev=11
> +subband5gver=0x4
> +swctrlmap_2g=0x00001040,0x00004010,0x00004010,0x200010,0xff
> +swctrlmap_5g=0x00000202,0x00000101,0x00000101,0x000000,0x47
> +swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
> +swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
> +tempoffset=255
> +temps_hysteresis=15
> +temps_period=15
> +tempthresh=255
> +tssipos2g=1
> +tssipos5g=1
> +tworangetssi2g=0
> +tworangetssi5g=0
> +txchain=3
> +vendid=0x14e4
> +xtalfreq=37400
> -- 
> 2.29.2
> 
