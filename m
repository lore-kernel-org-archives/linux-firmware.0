Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4CEC7EE2D
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0167C433B4; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92F53C433AE;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=QjyIRH+sdAIWQdr/EXvziXyvaGFm86H/7a9PHMogkGU=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=qDhJ+2qQDLr/s4gx+8GID9/PESUsE+DuolsRUlSqrAVujSgreCUxokDafOCTvoQNr
	 3wipztTrDV2yOmRLfCm21/Hmgg2/hqNFEKsDHGf3KQ0QCRGEryzb8n/trW8QHQGe3L
	 ozRx8PMQtvsNaYQBokkol4+1gjDkigU7z2dv2yYEMK17YB7Dh3JFcEbcPQ3meR0sk9
	 q2WxapC4jCiwRswWOxeOeI1f+Pb8Lzjre7fhDAaO/PshCHnJmW1VXiJmmGtIxR6oBu
	 VZL2iD2GBbsOAZj1PvIdR/AAphJZHhUHybicyLuPufJoKtavHmLKyPW+QfjYjPO4V7
	 a9Z4i5Et4/4eA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79915C7EE2D;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:18 +0000
Subject: [PATCH RESEND v2 04/16] WHENCE: remove duplicate File entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-4-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=2057;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=W4W/vcckzNejCfAKf2O2Ih3Dx4xTlABXVUtkRUnu0fI=;
 b=CcB3G440Asy3n027BU9dR+/HJ+T9sNwcy7unuKbt/4ooJfySKGECYZVSmSN17j3DAU5bvM4t7
 QvgK+8ip5fjAG6T/42uIVRjmjGz8nT7GmPfHkRakfelzfD9kxKBbo1L
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 WHENCE | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/WHENCE b/WHENCE
index 214952e..7de6d6b 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1073,10 +1073,6 @@ Version: 75.27f1c37b.0
 File: iwlwifi-so-a0-jf-b0-77.ucode
 Version: 74.f92b5fed.0
 
-File: iwlwifi-so-a0-gf-a0.pnvm
-
-File: iwlwifi-so-a0-gf4-a0.pnvm
-
 File: iwlwifi-ty-a0-gf-a0.pnvm
 
 Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
@@ -2980,19 +2976,6 @@ Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
-Driver: r8723au - Realtek 802.11n WLAN driver for RTL8723AU
-
-Info: Taken from Realtek driver rtl8723A_WiFi_linux_v4.1.3_6044.20121224
-      Firmware is embedded in the driver as data statements. This info
-      has been extracted into a binary file.
-File: rtlwifi/rtl8723aufw_A.bin
-File: rtlwifi/rtl8723aufw_B.bin
-File: rtlwifi/rtl8723aufw_B_NoBT.bin
-
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
-
---------------------------------------------------------------------------
-
 Driver: rtl8188ee - Realtek 802.11n WLAN driver for RTL8188EE
 
 Info: Taken from Realtek version rtl_92ce_92se_92de_8723ae_88ee_linux_mac80211_0010.0109.2013
@@ -5942,8 +5925,6 @@ Link: cirrus/cs35l41-dsp1-spk-prot-103c8995.wmfw -> cs35l41/v6.61.1/halo_cspl_RA
 Link: cirrus/cs35l41-dsp1-spk-cali-103c8995.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
 Link: cirrus/cs35l41-dsp1-spk-prot-103c89c6.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
 Link: cirrus/cs35l41-dsp1-spk-cali-103c89c6.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
-File: cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
-File: cirrus/cs35l41-dsp1-spk-prot-103c8971.bin
 File: cirrus/cs35l41-dsp1-spk-prot-103c8971.bin
 File: cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
 File: cirrus/cs35l41-dsp1-spk-prot-103c8972.bin

-- 
2.39.2

