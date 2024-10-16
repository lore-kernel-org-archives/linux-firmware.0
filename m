Return-Path: <SRS0=g3Ok=RM=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DEED20688
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Oct 2024 02:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF20FC4CEC6; Wed, 16 Oct 2024 02:05:17 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D559DC4CECF
	for <linux-firmware@kernel.org>; Wed, 16 Oct 2024 02:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D559DC4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 49G259d242338007, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1729044310; bh=md17R25Glc6hSt/TacVaR8wdsBxMqwPZccJ0enrFnBI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=DdrXLnx+ybk8hW/sDTdL3eV8gj9Z9yjaJd81A5GxmwIfsEQD5mNzKcZW4gnQCvxum
	 +RQfl2HD7slVQ/qRQ6qxGfZGE7qEwvICoJtaiZOfe0xU9fFKDr5MCZOpVluPg9+07W
	 /LlcGZSAKEZhgkrT/vSsLj/5cjW/q8REcPD5sezJMNgULE6XMzo6TCTBQliOJ9Yl7O
	 DZ03mPSi66CR2oNhkeh1/4TSYVcgrfqNw8Ee5RlrrUB33o5h4KuIn4dxtqro3vN4oM
	 C4Udw5OQLUeHjCUdKy8dEhFJsDXd3NsD+gvL1LtAy8yU+AXjU9gi6ekKFdN/4lZ4ca
	 PIJhHFJHv5jHw==
Received: from RSEXMBS03.realsil.com.cn ([172.29.17.197])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 49G259d242338007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 16 Oct 2024 10:05:10 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RSEXMBS03.realsil.com.cn (172.29.17.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 16 Oct 2024 10:05:09 +0800
Received: from RSEXH36501.realsil.com.cn (172.29.17.2) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.11; Wed, 16 Oct 2024 10:05:09 +0800
Received: from 172.29.32.27 (172.29.32.27) by RSEXH36501.realsil.com.cn
 (172.29.17.2) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 16 Oct 2024 10:05:09 +0800
From: ChunHao Lin <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
        <nic_swsd@realtek.com>
CC: ChunHao Lin <hau@realtek.com>
Subject: [PATCH] rtl_nic: add firmware rtl8125d-1
Date: Wed, 16 Oct 2024 10:04:45 +0800
Message-ID: <20241016020445.87761-1-hau@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This adds firmware rtl8125d-1 for RTL8125d rev.a.

Signed-off-by: ChunHao Lin <hau@realtek.com>
---
 WHENCE                |   3 +++
 rtl_nic/rtl8125d-1.fw | Bin 0 -> 17168 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl8125d-1.fw

diff --git a/WHENCE b/WHENCE
index 6898ed24..8177150e 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3495,6 +3495,9 @@ Version: 0.0.2
 File: rtl_nic/rtl8125b-2.fw
 Version: 0.0.2
 
+File: rtl_nic/rtl8125d-1.fw
+Version: 0.0.7
+
 File: rtl_nic/rtl8126a-2.fw
 Version: 0.0.2
 
diff --git a/rtl_nic/rtl8125d-1.fw b/rtl_nic/rtl8125d-1.fw
new file mode 100644
index 0000000000000000000000000000000000000000..2caf0f79e9ffb983c2a029041016a48bb475fa48
GIT binary patch
literal 17168
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
KK8~)V|NaSMJr7F&

literal 0
HcmV?d00001

-- 
2.43.0

