Return-Path: <SRS0=P3mZ=46=ti.com=shenghao-ding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64CFCCD184
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Oct 2025 09:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F29EC4CEF1; Tue, 21 Oct 2025 09:39:16 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F26B6C4CEFF
	for <linux-firmware@kernel.org>; Tue, 21 Oct 2025 09:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F26B6C4CEFF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59L9cOJ23218594;
	Tue, 21 Oct 2025 04:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761039504;
	bh=YjrjZMi2FcOrITV2TEi7u4dwTybFJpBB0zKVd9p20zQ=;
	h=From:To:CC:Subject:Date;
	b=HnrBHdFfrLXniXtVxOBsiN0SvDEmZSYZkPb/EMhoU+sYJFk0pOUYy0gfpIKEDBQMZ
	 CFA6LKcF2Qi7rZI1E/JTqW2ls4WFghyxs5Mjbjg/v9n42bArYHcTthpls3lQpjqwXc
	 S+H8GtZebN2Aiu6WU/tzFgFiF8XqLPi9ALRW3StU=
Received: from DLEE210.ent.ti.com (dlee210.ent.ti.com [157.170.170.112])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59L9cO0J1478068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Oct 2025 04:38:24 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Oct
 2025 04:38:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Oct 2025 04:38:23 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.35])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59L9cKKY3547512;
	Tue, 21 Oct 2025 04:38:21 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <zigo@debian.org>, <baojun.xu@ti.com>, <13564923607@139.com>,
        <linux-kernel@vger.kernel.org>, <soyer@irl.hu>,
        <stuart.a.hayhurst@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1 0/1] ASoc: TAS2781: firmware patch check report
Date: Tue, 21 Oct 2025 17:38:15 +0800
Message-ID: <20251021093816.735-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

 root@LAPTOP-4VMBP1QN:/usr/local/src/fw_new# make check
 Check that executables have shebangs.....................................Passed
 Forbid new submodules....................................................Passed
 Check Yaml...............................................................Passed
 Check for broken symlinks............................(no files to check)Skipped
 Detect Destroyed Symlinks................................................Passed
 shellcheck...............................................................Passed
 black....................................................................Passed
 markdownlint............................................................Skipped
 Check whence.............................................................Passed
 root@LAPTOP-4VMBP1QN:/usr/local/src/fw_new#

Shenghao Ding (1):
  ASoc: TAS2781: Create audio folder in ti folder, and move all the
    audio firmwares into it

 WHENCE                                  | 302 ++++++++++++------------
 ti/{ => audio}/tas2563/INT8866RCA2.bin  | Bin
 ti/{ => audio}/tas2563/TAS2XXX3870.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX0C94.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX0C95.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX0C96.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX0C97.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX10A40.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX10A41.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX11540.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX11541.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX12040.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX12041.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX12140.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX12141.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX1EB30.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX1EB31.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX2234.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX2326.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX387D.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX387E.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX387F.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3880.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3881.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3882.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3884.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3886.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38A5.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38A7.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38A8.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38B8.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38B9.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38BA.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38BB.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38BE.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38BF.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38C3.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38CB.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38CD.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38D3.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38D4.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38D5.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38D6.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38DF.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38E0.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38FD.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX391F.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3920.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3E300.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3E301.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3EE00.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3EE01.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3EF00.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3EF01.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F000.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F001.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F100.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F101.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F200.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F201.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F300.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F301.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX8DE8.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX8DE9.bin  | Bin
 ti/{ => audio}/tas2781/TIAS2781RCA2.bin | Bin
 ti/{ => audio}/tas2781/TIAS2781RCA4.bin | Bin
 ti/{ => audio}/tas2781/TXNW2781RCA0.bin | Bin
 ti/{ => audio}/tas2781/TXNW2781RCA1.bin | Bin
 68 files changed, 151 insertions(+), 151 deletions(-)
 rename ti/{ => audio}/tas2563/INT8866RCA2.bin (100%)
 rename ti/{ => audio}/tas2563/TAS2XXX3870.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX0C94.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX0C95.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX0C96.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX0C97.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX10A40.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX10A41.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX11540.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX11541.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX12040.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX12041.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX12140.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX12141.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX1EB30.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX1EB31.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX2234.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX2326.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX387D.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX387E.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX387F.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3880.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3881.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3882.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3884.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3886.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38A5.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38A7.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38A8.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38B8.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38B9.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38BA.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38BB.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38BE.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38BF.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38C3.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38CB.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38CD.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38D3.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38D4.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38D5.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38D6.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38DF.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38E0.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38FD.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX391F.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3920.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3E300.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3E301.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3EE00.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3EE01.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3EF00.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3EF01.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F000.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F001.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F100.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F101.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F200.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F201.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F300.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F301.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX8DE8.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX8DE9.bin (100%)
 rename ti/{ => audio}/tas2781/TIAS2781RCA2.bin (100%)
 rename ti/{ => audio}/tas2781/TIAS2781RCA4.bin (100%)
 rename ti/{ => audio}/tas2781/TXNW2781RCA0.bin (100%)
 rename ti/{ => audio}/tas2781/TXNW2781RCA1.bin (100%)

-- 
2.43.0

