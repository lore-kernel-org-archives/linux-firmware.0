Return-Path: <SRS0=uw+e=WV=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F2DC43334
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Jun 2022 14:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F4F6C3411C; Tue, 14 Jun 2022 14:12:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE1C7C3411B;
	Tue, 14 Jun 2022 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE1C7C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so6325453wmq.0;
        Tue, 14 Jun 2022 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FTlMMTnnHIrLrkcmpjxH7Bq4yTU839hJPXGXJXIwnXA=;
        b=h4/zQpJit7/Vl42bslI73eCbtDMzQlAUzFW2LxrURyEChOvpjMfZcC5qeh93NLzobn
         vSq1S3EMF+EE0GG9HLtPYRASRNFTRCNsUg1Xxy19blsPl1uyTOdqX8dv7u+2Xis0Uzx4
         rIcnMgbyN29dCOyEyn7xdQXNGvyrvnu8m8kheyLxXYKtK6B7LvvSj6Bcjx9s/GVZFR9d
         autGeIqk5RmdAW8ho7JAJjzapoP/UpcJkzKUlsN4wZxQnsF/LxoyE7VvPUvcVeHEY7u5
         Ir5LD4k+Dp2Mo7WhIOgDcYfRacXhnVn1ViAMFwUMcy8YQW49DjHZxHtUCMUbAhQidV2s
         m1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FTlMMTnnHIrLrkcmpjxH7Bq4yTU839hJPXGXJXIwnXA=;
        b=6fAPEZNcxoxPqWD1PP4d4kFyuVv6nQLVPUMSAgiy1ULH8RM/XCuaha7aMW9VhjlyeG
         2F6onUO7bitXtZpx6FowfUm7eIhCqKLyOfhzQjzvBWFmjLo6rMHcs/1STw5aKVa3ylv1
         faFESO6gMwRqcjaxG4tXA8I+Rcc+tOefQ7Rd35Dm0cgbdC2oGrjFSO2xmH0DIl69X470
         XKjOgRzyPOmcq450QSE5kIV2verdUHdIhaZvdNO3WzjkPCnd+d0L+iQ7VlDKqVNOc3xB
         aT2DnF1KICicPxbxSuzPug7IPl/lP3TG74CR5HnSY/rxWEpYfzKZTl/EMCbARIFAelJW
         D2QA==
X-Gm-Message-State: AOAM5319lsutTgTeQn9nKFWH/33JaiDSvcFTjLHSY4l2obL83BZpFFgm
	niOA8Le715/rI1LEoOoUjXBLjzP+Vh0=
X-Google-Smtp-Source: ABdhPJx9hiNc6f0FCc3AQuUTU1j8i+wH3IWfVSdPAVmVSRt6N6HA4ft4FKHMzEbOz79roqY3EOaIdw==
X-Received: by 2002:a05:600c:4fcb:b0:39c:64cd:cc89 with SMTP id o11-20020a05600c4fcb00b0039c64cdcc89mr4382546wmq.197.1655215973811;
        Tue, 14 Jun 2022 07:12:53 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id c5-20020a05600c0a4500b0039c4ba160absm4697731wmq.2.2022.06.14.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 07:12:53 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2 1/2] Add initial AzureWave AW-CM256SM NVRAM file
Date: Tue, 14 Jun 2022 15:12:48 +0100
Message-Id: <20220614141249.3975556-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AzureWave AW-CM256SM wireless module is a WiFi/BT combo
module built using the Cypress CYW43455. Add an initial
NVRAM based on the one provided for the Beagle-AI which
contains this WiFi module. We can update/improve this easily
enough if we get a newer rev of the NVRAM later.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE                                 |  1 +
 brcm/brcmfmac43455-sdio.AW-CM256SM.txt | 66 ++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 brcm/brcmfmac43455-sdio.AW-CM256SM.txt

diff --git a/WHENCE b/WHENCE
index cc37751..084af41 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2963,6 +2963,7 @@ File: brcm/brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
+File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
diff --git a/brcm/brcmfmac43455-sdio.AW-CM256SM.txt b/brcm/brcmfmac43455-sdio.AW-CM256SM.txt
new file mode 100644
index 0000000..4ca98ee
--- /dev/null
+++ b/brcm/brcmfmac43455-sdio.AW-CM256SM.txt
@@ -0,0 +1,66 @@
+aa2g=1
+aa5g=1
+AvVmid_c0=0,157,1,126,1,126,1,126,1,126
+boardflags=0x00080201
+boardflags2=0x40000000
+boardflags3=0x48200100
+boardrev=0x1304
+boardtype=0x6e4
+deadman_to=481500000
+devid=0x43ab
+dot11agofdmhrbw202gpo=0x1553
+ed_thresh2g=-54
+ed_thresh5g=-54
+extpagain2g=2
+extpagain5g=2
+femctrl=0
+itrsw=1
+ltecxfnsel=0x22
+ltecxgcigpio=0x32
+ltecxmux=0
+ltecxpadnum=0x0504
+macaddr=00:90:4c:c5:12:38
+manfid=0x2d0
+maxp2ga0=64
+maxp5ga0=80,82,76,77
+mcsbw202gpo=0x99355533
+mcsbw205ghpo=0x99855000
+mcsbw205glpo=0x99755000
+mcsbw205gmpo=0x9df55000
+mcsbw405ghpo=0xd9755000
+mcsbw405glpo=0xb8555000
+mcsbw405gmpo=0xed955000
+mcsbw805ghpo=0xd9555000
+mcsbw805glpo=0xc8555000
+mcsbw805gmpo=0xe9555000
+muxenab=0x10
+nocrc=1
+ofdmlrbw202gpo=0x0033
+pa2ga0=-112,6296,-662
+pa2ga1=-165,3699,-515
+pa5ga0=-143,6016,-683,-141,6013,-678,-137,5988,-670,-136,5982,-670
+pa5ga1=-161,3544,-499,-166,3543,-497,-169,3569,-497,-171,3598,-498
+pdoffset2g40ma0=10
+pdoffset40ma0=0xaaaa
+pdoffset80ma0=0xaaaa
+prodid=0x06e4
+rxchain=1
+rxgains2gelnagaina0=0
+rxgains2gtrelnabypa0=0
+rxgains2gtrisoa0=0
+rxgains5gelnagaina0=0
+rxgains5gtrelnabypa0=0
+rxgains5gtrisoa0=0
+sromrev=11
+swctrlmap_2g=0x00040004,0x00020002,0x00040004,0x010a02,0x1ff
+swctrlmap_5g=0x00100010,0x00200020,0x00100010,0x010a02,0x2f4
+swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+tssipos2g=1
+tssipos5g=1
+tworangetssi2g=1
+tworangetssi5g=1
+txchain=1
+vcodivmode=1
+vendid=0x14e4
+xtalfreq=37400
-- 
2.36.1

