Return-Path: <SRS0=Os7O=PI=qualcomm.com=dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9060FC52D7C
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Aug 2024 10:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45663C32786; Fri,  9 Aug 2024 10:38:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEE6CC32782
	for <linux-firmware@kernel.org>; Fri,  9 Aug 2024 10:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BEE6CC32782
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4792M0XU024816;
	Fri, 9 Aug 2024 10:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=NwASUo6W4zGs
	x4Gd9iWd4z+5102U6xaIjCyHuxHLRfI=; b=NMw1KBdc12Z19pP9LpUv2aj+kV7k
	0uN6mq4MyuOC8iZlc6+lPWOEK9jf9zGEqURApFaMUypO01Rup4aOkxN1lxtQDX3/
	cRxc9fpbHXXufaE2VCf3V/gDquC87ZmJp/VUK4CkBKtAlFQ1G1dOcQy/Ikfx+VVA
	j06JF+ekQO/YfkpUTucWqb7zBXOavBszrexYbKJm+4Tri9wSD7qg/RGtmWSumE1i
	gC++vUnKxMjL1r0X6BnsGYR3oXhYwuJ3+L35OgnQOxX5r61UPrT0U6C4lXMKrK4y
	eMQXTBUyHv+sLUavrMQReoU6ILQiMZ+WFzRdvJ7aF2TLbJ8PU9gR5+I6zQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx70yt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 10:37:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 479Abt4F025378;
	Fri, 9 Aug 2024 10:37:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 40sdmmqdhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 09 Aug 2024 10:37:55 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 479AbsEw025373;
	Fri, 9 Aug 2024 10:37:54 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-dikshita-hyd.qualcomm.com [10.213.110.13])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 479AbscB025372;
	Fri, 09 Aug 2024 10:37:54 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 347544)
	id BF526257B; Fri,  9 Aug 2024 16:07:53 +0530 (+0530)
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: quic_vgarodia@quicinc.com, dmitry.baryshkov@linaro.org,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v3] qcom: update path for video firmware for vpu-1/2/3.0
Date: Fri,  9 Aug 2024 16:07:37 +0530
Message-Id: <1723199857-10405-1-git-send-email-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YkRQyEwlBqvmRXPyGwDZ_dPnYZYDaJzh
X-Proofpoint-GUID: YkRQyEwlBqvmRXPyGwDZ_dPnYZYDaJzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_07,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=924 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090076

- Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
  new firmware files.
- Move firmware files from vpu-1.0/ and vpu-2.0/ to vpu/ with
  proper names for firmware binaries and provide backwards-compatible
  links.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Changes since v2:
 - Dropped the symlink for vpu-3.0.

Changes since v1:
 - Updated firmware binary names to better names following
   common convention.
 - Used Link: tag in WHENCE to create symlinks.

 WHENCE                                          |   9 +++++----
 qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn}    | Bin
 qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn}    | Bin
 qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} | Bin
 4 files changed, 5 insertions(+), 4 deletions(-)
 rename qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn} (100%)
 rename qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn} (100%)
 rename qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} (100%)

diff --git a/WHENCE b/WHENCE
index 0a737b6..b7dc6ff 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5961,12 +5961,13 @@ File: qcom/venus-6.0/venus.mbn
 
 Version: VIDEO.VE.6.0-00049-PROD-1
 
-File: qcom/vpu-1.0/venus.mbn
-Link: qcom/vpu-1.0/venus.mdt -> venus.mbn
+File: qcom/vpu/vpu20_p4.mbn
+Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
 
 Version: VIDEO.VPU.1.0-00087-PROD-1
 
-File: qcom/vpu-2.0/venus.mbn
+File: qcom/vpu/vpu20_p1.mbn
+Link: qcom/vpu-2.0/venus.mbn -> ../vpu/vpu20_p1.mbn
 
 Version: VIDEO.VPU.2.0-00049-PROD-1
 
@@ -5979,7 +5980,7 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
 
 Driver: iris - Qualcomm Iris video codec accelerator
 
-File: qcom/vpu-3.0/vpu30_4v.mbn
+File: qcom/vpu/vpu30_p4.mbn
 
 Version: VIDEO.VPU.3.1-0076
 
diff --git a/qcom/vpu-2.0/venus.mbn b/qcom/vpu/vpu20_p1.mbn
similarity index 100%
rename from qcom/vpu-2.0/venus.mbn
rename to qcom/vpu/vpu20_p1.mbn
diff --git a/qcom/vpu-1.0/venus.mbn b/qcom/vpu/vpu20_p4.mbn
similarity index 100%
rename from qcom/vpu-1.0/venus.mbn
rename to qcom/vpu/vpu20_p4.mbn
diff --git a/qcom/vpu-3.0/vpu30_4v.mbn b/qcom/vpu/vpu30_p4.mbn
similarity index 100%
rename from qcom/vpu-3.0/vpu30_4v.mbn
rename to qcom/vpu/vpu30_p4.mbn
-- 
2.7.4

