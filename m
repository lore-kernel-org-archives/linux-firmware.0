Return-Path: <SRS0=aU03=DF=ti.com=nikhil.nd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C48C2D0A8
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2020 20:33:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E5D3D2083B; Mon, 28 Sep 2020 20:33:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92BE12080A
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2020 20:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lb4qUFol"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92BE12080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nikhil.nd@ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08SKXLGN013287;
	Mon, 28 Sep 2020 15:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601325201;
	bh=t/hP2PNT7fH3omwmKWNOUyNxf0rEpsiIYB3gL/A/KQw=;
	h=From:To:CC:Subject:Date;
	b=lb4qUFol/Wc28PSf3PKmUNqESpMvy5W6P2qXsNKLBLQ2ombWynmBBB581mfpMk9FI
	 mJx5vLYu6uFuk+P40Ntdx70cottQCEdB5DRZ/5AWPHGDHdhfbSRNRzDTI9C8OrIdqF
	 U1QwWnanlkJLN9mMTNZMW/0FCESYS6cktY4kcl+4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08SKXLV6110967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Sep 2020 15:33:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 28
 Sep 2020 15:33:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 28 Sep 2020 15:33:21 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08SKXHYw084953;
	Mon, 28 Sep 2020 15:33:18 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <linux-media@vger.kernel.org>
CC: <dmurphy@ti.com>, <tomi.valkeinen@ti.com>, <bparrot@ti.com>,
        <nsekhar@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <nikhil.nd@ti.com>
Subject: [PATCH 0/1] linux-firmware: Add VPDMA firmware binary
Date: Tue, 29 Sep 2020 02:03:02 +0530
Message-ID: <20200928203303.32178-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

This patch adds a firmware binary for VPDMA, which is a hardware
block used in Texas Instrument's VPE (Video Processing Engine)

Nikhil Devshatwar (1):
  linux-firmware: Add new VPDMA firmware 1b8.bin

 LICENCE.ti-tspa               |  46 ++++++++++++++++++++++++++++++++++
 WHENCE                        |   8 ++++++
 ti-connectivity/vpdma-1b8.bin | Bin 0 -> 4002 bytes
 3 files changed, 54 insertions(+)
 create mode 100644 LICENCE.ti-tspa
 create mode 100644 ti-connectivity/vpdma-1b8.bin

-- 
2.17.1

