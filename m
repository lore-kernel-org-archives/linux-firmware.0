Return-Path: <SRS0=LEyG=ZT=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BA3C83F05
	for <linux-firmware@archiver.kernel.org>; Sun,  6 Jul 2025 17:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEFDEC4CEEF; Sun,  6 Jul 2025 17:13:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDE1FC4CEED
	for <linux-firmware@kernel.org>; Sun,  6 Jul 2025 17:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BDE1FC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566EibG4029301
	for <linux-firmware@kernel.org>; Sun, 6 Jul 2025 17:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0FeVa86GiCjed2ZfLjjtKxZRfMZzmKV+JXK
	7h9XSSSA=; b=mapyDjacaKquzwzgt7f6jGojPZYn3mwf7MZZYCTxxgJ3l3X7uOm
	sOS1Z/hdT9kBtn0Mx4x8XxzFeEUY+bUAvypyyKFsuJRh0cxbbJfbM8H3YYn0GZet
	p/Fid/7pA9J2PSg6f+DKfWD2V4k1bvPrbnXe7fJC/mW5PvJp16+uYCdrfgnKnVBO
	eI/ANLWbZR1Y+2F3WD7xM4VcoiW1ql3+V5qD8vY3HDrujnrV7Ad2TW2XKRgimIGQ
	+la0m8X/1Y/zvrmuIjy7x1UBFjd9qAmEduyxDW3Yr+EwLhYe6z8wGyuFYBd4gNbB
	QX0Qb3vYSRtpyPqQOz9sCgVJ6nBSYCcwSRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2anj04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 06 Jul 2025 17:13:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f64739so535962185a.0
        for <linux-firmware@kernel.org>; Sun, 06 Jul 2025 10:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751822013; x=1752426813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FeVa86GiCjed2ZfLjjtKxZRfMZzmKV+JXK7h9XSSSA=;
        b=JVWQ+zet2cwQWErFhg5aX7Kf6JkkKbPESvWhB3UvaG5pKqQpOyV5G6hpnp974Yie+T
         l34VUWyHsN2AhCYIero/Y82LySTjsmCOakuKkXj7psHfgjakMopI2bCvoOv7jCscpLnt
         eeWczxQfuQQTDZuFQfH5h23MfIAuVl+22DsJbyLXtcud8cptgP5jd25StONhxGVALDk/
         pCgyXUVwfHFEogu1YYQ2arJVNN/8+QEeHadYloiWU/aMjEDKo7Li05CnIlIXC1HxYRBX
         Z7cLR//qxsNMfduu7rkVFmBGhmxyPFMoPZpr3S6SMF7evq2KCD2w9EG/85qFTYmvnRa8
         3JBg==
X-Gm-Message-State: AOJu0YxrJPluuDD9dpt8e3i2AX0Hcp72O9OXieYoG21aWA3QGzXCYy66
	mE7cLQ0kitrQN9k0ccit2jFbhbCnKX6t9HLnqK3CFhQP3vKKkxGHIjTALc0XzAi9QT7kwi39+55
	5nabcgXnVPkce7oiwKaRGiYkC2MtCMZlpCzLj8xYM4DPO4iY/kBhEi6gVpHnfMt2FzH4mJuARoQ
	==
X-Gm-Gg: ASbGnct3KKQQVpYUDt52+FO9bvXVvbBLABgM/buM7tTCbs8YujVoC71vILh52Val87e
	k5cKNxiqxfY/wiAI9eNZHIPNmqtpPj9oXilmZt8WHQquX9wa2zNSw74+8ORE5wOZyHK2ZWNHP6R
	8KwyxdmE8gI8b+WR9akmMzWvg73w53U34QBbyDmnaRgPp28ucvkEohBoOTM0r3BypnXeVWmMHzM
	F7gXM7q3W4Ji0i+42Qrbb/WePF+J7fmATXkkszgvxzyqE7+6ajGPUPRiVA7J7SN0DGMtn5Bp6Wn
	vz6QArfRZyR6d/+jGnsmfc4Q+MMFPNiQGF2o3eMoiD5NsP7HaaPOpF10cOkq3yMlQkXbFbpL
X-Received: by 2002:a05:620a:4007:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7d5dcc72951mr1411504185a.15.1751822013384;
        Sun, 06 Jul 2025 10:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH4xMB/h503pJ0kjOgW7DpDRp6nvCIHsueIV1hlCZ9rSUL8yP320KF9DKdMIdvyfu8Q8/vRg==
X-Received: by 2002:a05:620a:4007:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7d5dcc72951mr1411500585a.15.1751822012815;
        Sun, 06 Jul 2025 10:13:32 -0700 (PDT)
Received: from rohan.lan (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556382ba9aesm1022051e87.0.2025.07.06.10.13.31
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 10:13:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH 1/3] qcom/adreno: sort entries in WHENCE
Date: Sun,  6 Jul 2025 20:13:29 +0300
Message-ID: <20250706171331.78877-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDExMCBTYWx0ZWRfX1YusA0G4EVak
 kmctHUP17CHxPHAaC9b5VglD+btz4H7a4PU8wuhOTgVBVCv0bT9E6DXi18ZFubkgtDMHYnVkGrJ
 vkqFGQdmkwotS0y9Yvrq2SGsaLUa5gCwS9VD5iI42J4hiiN8UUW6NKGLFYT2MNWeN0aMR7bKIxe
 TGbZnl8CpYgmciBUQxchgzpa/pbxjKu8bzY6RnwoQc04G5LlUse/HuQoROb3frRi0ep0Z8HyJkw
 MvOGmg2y/3c+JYJ5qjFBx/971lXx/INeAQ3uLhUjfqaGt85vUHeT1JYudhDNJfclaxi5DgExg1X
 y5bmB6CkDmXe3XVzCFCyDXZJxpENK1AGhMvPRqwGvPzCpp4ItHkOSOdgez9HbSobd2qq3zpxvgY
 EkIlS2CA2tkD/IX1154M0C8HBePjQRcHExrC09Hz+gjHxib49nYX0LdKQ0h0o/FUONXxFGsG
X-Proofpoint-ORIG-GUID: nDNt7jhWvdmgQjvxb-Vp34_nOve3GtwS
X-Proofpoint-GUID: nDNt7jhWvdmgQjvxb-Vp34_nOve3GtwS
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686aaebe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=R4DPc6-u_QgFn9f3kWEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=942 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060110

Sort entries following the GPU version. Lenovo X13s has Adreno A690,
so its ZAP file is between a663 and a702.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 WHENCE | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/WHENCE b/WHENCE
index f442a94cb423..92aeaeae3015 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6361,6 +6361,8 @@ Licence: Redistributable. See LICENSE.sdma_firmware for details
 
 Driver: adreno - Qualcomm Adreno GPU firmware
 
+File: qcom/leia_pfp_470.fw
+File: qcom/leia_pm4_470.fw
 File: qcom/a225_pfp.fw
 File: qcom/a225_pm4.fw
 File: qcom/a300_pfp.fw
@@ -6376,6 +6378,9 @@ File: qcom/a530_pm4.fw
 File: qcom/a530v3_gpmu.fw2
 File: qcom/apq8096/a530_zap.mbn
 Link: qcom/a530_zap.mdt -> apq8096/a530_zap.mbn
+File: qcom/qcs615/a612_zap.mbn
+File: qcom/a623_gmu.bin
+File: qcom/qcs8300/a623_zap.mbn
 File: qcom/a630_gmu.bin
 File: qcom/a630_sqe.fw
 File: qcom/sdm845/a630_zap.mbn
@@ -6387,18 +6392,13 @@ File: qcom/a660_sqe.fw
 File: qcom/qcm6490/a660_zap.mbn
 Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
 Link: qcom/sm8350/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
-File: qcom/a702_sqe.fw
-File: qcom/leia_pfp_470.fw
-File: qcom/leia_pm4_470.fw
+File: qcom/a663_gmu.bin
+File: qcom/sa8775p/a663_zap.mbn
 File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
+File: qcom/a702_sqe.fw
 File: qcom/gen70500_gmu.bin
 File: qcom/gen70500_sqe.fw
 File: qcom/x1e80100/gen70500_zap.mbn
-File: qcom/a663_gmu.bin
-File: qcom/sa8775p/a663_zap.mbn
-File: qcom/qcs615/a612_zap.mbn
-File: qcom/a623_gmu.bin
-File: qcom/qcs8300/a623_zap.mbn
 File: qcom/gen71500_gmu.bin
 File: qcom/gen71500_sqe.fw
 File: qcom/x1p42100/gen71500_zap.mbn
-- 
2.47.2

