Return-Path: <SRS0=p8Yt=RF=ti.com=shenghao-ding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDE6CF0449
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Oct 2024 10:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70E4DC4CECC; Wed,  9 Oct 2024 10:21:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B921C4CEC5
	for <linux-firmware@kernel.org>; Wed,  9 Oct 2024 10:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B921C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499AIIhC053118;
	Wed, 9 Oct 2024 05:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728469098;
	bh=2x7pjOR+UZM+R8Ptic3xXN9W+OZrURWJaft0V2hCinw=;
	h=From:To:CC:Subject:Date;
	b=C+a9xtKXFiWhVvgh113ayZXGwb3COeX1vlyRe4LYKmLkQDEUD+k4L0OmrYustoyhL
	 Yjx7qOBSgfM17bSBAs3Vr7m4m/MKI2vhycHF+wJRU1U+3eCaAWTGCjmplvtHJj5INl
	 cx6eg8YFqaAW514DeBdl7RKj7+BeLizb2GwHdtgE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 499AIIja029733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Oct 2024 05:18:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 05:18:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 05:18:18 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com [10.85.14.191])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499AICRw084727;
	Wed, 9 Oct 2024 05:18:13 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <baojun.xu@ti.com>, <derekjohn.clark@gmail.com>, <13916275206@139.com>,
        <romangg@manjaro.org>, <linux-sound@vger.kernel.org>,
        <robinchen@ti.com>, <linux-kernel@vger.kernel.org>, <k-yi@ti.com>,
        <navada@ti.com>, <philm@manjaro.org>, <jlobue10@gmail.com>,
        <luke@ljones.dev>, <antheas.dk@gmail.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] Upload dsp firmware for ASUS laptop 1EB30 & 1EB31 and Update WHENCE for both
Date: Wed, 9 Oct 2024 18:18:05 +0800
Message-ID: <20241009101807.1473-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 WHENCE                     |   4 ++++
 ti/tas2781/TAS2XXX2234.bin | Bin
 2 files changed, 4 insertions(+)
 mode change 100644 => 100755 ti/tas2781/TAS2XXX2234.bin

diff --git a/WHENCE b/WHENCE
index a9c8bb5..00096eb 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7487,6 +7487,8 @@ Originates from https://git.codelinaro.org/linaro/qcomlt/audioreach-topology.git
 --------------------------------------------------------------------------
 
 Driver: ti-tas2781 - tas2781 firmware
+File: ti/tas2781/TAS2XXX1EB30.bin
+File: ti/tas2781/TAS2XXX1EB31.bin
 File: ti/tas2781/TAS2XXX2234.bin
 File: ti/tas2781/TAS2XXX387D.bin
 File: ti/tas2781/TAS2XXX387E.bin
@@ -7516,6 +7518,8 @@ File: ti/tas2781/TAS2XXX38DF.bin
 File: ti/tas2781/TAS2XXX38E0.bin
 File: ti/tas2781/TIAS2781RCA2.bin
 File: ti/tas2781/TIAS2781RCA4.bin
+Link: TAS2XXX1EB30.bin -> ti/tas2781/TAS2XXX1EB30.bin
+Link: TAS2XXX1EB31.bin -> ti/tas2781/TAS2XXX1EB31.bin
 Link: TAS2XXX2234.bin -> ti/tas2781/TAS2XXX2234.bin
 Link: TAS2XXX387D.bin -> ti/tas2781/TAS2XXX387D.bin
 Link: TAS2XXX387E.bin -> ti/tas2781/TAS2XXX387E.bin
diff --git a/ti/tas2781/TAS2XXX2234.bin b/ti/tas2781/TAS2XXX2234.bin
old mode 100644
new mode 100755
-- 
2.34.1

