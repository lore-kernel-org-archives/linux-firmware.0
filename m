Return-Path: <SRS0=9nsJ=UN=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F37AC433EF
	for <linux-firmware@archiver.kernel.org>; Sun,  3 Apr 2022 16:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46A7DC340F3; Sun,  3 Apr 2022 16:19:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 898FAC340F2;
	Sun,  3 Apr 2022 16:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 898FAC340F2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id ot30so5422009ejb.12;
        Sun, 03 Apr 2022 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aaX3+5G6f0ExdTR+7537BtEOrfS6WJOtq60cOAED05o=;
        b=GhqctoEQlG7/nGbYMkDENidU8h/BYZLB733bfumjG6R79sm1O+38KW12bTznnPW36T
         qZXxkHLpKpDCHq+Bi6ly9radi5sti/TBVpC0pxn/RV6JOF/7yB2wo5dpCkScYrMlgh4d
         Eq03djmo/PYEFn7sBel0BUp+9KykL2P6k5VFz4B4O0hBOBm3WR2iXQFBcY0gwhkJRMqP
         gMFjIFagyPFihpYWV0KDV9H3+d4fLisTIMZmXAXtnj5xAYNrwHpJLzOyyGIpoDMvcPBu
         2gVIBah+3bBJlMK8efCtHZMvGO44QdiScZrZXLCGQjp2TicIVhhMDvrzagiwfw97XXF6
         NuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aaX3+5G6f0ExdTR+7537BtEOrfS6WJOtq60cOAED05o=;
        b=NkXI1B4sPTaO8zPI5ETjvperSPlH4phMOASr3Omv64d1ME4y7wRpTqs8Y+VqDVXI1k
         uFlq6MIgawJ0HRKqNieXnUIaGzRGTNdckWg2QlXy90/5UpYRNOx4u8UZExMuS5AZBtwW
         f7d6rCmyNEtd8lAbk0Cog8VSKF/4c7gqiBhpMY6+zgcRMLS+VN42yhe63uVXZd4kO5PI
         pMg77LNN8EYgURRf4zjmh+v48DGmcHuaQaMUBp/h8CaHKOph+ppGqqAmOwkv36ukH4M5
         fZYYAbHWHuHfM4dnbp9ocZ8Sa0Jf9z/4ZMXFf8zmM0jqt81Lp/O1LJmsg40sRAveD84Z
         AX3Q==
X-Gm-Message-State: AOAM5316XQu5yKbGKCiyBHTG8e8Jcxh2b2jxminOjd7lykITISjqQ2T7
	2Eg3bDnGSJNBYSpjY5dxLdV+8+AHANo=
X-Google-Smtp-Source: ABdhPJxfCyXI/lJ/fbvenZfbd53PmRtwN6FCPvOwBhRA8U+Wc5AfwLVF6lEpco7Cdu5VINT6t8zK2w==
X-Received: by 2002:a17:906:dc89:b0:6db:a789:7563 with SMTP id cs9-20020a170906dc8900b006dba7897563mr7402317ejc.471.1649002786790;
        Sun, 03 Apr 2022 09:19:46 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id q22-20020a170906771600b006cf8a37ebf5sm3381904ejm.103.2022.04.03.09.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 09:19:46 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] brcm: rename Rock960 NVRAM to AP6356S and link devices to it
Date: Sun,  3 Apr 2022 17:19:34 +0100
Message-Id: <20220403161934.979471-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rock960, VIM2 and Firefly3399 all have a AP6356S WiFi module
and their NVRAM all appear to be the same so call the NVRAM after
the AP module and link the 3 devices to that to make it clear.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE                                                      | 6 ++++--
 ...sdio.vamrs,rock960.txt => brcmfmac4356-sdio.AP6356S.txt} | 0
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename brcm/{brcmfmac4356-sdio.vamrs,rock960.txt => brcmfmac4356-sdio.AP6356S.txt} (100%)

diff --git a/WHENCE b/WHENCE
index 8f37cc3..b0d423a 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3012,8 +3012,10 @@ Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\
 Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
 File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
-File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
-Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.vamrs,rock960.txt
+File: brcm/brcmfmac4356-sdio.AP6356S.txt
+Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6356S.txt
+Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
+Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
diff --git a/brcm/brcmfmac4356-sdio.vamrs,rock960.txt b/brcm/brcmfmac4356-sdio.AP6356S.txt
similarity index 100%
rename from brcm/brcmfmac4356-sdio.vamrs,rock960.txt
rename to brcm/brcmfmac4356-sdio.AP6356S.txt
-- 
2.35.1

