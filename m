Return-Path: <SRS0=u2UF=7M=debian.org=bage@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16CFC6FD1D
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Mar 2023 16:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6CBDC4339C; Mon, 20 Mar 2023 16:45:13 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1FCCC4339E
	for <linux-firmware@kernel.org>; Mon, 20 Mar 2023 16:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1FCCC4339E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j7QSuDK2S0a26jhg2S39dnRT+C/bEHfdyVLdlPt77PE=; b=I1bNeaWi4H3RUy4OEbczN3XcRQ
	afxg/0m4Mjex5CdPXj35Ow10lNFB1x+jh1fdNuj4RiLwzyB7X0uj96i+gVjk/o6IhaQAqE+adpczZ
	LM9QGpGsVy3rW+j57UMeAD26wxm85Tiejm9dK9oxskvLXWZNOPP9Omh3dR6kqMCdlIYbXBV9GxgkR
	kN84ER5p+jKONyUwQJf3TyhldyqTBDhu22fDQllSiF3jOTMi7JLsfwVm6f4Zit2qdtnN3PRIaAPwi
	6D1doO+XDVNmD8j6O4MzRF1+VzLYmXioU0H6ihhzduAADQpyeqkRQHb+uSP2729Pzfzu0vBvsWpHv
	heCoVSdQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1peIcu-00EXOY-M6; Mon, 20 Mar 2023 16:44:53 +0000
From: Bastian Germann <bage@debian.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH v2 1/1] rtl_bt: Add firmware for the Bluetooth part of RTL8723CS
Date: Mon, 20 Mar 2023 17:44:46 +0100
Message-Id: <20230320164448.3489-2-bage@debian.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320164448.3489-1-bage@debian.org>
References: <20230320164448.3489-1-bage@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

This file comes from the RealtekBluetoothUartPackage_2.17.119.0525 file
which can be downloaded from realtek.com. The download is marked as version
1.0.245.3 / 2017/06/23 on the download page.

The added rtl_bt/rtl8723cs_xx_fw.bin file is called
rtl8723c_mp_bt40_fw_asic_rom_patch.bin in the download.

The configuration that was added with e6b9001e9111 ("rtl_bt: Add firmware
and configuration files for the Bluetooth part of RTL8723BS") can be
reused for this device.

Link: https://www.realtek.com/en/component/zoo/category/rtl8723bs-software
Signed-off-by: Bastian Germann <bage@debian.org>
---
 WHENCE                     |   4 ++++
 rtl_bt/rtl8723cs_xx_fw.bin | Bin 0 -> 19732 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 rtl_bt/rtl8723cs_xx_fw.bin

diff --git a/WHENCE b/WHENCE
index cf805e2..acec7e1 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3773,6 +3773,10 @@ File: rtl_bt/rtl8723b_fw.bin
 File: rtl_bt/rtl8723bs_fw.bin
 File: rtl_bt/rtl8723bs_config-OBDA8723.bin
 Link: rtl_bt/rtl8723bs_config-OBDA0623.bin -> rtl8723bs_config-OBDA8723.bin
+Link: rtl_bt/rtl8723cs_cg_config.bin -> rtl8723bs_config-OBDA8723.bin
+Link: rtl_bt/rtl8723cs_vf_config.bin -> rtl8723bs_config-OBDA8723.bin
+Link: rtl_bt/rtl8723cs_xx_config.bin -> rtl8723bs_config-OBDA8723.bin
+File: rtl_bt/rtl8723cs_xx_fw.bin
 File: rtl_bt/rtl8761a_fw.bin
 File: rtl_bt/rtl8761b_fw.bin
 File: rtl_bt/rtl8761b_config.bin
diff --git a/rtl_bt/rtl8723cs_xx_fw.bin b/rtl_bt/rtl8723cs_xx_fw.bin
new file mode 100644
index 0000000000000000000000000000000000000000..972087ad1710d340bb37c9b93d4b6d5837fccae3
GIT binary patch
literal 19732
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
TRO?C>rEhT^L+)e${15*hBp6*1

literal 0
HcmV?d00001

-- 
2.39.2

