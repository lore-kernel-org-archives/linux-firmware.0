Return-Path: <SRS0=rd9Q=OS=ti.com=shenghao-ding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F095CC3DA49
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Jul 2024 07:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B37C2C4AF0B; Thu, 18 Jul 2024 07:01:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0CC6C116B1
	for <linux-firmware@kernel.org>; Thu, 18 Jul 2024 07:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0CC6C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I70V0m023685;
	Thu, 18 Jul 2024 02:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721286031;
	bh=7RVqeIDLuD6xV55kFX0VpsHpoNGYN5G0haiDA1UmC5I=;
	h=From:To:CC:Subject:Date;
	b=q/LwbwxAFcNZCWIc3wwUrtOEX9MqIGdECNcIJ7fiTKoWGkwFr6T8ADh/Ditr8yIDb
	 d9EypqLEkCOqv9b2V0r+Cp+A6n9TOYohT4D3xn4VKjqY/J6ZBDx2n1GeMbkdv9EZAj
	 2JcOtASvELtvnPooBan9CqwXLKzjuD7PpYuLg85A=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I70VGj019248
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Jul 2024 02:00:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 02:00:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 02:00:31 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com [10.85.14.216])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I70QHt006129;
	Thu, 18 Jul 2024 02:00:27 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <zigo@debian.org>, <baojun.xu@ti.com>, <13564923607@139.com>,
        <v-po@ti.com>, <linux-sound@vger.kernel.org>, <robinchen@ti.com>,
        <linux-kernel@vger.kernel.org>, <mimperial@lenovo.com>,
        <cchen50@lenovo.com>, <soyer@irl.hu>, <stuart.a.hayhurst@gmail.com>,
        <navada@ti.com>, Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v2] ASoC: tas2781: fix the license issue for tas781 firmware
Date: Thu, 18 Jul 2024 15:00:22 +0800
Message-ID: <20240718070022.591-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Fix the license issue for tas781 firmware, which are shipped as .bin
opaque. Remove the GPL-2+, which imposes having the source code
available.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Drop "Found in hex form in kernel source."
 - Drop Allegedly, Add Redistributable.
v1:
 - Remove the GPL-2+ and fix the license issue.
 - Update the year of copyright.
---
 WHENCE | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/WHENCE b/WHENCE
index b2fc018..3d95a97 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7384,10 +7384,8 @@ Link: TAS2XXX38E0.bin -> ti/tas2781/TAS2XXX38E0.bin
 Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
 Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
 
-Licence: Allegedly GPLv2+, but no source visible. Marked:
-	 Copyright (C) 2023 Texas Instruments
-
-Found in hex form in kernel source.
+Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
+	 Copyright (C) 2023 - 2024 Texas Instruments
 
 --------------------------------------------------------------------------
 
@@ -7397,10 +7395,8 @@ File: ti/tas2563/INT8866RCA2.bin
 Link: TAS2XXX3870.bin -> ti/tas2563/TAS2XXX3870.bin
 Link: INT8866RCA2.bin -> ti/tas2563/INT8866RCA2.bin
 
-Licence: Allegedly GPLv2+, but no source visible. Marked:
-	 Copyright (C) 2023 Texas Instruments
-
-Found in hex form in kernel source.
+Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
+	 Copyright (C) 2023 - 2024 Texas Instruments
 
 --------------------------------------------------------------------------
 
-- 
2.34.1

