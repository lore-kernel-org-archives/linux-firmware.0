Return-Path: <SRS0=2RNI=DD=lontium.com=syyang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F72ACD342C
	for <linux-firmware@archiver.kernel.org>; Wed,  6 May 2026 10:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D4C5C2BCC4; Wed,  6 May 2026 10:49:46 +0000 (UTC)
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 485E1C2BCB8
	for <linux-firmware@kernel.org>; Wed,  6 May 2026 10:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 485E1C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lontium.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778064578; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=M3nS1Jqcz3he3r4CaVV82rFDydaz5j2dhLIkcQinWj4=;
	b=SHtoaAFSV+rYx5WXLJjhglXmRBVgUlRAz/CGXeIAuizwe5kYULdTLm+ctT6VZNyBSXYdtsHm4aNCUOJ8P3TFXEMBlWLn/KA1xRf3OyuBgyJbMf5nJCoyp1eytLPmRNwOJOTBez4xQi/tE8SPuqwBMedpr6AuRcj8xzhUJvxdwfbeEfggJQTV+RdGJBixk6cV5/iSaIZMxiFe/hJvi8Kp/ttJBZCX3HDTJOf9z6YxMq4OnMLv6H6U8xwAK6DNujNhaG6Md946cQMmhqpWR8Y/M4vsZlsZzKD7O2T9aealfo/3D1xMmLcnlvtwuqkG5CQVewk/iWVf4v8mFaW38IJRBg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.9211859|0.8991501;CH=green;DM=|SPAM|false|;DS=CONTINUE|ham_system_inform|0.746676-0.00258792-0.250736;FP=10482029561902712514|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045220102;MF=syyang@lontium.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.hQkhuHK_1778064576;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hQkhuHK_1778064576 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 06 May 2026 18:49:37 +0800
From: syyang@lontium.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	yangsunyun1993@gmail.com,
	xmzhu@lontium.corp-partner.google.com,
	xmzhu@lontium.com,
	rlyu@lontium.com,
	xbpeng@lontium.com,
	Sunyun Yang <syyang@lontium.com>
Subject: [PATCH v2] linux-firmware: Add firmware for Lontium LT9611C
Date: Wed,  6 May 2026 18:49:34 +0800
Message-Id: <20260506104934.82275-1-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

This is the firmware for the Lontium LT9611C,
which implements the function of converting MIPI DSI to HDMI.

Signed-off-by: Sunyun Yang <syyang@lontium.com>
---
Change in v2:
- WHENCE
 1. Modify lt9611c_fw.bin to Lontium/lt9611c_fw.bin in the WHENCE file.
- Link to v1: https://lore.kernel.org/all/20260506100242.79276-1-syyang@lontium.com/
---
 Lontium/lt9611c_fw.bin | Bin 0 -> 36090 bytes
 WHENCE                 |   8 ++++++++
 2 files changed, 8 insertions(+)
 create mode 100644 Lontium/lt9611c_fw.bin

diff --git a/Lontium/lt9611c_fw.bin b/Lontium/lt9611c_fw.bin
new file mode 100644
index 0000000000000000000000000000000000000000..7df34afe87085fdb709635a20a5d53fa1f6e4b07
GIT binary patch
literal 36090
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

literal 0
HcmV?d00001

diff --git a/WHENCE b/WHENCE
index f7fc492..91e1a55 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7302,6 +7302,14 @@ License: Redistributable. See LICENSE.Lontium for details.
 
 --------------------------------------------------------------------------
 
+Driver: lt9611c - Lontium MIPI DSI to HDMI bridge
+
+File: Lontium/lt9611c_fw.bin
+
+License: Redistributable. See LICENSE.Lontium for details.
+
+--------------------------------------------------------------------------
+
 Driver: lt9611uxc - Lontium DSI to HDMI bridge
 
 File: lt9611uxc_fw.bin
-- 
2.34.1

