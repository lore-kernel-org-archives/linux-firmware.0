Return-Path: <SRS0=Ck56=TE=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6B7E7717F
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Dec 2024 02:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECD60C4CEDD; Wed, 11 Dec 2024 02:47:58 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C143C4CEE0
	for <linux-firmware@kernel.org>; Wed, 11 Dec 2024 02:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C143C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4BB2lhuX73087265, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1733885264; bh=jthRD/poMczVKUWvWBN6w/DmGOpV5RDb12NZboBdviA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=t4qIImLZTdMLlDLyF5p1LSZHdyfKyB7mk0uxjmFZaRCvX5MopvHDFm+qfahp9K4ir
	 DAyz8JbHzRX9Q5mcDg1z+ec/tXNjLPD8+sM4Mx5GKKLQbKVeQzFyWocGlhw0gyn9ZI
	 ouG0HhMuX0IyHEw4E2+pMEsneHeAFuxVcu+PdsdyCZywONMyBfDBbIamRQ2D9oHe1q
	 XBZJJKrwEFLMPRNoVl0NvPZ28EOUZV1AvSqCzeKO67KpgSrCMyKVjt5VTtkWO2qVBC
	 EfepbX3Cc53fqL4Vczdy5iiTdSC705GvjAWWz9UFaHosFtor5gOgDt6U3k+g0QfuHa
	 itam3ffe3iLdA==
Received: from RSEXH36502.realsil.com.cn (ms1.realsil.com.cn[172.29.17.3])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4BB2lhuX73087265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 11 Dec 2024 10:47:44 +0800
Received: from RSEXH36502.realsil.com.cn (172.29.17.3) by
 RSEXH36502.realsil.com.cn (172.29.17.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Dec 2024 10:47:43 +0800
Received: from 172.29.32.27 (172.29.32.27) by RSEXH36502.realsil.com.cn
 (172.29.17.3) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 11 Dec 2024 10:47:43 +0800
From: ChunHao Lin <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
        <nic_swsd@realtek.com>
CC: ChunHao Lin <hau@realtek.com>
Subject: [PATCH] rtl_nic: add firmware rtl8125d-2
Date: Wed, 11 Dec 2024 10:47:29 +0800
Message-ID: <20241211024729.3029-1-hau@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This adds firmware rtl8125d-2 for rtl8125d rev.b.

Signed-off-by: ChunHao Lin <hau@realtek.com>
---
 WHENCE                |   3 +++
 rtl_nic/rtl8125d-2.fw | Bin 0 -> 6800 bytes
 2 files changed, 3 insertions(+)
 create mode 100755 rtl_nic/rtl8125d-2.fw

diff --git a/WHENCE b/WHENCE
index ca566e56..bd35ae6b 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3556,6 +3556,9 @@ Version: 0.0.2
 File: rtl_nic/rtl8125d-1.fw
 Version: 0.0.7
 
+File: rtl_nic/rtl8125d-2.fw
+Version: 0.0.4
+
 File: rtl_nic/rtl8126a-2.fw
 Version: 0.0.2
 
diff --git a/rtl_nic/rtl8125d-2.fw b/rtl_nic/rtl8125d-2.fw
new file mode 100755
index 0000000000000000000000000000000000000000..00232e7d52145721415dad41c393fdfe55a09600
GIT binary patch
literal 6800
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

literal 0
HcmV?d00001

-- 
2.43.0

