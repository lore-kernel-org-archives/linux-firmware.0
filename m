Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F86FCF9C69
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DFC5C4CED3; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43C79C4CEC4;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=JJQZsLxIwpK+uEf1Kt1pXXhIXdzXaNYM11zbD2R9jlw=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=aNcqYyxenePvozte5f5R6yq6nZKxiWvleHZtZyaIJnMUG9lLW1Je9ffcb2rPy3mFb
	 gi1ITXK3ZmUizUHlKWfcE5Myf8/c71hFu467zS0OAlKsO2wDVVTOnzEiqMSM5AwE2u
	 /r/0edJXOwiRMONrew3WiTbiPM58+vhsJtEvn2+d7hcW5MkumoFhGcYgt1uRl13Y87
	 h75TUFl4gyGdD45V3U3WShh6Y0ZPv2XDywASWL2OzAHlMr2gPKFzINtzrrSSyjCEAW
	 s2TwjMA3aYd644cI/5OEzUWvXZQx0PF5PSMY/H06zhQbjFTHk0tMOni/MglbXdU6YX
	 Wz5Ze5/25MGhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334BACF9C6D;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:37 +0100
Subject: [PATCH 02/16] check_whence.py: ban link-to-a-link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-2-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=4783;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=fwZ5y6AcxnsoTmd7DtNEw+JSyG0gCAbE2uaB5KQoh94=;
 b=MH433sLyYbm87VhQrDa7W2GjgBq9rYRgIOpfdaunfFe2OZEt00eepBkjtOvOwUMrCTmcV/+Za
 KpBcKfnk5UHDIBhFVIVyFSMxIzn7JgN5mm3DL1tfhPkI2DBQMe091oH
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Using link-to-a-link is a bad idea since it reduces legibility and any
changes to the rook link also change the leaf. Where the latter may be
undesired.

We have a couple of instances in-tree, so fix them up and ban

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 WHENCE          | 14 +++++++-------
 check_whence.py | 12 ++++++++++--
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/WHENCE b/WHENCE
index 3897121a115e185cc36e782b33ef66e43d87d557..6af1a97e2672922f2a3a1fcf0306b158eae1b6f7 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3686,7 +3686,7 @@ File: ath10k/WCN3990/hw1.0/qcm2290/wlanmdsp.mbn
 Version: WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
 Link: ath10k/WCN3990/hw1.0/qrb4210/wlanmdsp.mbn -> ../qcm2290/wlanmdsp.mbn
 Link: qcom/qcm2290/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/qcm2290/wlanmdsp.mbn
-Link: qcom/qrb4210/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/qrb4210/wlanmdsp.mbn
+Link: qcom/qrb4210/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/qcm2290/wlanmdsp.mbn
 File: ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin
 Link: ath10k/WCN3990/hw1.0/qrb4210/firmware-5.bin -> ../qcm2290/firmware-5.bin
 
@@ -5214,11 +5214,11 @@ Link: nvidia/gp104/acr/bl.bin -> ../../gp102/acr/bl.bin
 Link: nvidia/gp104/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
 Link: nvidia/gp104/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
 Link: nvidia/gp104/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
-Link: nvidia/gp104/gr/fecs_bl.bin -> ../../gp102/gr/fecs_bl.bin
+Link: nvidia/gp104/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
 File: nvidia/gp104/gr/fecs_data.bin
 File: nvidia/gp104/gr/fecs_inst.bin
 File: nvidia/gp104/gr/fecs_sig.bin
-Link: nvidia/gp104/gr/gpccs_bl.bin -> ../../gp102/gr/gpccs_bl.bin
+Link: nvidia/gp104/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
 File: nvidia/gp104/gr/gpccs_data.bin
 File: nvidia/gp104/gr/gpccs_inst.bin
 File: nvidia/gp104/gr/gpccs_sig.bin
@@ -5237,11 +5237,11 @@ Link: nvidia/gp106/acr/bl.bin -> ../../gp102/acr/bl.bin
 Link: nvidia/gp106/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
 Link: nvidia/gp106/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
 Link: nvidia/gp106/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
-Link: nvidia/gp106/gr/fecs_bl.bin -> ../../gp102/gr/fecs_bl.bin
+Link: nvidia/gp106/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
 File: nvidia/gp106/gr/fecs_data.bin
 Link: nvidia/gp106/gr/fecs_inst.bin -> ../../gp102/gr/fecs_inst.bin
 File: nvidia/gp106/gr/fecs_sig.bin
-Link: nvidia/gp106/gr/gpccs_bl.bin -> ../../gp102/gr/gpccs_bl.bin
+Link: nvidia/gp106/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
 File: nvidia/gp106/gr/gpccs_data.bin
 Link: nvidia/gp106/gr/gpccs_inst.bin -> ../../gp102/gr/gpccs_inst.bin
 File: nvidia/gp106/gr/gpccs_sig.bin
@@ -5924,10 +5924,10 @@ File: netronome/flower/nic_AMDA0096.nffw
 File: netronome/flower/nic_AMDA0097.nffw
 File: netronome/flower/nic_AMDA0058.nffw
 Link: netronome/flower/nic_AMDA0081.nffw -> nic_AMDA0097.nffw
-Link: netronome/flower/nic_AMDA0081-0001_1x40.nffw -> nic_AMDA0081.nffw
+Link: netronome/flower/nic_AMDA0081-0001_1x40.nffw -> nic_AMDA0097.nffw
 Link: netronome/flower/nic_AMDA0097-0001_2x40.nffw -> nic_AMDA0097.nffw
 Link: netronome/flower/nic_AMDA0099-0001_2x10.nffw -> nic_AMDA0099.nffw
-Link: netronome/flower/nic_AMDA0081-0001_4x10.nffw -> nic_AMDA0081.nffw
+Link: netronome/flower/nic_AMDA0081-0001_4x10.nffw -> nic_AMDA0097.nffw
 Link: netronome/flower/nic_AMDA0097-0001_4x10_1x40.nffw -> nic_AMDA0097.nffw
 Link: netronome/flower/nic_AMDA0099-0001_2x25.nffw -> nic_AMDA0099.nffw
 Link: netronome/flower/nic_AMDA0096-0001_2x10.nffw -> nic_AMDA0096.nffw
diff --git a/check_whence.py b/check_whence.py
index c270ee6020083044645353235a94eee0b2497960..d7742f1ed951acab6efc89916c7f6621ba56881b 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -115,12 +115,20 @@ def main():
         sys.stderr.write("E: %s listed in WHENCE as Link, is in tree\n" % name)
         ret = 1
 
+    invalid_targets = set(link[0] for link in links_list)
+    for link, target in sorted(links_list):
+        if target in invalid_targets:
+            sys.stderr.write(
+                "E: target %s of link %s is also a link\n" % (target, link)
+            )
+            ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write("E: %s listed in WHENCE does not exist\n" % name)
         ret = 1
 
-    # A link can point to another link, or to a file...
-    valid_targets = set(link[0] for link in links_list) | git_files
+    # A link can point to a file...
+    valid_targets = set(git_files)
 
     # ... or to a directory
     for target in set(valid_targets):

-- 
2.46.1


