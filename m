Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7F9C7EE45
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0DA4C4339B; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 818D3C4339E;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=c6UuZ36d8OiabrrHgPOBZYQw3oZgnMXCN/PUfwZ7sPc=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=aIWx4FZYZQscvhIazgPa85d9TUnq32uidHWuf+pril0ASQKzn4t0sRIda+JnPs8a+
	 BX9M8uNsdJDMutZGgOR6h0D525rtjDnCBnUQ3DNx10EyAnys3WXioNExZv+6YqCXul
	 ZYBPi073d9JNbhIjlK5wi7nRll0ozDQA10LVOW4mpjyHFvZHAEOPt6bppyh75W6hqU
	 5dWVR65sucp1Rj3EQxNh/AtI1FybeyZmPeDsDxYvlXMlOcCz6phwikXRr8NdhOEPS4
	 jdhdesbWUCcYWtCd+BPvylC7s/i/AMd11E9KvVhTHcSXs4aScDYuluLdynvKOqDqsQ
	 5Jo5wink1OCSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1DFC7EE2F;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:17 +0000
Subject: [PATCH RESEND v2 03/16] check_whence, WHENCE, copy-firmware:
 escape filenames with spaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-3-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=4045;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=Sb2gdykaMauBYEvNG+HdSFH39+KPWGoLA26M3Nsel4w=;
 b=1zMcXgW0tw6rp5lklgvxwDc5PaaA26gMW3VsAvMcqQv1GOaogtX9imBmXXUE1w5s07s194P58
 tYqDMjTqpEGAV07QYDiHc+mW3NOYALohBkgv/6M/pPSZCnG3My+KFFS
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

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
index d4654dd..214952e 100644
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

