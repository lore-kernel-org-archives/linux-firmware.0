Return-Path: <SRS0=SELS=OR=ti.com=shenghao-ding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA95C3DA4B
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Jul 2024 05:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89484C32782; Wed, 17 Jul 2024 05:10:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7E60C4AF0C
	for <linux-firmware@kernel.org>; Wed, 17 Jul 2024 05:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7E60C4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46H59Sfh122485;
	Wed, 17 Jul 2024 00:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721192968;
	bh=7L9STx9OurQV4QAGt/5PU0GHa7eFyMMm4I1geDhiLs4=;
	h=From:To:CC:Subject:Date;
	b=sIDoK+TcDsMwAME5uWkpoADtUx1vsibkln8lIq0h+axf+5HGeozyZpQuP3O66AqeB
	 T6FQtC+FX0Je7JZ+Tiv8zCzV+2+a6DZKfKwpskJKya+DOfSH5/1gj/RZU8IPp1mNYf
	 1yxhpP1r7QDI3EVGFi+ryr/2iHOvRFFhSNAgGgDU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46H59SbT043198
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2024 00:09:28 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 00:09:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 00:09:28 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com [10.85.14.243])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46H59NEA011177;
	Wed, 17 Jul 2024 00:09:24 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <zigo@debian.org>, <baojun.xu@ti.com>, <13564923607@139.com>,
        <v-po@ti.com>, <linux-sound@vger.kernel.org>, <robinchen@ti.com>,
        <linux-kernel@vger.kernel.org>, <mimperial@lenovo.com>,
        <cchen50@lenovo.com>, <soyer@irl.hu>, <stuart.a.hayhurst@gmail.com>,
        <navada@ti.com>, Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: fix the license issue for tas781 firmware
Date: Wed, 17 Jul 2024 13:09:18 +0800
Message-ID: <20240717050919.692-1-shenghao-ding@ti.com>
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
v1:
 - Remove the GPL-2+ and fix the license issue.
 - Update the year of copyright.
---
 WHENCE | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/WHENCE b/WHENCE
index b2fc018..b5b12c2 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7384,8 +7384,8 @@ Link: TAS2XXX38E0.bin -> ti/tas2781/TAS2XXX38E0.bin
 Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
 Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
 
-Licence: Allegedly GPLv2+, but no source visible. Marked:
-	 Copyright (C) 2023 Texas Instruments
+Licence: Allegedly LICENCE.ti-tspa, but no source visible. Marked:
+	 Copyright (C) 2023 - 2024 Texas Instruments
 
 Found in hex form in kernel source.
 
@@ -7397,8 +7397,8 @@ File: ti/tas2563/INT8866RCA2.bin
 Link: TAS2XXX3870.bin -> ti/tas2563/TAS2XXX3870.bin
 Link: INT8866RCA2.bin -> ti/tas2563/INT8866RCA2.bin
 
-Licence: Allegedly GPLv2+, but no source visible. Marked:
-	 Copyright (C) 2023 Texas Instruments
+Licence: Allegedly LICENCE.ti-tspa, but no source visible. Marked:
+	 Copyright (C) 2023 - 2024 Texas Instruments
 
 Found in hex form in kernel source.
 
-- 
2.34.1

