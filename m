Return-Path: <SRS0=FULG=C4=lontium.com=syyang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAA4FF8867
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Apr 2026 03:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50D0EC2BCB9; Wed, 29 Apr 2026 03:31:16 +0000 (UTC)
Received: from out28-221.mail.aliyun.com (out28-221.mail.aliyun.com [115.124.28.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D612C2BCB7
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 03:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D612C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lontium.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1777433466; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=K6psO3nxokP8/M/5RJaC89HWuUOzQivXjnVkARsohZc=;
	b=fxuMkv5ptwJELwhD83x0ohszZlbbroLHPIqEvYbkuZ4Og03jLYBUPKpwDTNXJDo0CDQM2YClRLFq7vLR/LxnX9cH5axtAmYVUAQ9LV+Uaf2eTBYrDrSftAQK/jt0DKy1rBWledp64hLeULzMw/0W0Otk/4mc7M1rJ41o5qI+eJjvqWuAU/4GOG0kn5nw2V1XG+IQkv3hq3NLPSIlyQOMysnw8eY8QPF9enr+mEUKQGAFh7qT5CFt0IGxnZ9uGpAjkmtIa6l1uZxebApNWKBCevWIc13yjjAR7Z9L93NkWt23ObxejUZpHbW/whpkrc9GtMsrMnNWLUUa96kcoQ8XOw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.164307|-1;BR=01201311R181S26rulernew2018_352553_221103;CH=green;DM=|CONTINUE|false|;DS=SPAM|spam_blackmail|0.914674-0.00150016-0.0838257;FP=17455990473281428223|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083013073;MF=syyang@lontium.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.hMXNNS._1777433464;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hMXNNS._1777433464 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 11:31:05 +0800
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
Subject: [PATCH] linux-firmware:Add firmware for Lontium LT7911EXC bridge
Date: Wed, 29 Apr 2026 11:31:02 +0800
Message-Id: <20260429033102.3403476-1-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

This is the firmware for the Lontium LT7911EXC,
which implements the function of converting eDP to MIPI DSI.

Signed-off-by: Sunyun Yang <syyang@lontium.com>
---
 Lontium/lt7911exc_fw.bin | Bin 0 -> 30735 bytes
 WHENCE                   |   8 ++++++++
 2 files changed, 8 insertions(+)
 create mode 100644 Lontium/lt7911exc_fw.bin

diff --git a/Lontium/lt7911exc_fw.bin b/Lontium/lt7911exc_fw.bin
new file mode 100644
index 0000000000000000000000000000000000000000..c09891ab2f3d3618336e1092eccd943da6153a02
GIT binary patch
literal 30735
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
LEe@)zkNf`soxYL(

literal 0
HcmV?d00001

diff --git a/WHENCE b/WHENCE
index 3eb3da2..b32bc6e 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7285,6 +7285,14 @@ Licence: Redistributable. See LICENCE.Marvell for details.
 
 --------------------------------------------------------------------------
 
+Driver: lt7911exc - Lontium EDP to MIPI DSI bridge
+
+File: Lontium/lt7911exc_fw.bin
+
+License: Redistributable. See LICENSE.Lontium for details.
+
+--------------------------------------------------------------------------
+
 Driver: lt8713sx - Lontium DP Hub
 
 File: lt8713sx_fw.bin
-- 
2.34.1

