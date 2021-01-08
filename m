Return-Path: <SRS0=Pkw9=GL=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FFAC433E0
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 11:55:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 37C93239EB; Fri,  8 Jan 2021 11:55:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A650B2395B;
	Fri,  8 Jan 2021 11:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A650B2395B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wm1-f49.google.com with SMTP id r4so8164142wmh.5;
        Fri, 08 Jan 2021 03:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vdijOwPPO+haD88BXAenObzOuMfJAXte9/szjvTA7vE=;
        b=CmkMWwF6BkRq5xEzeSPa3svzkLvDYs0VS+XWGcsBNYOFMVcI0g4oAgkFNtM9W2B0Hr
         FbBX2dwmMMXHCTP+dSZcvBvuRFxatrn/lF8vs4AJjZvyZ7kERtZJ0+AGfL6HuXazY9EE
         3HMeXvXdT6kYrX7ZsQoCS+TT18Uv/6ShjIeL1AAii2fVrv9lwQsd7yoeoXAzwI+xn/7X
         NH3b6ChKGjYlXq/c30Wk8ZywZLeic1Qb9LKncXHQw7L13EXLOPnbHVndl3bI/VSL59j4
         ABTxbMuUSiHKpE89qXt6jXFagnR8ZyG6q6/eQh2NGxhyyzUsYKc6pLFsR8FhJgMSFJUI
         C3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vdijOwPPO+haD88BXAenObzOuMfJAXte9/szjvTA7vE=;
        b=nntRpR2km88FY8+MSI1K2FxP2OqokCkk0vFZMXy4F6g/wkjls4uD5X4Q8d4mKFPQ2H
         4m1e4RJ7tPLPmQZspz7N1OhqbZZlp+ZjzfHWq04qqmMXOTrtUsDqF7XKRA+GYV52Vhn2
         QDCG9+/Cum+6+K4SDwJ1UCBABBPtuF/+gDPyv8Zkx2T4SDRT4cu7bl8NkwG9qPGw9Sz4
         WtRfT7+wO0mF4v4DatRUKQ/wX4LNPIiIZNzJED3lynFmr1Xj3iv0sX9RPl8fiWfBNrQs
         y+E41YbO9aEq4wLp1BZ7fITEWOpNlr4zj4XsX++T7I3JjyrrA4DnffW7cZxn6DUKZF3I
         siDA==
X-Gm-Message-State: AOAM5339nH200Rm9/NaX/pkkTpgRTNfXm5q7KyolLPzLXl/1/V6yIN9F
	s8izuSaVkazVbN7j6EJm3wgBKdpxb9s=
X-Google-Smtp-Source: ABdhPJwRJBCKbUtIFvQYslg5Uxu30DckL+0CCDIY61grKEPY10YdpgVmIIlWXt2T/WCuL6qY7k+hWw==
X-Received: by 2002:a1c:5410:: with SMTP id i16mr2775740wmb.30.1610106920025;
        Fri, 08 Jan 2021 03:55:20 -0800 (PST)
Received: from morpheus.roving-it.com.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id l8sm14053964wrb.73.2021.01.08.03.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:55:19 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sahaj Sarup <sahaj.sarup@linaro.org>
Subject: [PATCH] brcm: Add NVRAM for Vamrs 96boards Rock960
Date: Fri,  8 Jan 2021 11:55:13 +0000
Message-Id: <20210108115513.740899-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 96boards Rock960 has a Cypress 4356 WiFi module, this adds the
a NVRAM based on the downstream NVRAM.

https://people.linaro.org/~manivannan.sadhasivam/rock960_wifi/brcmfmac4356-sdio.txt

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Sahaj Sarup <sahaj.sarup@linaro.org>
---
 WHENCE                                   |   1 +
 brcm/brcmfmac4356-sdio.vamrs,rock960.txt | 122 +++++++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 brcm/brcmfmac4356-sdio.vamrs,rock960.txt

diff --git a/WHENCE b/WHENCE
index 676bb18..2602e03 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2713,6 +2713,7 @@ Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sd
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
 File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
+File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
diff --git a/brcm/brcmfmac4356-sdio.vamrs,rock960.txt b/brcm/brcmfmac4356-sdio.vamrs,rock960.txt
new file mode 100644
index 0000000..4b38c26
--- /dev/null
+++ b/brcm/brcmfmac4356-sdio.vamrs,rock960.txt
@@ -0,0 +1,122 @@
+aa2g=3
+aa5g=3
+aga0=2
+aga1=2
+agbg0=2
+agbg1=2
+antswitch=0
+boardflags=0x02400201
+boardflags2=0x00802000
+boardflags3=0x0000010a
+boardrev=0x1121
+boardtype=0x073e
+cckbw202gpo=0x1222
+cckbw20ul2gpo=0x0000
+ccode=0x5855
+devid=0x43a3
+dot11agduphrpo=0x0
+dot11agduplrpo=0x0
+dot11agofdmhrbw202gpo=0x4444
+extpagain2g=2
+extpagain5g=2
+femctrl=10
+macaddr=00:90:4c:1a:10:01
+manfid=0x2d0
+maxp2ga0=72
+maxp2ga1=71
+maxp5ga0=69,70,69,68
+maxp5ga1=67,67,67,67
+mcsbw202gpo=0x9E644422
+mcsbw205ghpo=0xCC986663
+mcsbw205glpo=0xEEA86661
+mcsbw205gmpo=0xAAA86663
+mcsbw402gpo=0xE9744424
+mcsbw405ghpo=0xEEA86663
+mcsbw405glpo=0xEEB86663
+mcsbw405gmpo=0xECB86663
+mcsbw805ghpo=0xEEA86663
+mcsbw805glpo=0xEEB86663
+mcsbw805gmpo=0xEEA86663
+mcslr5ghpo=0x0000
+mcslr5glpo=0x0000
+mcslr5gmpo=0x0000
+muxenab=0x10
+nocrc=1
+ofdmlrbw202gpo=0x0022
+otpimagesize=502
+pa2ga0=-135,5769,-647
+pa2ga1=-143,6023,-677
+pa5ga0=-183,5746,-697,-172,5801,-685,-176,5707,-680,-180,5445,-659
+pa5ga1=-186,5543,-669,-193,5506,-675,-210,5282,-661,-199,5367,-665
+paprdis=0
+pdgain2g=4
+pdgain5g=4
+pdoffset40ma0=0x0000
+pdoffset40ma1=0x0000
+pdoffset80ma0=0x0000
+pdoffset80ma1=0x0000
+pdoffsetcckma0=0x4
+pdoffsetcckma1=0x4
+phycal_tempdelta=255
+rawtempsense=0x1ff
+regrev=1
+rssicorrnorm5g_c0=1,2,3,1,2,3,6,6,8,6,6,8
+rssicorrnorm5g_c1=1,2,3,2,2,2,7,7,8,7,7,8
+rssicorrnorm_c0=4,4
+rssicorrnorm_c1=4,4
+rxchain=3
+rxgains2gelnagaina0=0
+rxgains2gelnagaina1=0
+rxgains2gtrelnabypa0=0
+rxgains2gtrelnabypa1=0
+rxgains2gtrisoa0=7
+rxgains2gtrisoa1=7
+rxgains5gelnagaina0=0
+rxgains5gelnagaina1=0
+rxgains5ghelnagaina0=0
+rxgains5ghelnagaina1=0
+rxgains5ghtrelnabypa0=0
+rxgains5ghtrelnabypa1=0
+rxgains5ghtrisoa0=12
+rxgains5ghtrisoa1=11
+rxgains5gmelnagaina0=0
+rxgains5gmelnagaina1=0
+rxgains5gmtrelnabypa0=0
+rxgains5gmtrelnabypa1=0
+rxgains5gmtrisoa0=13
+rxgains5gmtrisoa1=11
+rxgains5gtrelnabypa0=0
+rxgains5gtrelnabypa1=0
+rxgains5gtrisoa0=11
+rxgains5gtrisoa1=10
+sb20in40hrpo=0x0
+sb20in40lrpo=0x0
+sb20in80and160hr5ghpo=0x0
+sb20in80and160hr5glpo=0x0
+sb20in80and160hr5gmpo=0x0
+sb20in80and160lr5ghpo=0x0
+sb20in80and160lr5glpo=0x0
+sb20in80and160lr5gmpo=0x0
+sb40and80hr5ghpo=0x0
+sb40and80hr5glpo=0x0
+sb40and80hr5gmpo=0x0
+sb40and80lr5ghpo=0x0
+sb40and80lr5glpo=0x0
+sb40and80lr5gmpo=0x0
+sromrev=11
+subband5gver=0x4
+swctrlmap_2g=0x00001040,0x00004010,0x00004010,0x200010,0xff
+swctrlmap_5g=0x00000202,0x00000101,0x00000101,0x000000,0x47
+swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+tempoffset=255
+temps_hysteresis=15
+temps_period=15
+tempthresh=255
+tssipos2g=1
+tssipos5g=1
+tworangetssi2g=0
+tworangetssi5g=0
+txchain=3
+vendid=0x14e4
+xtalfreq=37400
-- 
2.29.2

