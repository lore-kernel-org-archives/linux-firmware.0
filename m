Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75CEC636CC
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90735C433EF; Sat, 18 Feb 2023 18:46:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87EFBC433D2
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87EFBC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id c12so1152231wrx.12
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtFQ/Rl2wRQYTwJcMOdfskXFBmjFZDC54S/TyEN2Ois=;
        b=THMyHvkB/lRRf0OXm5FJtDtxxCWk8sn5Igdd6Cb6MyZ3a+KLJpyqS7MqU6ZQSKI3qO
         ibeCwV3x7AHV60w8JSnpIrov9Fshf86B/bA7tAJ7O2Tuk6pUgdVFwci6nAIKpEIbN8fh
         INWtGiv+igPmvT98exr7ZlrKN0eesueK6tgtr5Mr1sDj0eFF+08sCAUDrWyFcAwcB1aN
         U+7cBxCLnhO3VqOccKrdyoLYisuhmQO4ifmHXvDKOzfKSq5EcZpSUTKKBRDSrUqeVXti
         iRtlClx+GEmkKvDNOtCW9VCYTSv1uEGvazSl6A57NesBbtsQ9eyzgBo7Jhh1OkZQDGZe
         miFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtFQ/Rl2wRQYTwJcMOdfskXFBmjFZDC54S/TyEN2Ois=;
        b=WhpP/PGT7d/lVUtGDQAeae3qjlpdKU1j++HOsOOEUI1uYECex8sQHFP6B1JZfDlyB6
         cV6fb74QEPTht7DK4gxsNRdmyPsMyRCrS++aRdzEXRI5qOuaTqkRzYDr9wXmaKOBx8/K
         BdLLk0ncoAWgZNRQ226xuzYTcEzvvF5Y2YdZcuHdgG2PnsHfmMcf561AeEvFYS31rBss
         r81/dKxY54Rzp0GsHFNHLuL/DN0nZBliaGF0ew+maf925/zCx5ggkx9lBfPziwmEX7ZX
         9D8eYmsN8Tm0xyIyOi6IccrrmoFEx6USahSKBNJJA4686vWRsmxxvbIN9XELt1l1b77Z
         75hw==
X-Gm-Message-State: AO0yUKWk0/Wb1WBtHc290xZjb3YQ6dfQCRBvB7Oim/UmtkRA7/6MABwu
	7HPfbRn30X3OnE9DAyKFZF3KD+rx6Jc=
X-Google-Smtp-Source: AK7set9VMtYLP4GRJxweZwL2CC2DZhu812b919yYawIGeT5wcacC8PBYnJiMl9KLW/J9edO7Tpo/iw==
X-Received: by 2002:a5d:6691:0:b0:2c5:7c26:c2cc with SMTP id l17-20020a5d6691000000b002c57c26c2ccmr8094310wru.29.1676745987547;
        Sat, 18 Feb 2023 10:46:27 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id d3-20020adff2c3000000b002c56046a3b5sm7561106wrp.53.2023.02.18.10.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:27 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 03/15] check_whence, WHENCE, copy-firmware: escape filenames with spaces
Date: Sat, 18 Feb 2023 18:46:09 +0000
Message-Id: <20230218184621.2026504-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have a handful of instances which have space in the filename - just
escape them (like we do for the symlinks) and drop the extra re pattern.

With this we can also drop the extra sed pattern, stripping out the
quotation marks.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 WHENCE           | 10 +++++-----
 check_whence.py  |  8 ++------
 copy-firmware.sh |  2 +-
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/WHENCE b/WHENCE
index fe5e423..13013f8 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2690,9 +2690,9 @@ Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypress/cyfmac54591-pcie.clm_blob
 
 Licence: Redistributable. See LICENCE.cypress for details.
 
-File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
+File: brcm/brcmfmac43241b4-sdio.Intel\ Corp.-VALLEYVIEW\ C0\ PLATFORM.txt
 File: brcm/brcmfmac4330-sdio.Prowise-PT301.txt
-File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
+File: brcm/brcmfmac43340-sdio.ASUSTeK\ COMPUTER\ INC.-TF103CE.txt
 File: brcm/brcmfmac43340-sdio.meegopad-t08.txt
 File: brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt
 File: brcm/brcmfmac43340-sdio.predia-basic.txt
@@ -2703,7 +2703,7 @@ Link: brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.txt -> brcmfmac43362-sdio.WC1
 Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdio.cubietech,cubietruck.txt
 File: brcm/brcmfmac43430a0-sdio.ilife-S806.txt
 File: brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt
-File: "brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt"
+File: brcm/brcmfmac43430a0-sdio.ONDA-V80\ PLUS.txt
 File: brcm/brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
@@ -2724,9 +2724,9 @@ Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sd
 File: brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
-File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
+File: brcm/brcmfmac43455-sdio.MINIX-NEO\ Z83-4.txt
 File: brcm/brcmfmac4356-pcie.gpd-win-pocket.txt
-File: "brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
+File: brcm/brcmfmac4356-pcie.Xiaomi\ Inc-Mipad2.txt
 File: brcm/brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
diff --git a/check_whence.py b/check_whence.py
index 8805e99..f347f0e 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -6,13 +6,9 @@ from io import open
 def list_whence():
     with open('WHENCE', encoding='utf-8') as whence:
         for line in whence:
-            match = re.match(r'(?:File|Source):\s*"(.*)"', line)
+            match = re.match(r'(?:File|Source):\s*(.*)', line)
             if match:
-                yield match.group(1)
-                continue
-            match = re.match(r'(?:File|Source):\s*(\S*)', line)
-            if match:
-                yield match.group(1)
+                yield match.group(1).replace("\ ", " ")
                 continue
             match = re.match(r'Licen[cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n',
                              line)
diff --git a/copy-firmware.sh b/copy-firmware.sh
index bbacb92..6bceef3 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -31,7 +31,7 @@ while test $# -gt 0; do
     esac
 done
 
-grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
+grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
     test -f "$f" || continue
     $verbose "copying file $f"
     install -d $destdir/$(dirname "$f")
-- 
2.39.2

