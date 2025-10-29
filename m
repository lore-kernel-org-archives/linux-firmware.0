Return-Path: <SRS0=sTQ7=5G=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC548CCF9EE
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Oct 2025 09:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA09EC113D0; Wed, 29 Oct 2025 09:18:55 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21951C4CEF7;
	Wed, 29 Oct 2025 09:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21951C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 59T9IgAuA4037791, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1761729522; bh=hVp1MRMB2XAwkIYlhmqk8Ga8U8oZ0LUUqjaFV3yAq9U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=MENmPNHzw/UWQ9Y65GFEFHoGKBfMACZsqnD/jfvaq63i62uAad+SxnBG+CT0cSgvm
	 mi4WPffQNrz871zVaVmFxpd/E1KQHtxt1z/5gKf3fL3iTnaTf5h0ObXk7DSnDM05ur
	 bJu0DyITRm6aGYIf/54jTS3+q/Dqp6tfm+xeiUSv7e7r8cQFHtU9hDZ1VVBCQ5k1LP
	 slbRyHZSS37qcFEFKhmdANEKhAETLKuQczoe2aLUzOHHhAzIErQNJ2OAUi8ULjYYXr
	 4luIVPv0iDTegmKFwklwFoMqJ4Dg/XgwPLEdgqQOt1zbheCsnGMBstxKw+WUbUngZw
	 SHyUWa2xKFZ6A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 59T9IgAuA4037791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Oct 2025 17:18:42 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Wed, 29 Oct 2025 17:18:42 +0800
Received: from localhost.localhost (172.24.54.48) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Wed, 29 Oct 2025 17:18:42 +0800
From: Max Chou <max.chou@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Hilda Wu <hildawu@realtek.com>, alex_lu <alex_lu@realsil.com.cn>,
        <niall_ni@realsil.com.cn>, <zhu_qing@realsil.com.cn>,
        <brenda.li@ublnx.com>, Chih-Hsiang Wang <wangchihhs@realtek.com>,
        Max Chou <max.chou@realtek.com>
Subject: [PATCH] rtl_bt: Add firmware and config files for RTL8761CUV
Date: Wed, 29 Oct 2025 17:18:59 +0800
Message-ID: <20251029091859.569005-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This firmware/config is submitted for RTL8761CUV

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 WHENCE                      |   2 ++
 rtl_bt/rtl8761cu_config.bin | Bin 0 -> 11 bytes
 rtl_bt/rtl8761cu_fw.bin     | Bin 0 -> 10296 bytes
 3 files changed, 2 insertions(+)
 create mode 100644 rtl_bt/rtl8761cu_config.bin
 create mode 100644 rtl_bt/rtl8761cu_fw.bin

diff --git a/WHENCE b/WHENCE
index db7e1300..16d9ac10 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4267,6 +4267,8 @@ File: rtl_bt/rtl8761b_fw.bin
 File: rtl_bt/rtl8761b_config.bin
 File: rtl_bt/rtl8761bu_fw.bin
 File: rtl_bt/rtl8761bu_config.bin
+File: rtl_bt/rtl8761cu_fw.bin
+File: rtl_bt/rtl8761cu_config.bin
 File: rtl_bt/rtl8812ae_fw.bin
 File: rtl_bt/rtl8821a_fw.bin
 Link: rtl_bt/rtl8821a_config.bin -> rtl8821c_config.bin
diff --git a/rtl_bt/rtl8761cu_config.bin b/rtl_bt/rtl8761cu_config.bin
new file mode 100644
index 0000000000000000000000000000000000000000..018dcf93b1cbad5e865dfe6f27598382c90b4973
GIT binary patch
literal 11
ScmWGtt=!Ja@STB)fdK#%&jP6c

literal 0
HcmV?d00001

diff --git a/rtl_bt/rtl8761cu_fw.bin b/rtl_bt/rtl8761cu_fw.bin
new file mode 100644
index 0000000000000000000000000000000000000000..475320d0bd5c982cc472422cb37d263f785a24f3
GIT binary patch
literal 10296
zcmeIuF-rn*7{~GFPOGbys~{xQ^VGz^K(RUWipz^63fh$t9D*Ez93oDT@?|(Q1Z{$&
z(Av;oLNt|uP$t2lWOrcLUuftp1i$CuyFBnLpWRIQ@Hn%d?KK>#orpN%$wq_U4YSMN
zh;mhFOG?N|pM&$dwV>MmT(#U<tS^Xy?$VU*A_=-PQB(r=FL_Tk-IG!aT1k=W<<gv{
zyUr_7mGk-|qd%_|Q9Ww+>%k(UWs>pAdS`vG3|5cTXIZR)Ii*b|gjB9pI+KZtPs6LS
zF7RRTXr4mkV9}*ad)K~;;i*jGc!-wUgE;w<+t21oVNB%$cWuf{bk>RYao$IhZen?o
zn;QqtRwWoR8nw4UL9CJ--<(!w&6!wHvDNuboYwNTrslk@1eZoW3<CoJ2tWV=5P$##
zAOHafKmY;|fB*y_009U<00Izz00bZa0SG_<0uX=z1Rwwb2tWV=5crn@!zf2P_V1G)
DSQB)6

literal 0
HcmV?d00001

-- 
2.43.0

