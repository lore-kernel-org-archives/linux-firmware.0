Return-Path: <SRS0=LEyG=ZT=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5BEC83F03
	for <linux-firmware@archiver.kernel.org>; Sun,  6 Jul 2025 17:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EE73C4CEED; Sun,  6 Jul 2025 17:13:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FA6FC4CEF2
	for <linux-firmware@kernel.org>; Sun,  6 Jul 2025 17:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FA6FC4CEF2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5667UROA028284
	for <linux-firmware@kernel.org>; Sun, 6 Jul 2025 17:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WfYJjAUzVAx
	V26GmLn8CGIBtM4l4Dr2kT2ZsCoCJ7Rs=; b=JRsJc0nk0u8ORBakAR++uIJ2rVE
	RfL9yINDRZP2VLRSkuceJ2Fop0WLMa8eEKlLIvktGFjQYKzhz3RTUKMjkHsjaGm8
	ZxAI3A2oIU80s2BFpCGdxW/d3A4jS9ElfA96v8DdiLBFrxe42Q2v+8sIXvxEpitA
	RsQDuZoWWg4QDhI8kiqlwB4XiHEK/MVHe7aDb72L9lVJu/aEqi0paSPU7u06CFEK
	6mWIm5BbgWO4WMVIOqLEwEkYCSmZKTf4ORHNodE/8FkYIm8g//YbyYwOVU0Qh8g5
	B6q41fsyZdwbtSrnJL5cM3v4FZXmyZQeBKrxUdKQiT++hXWdRwCQp62QQBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqdq4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 06 Jul 2025 17:13:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d444d21b24so402678385a.1
        for <linux-firmware@kernel.org>; Sun, 06 Jul 2025 10:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751822016; x=1752426816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfYJjAUzVAxV26GmLn8CGIBtM4l4Dr2kT2ZsCoCJ7Rs=;
        b=acdYc8XsgXKe2AXmw8t0qklTVgcJOoz5e8pEwwG3Bjn0MOzSe8JiC6OYFnoUXVUdcB
         BvN+PLiNlGYU5Xwt6WmILBEcEyfy4V6M/ejOnUYC5DDXf48IekW2PAqsTQhzXxGYE1of
         lTL713JSoC/LlskSlqcFMUaqepF8pUi9lVxMOvCiVaL3Y2xGE3N8F2rvE/837X6FEDA0
         bD2zgPSFBebjOxF1ujv1FD3mHB6pTQy81JqqGAFcr++YGKNDHJ5hEcg4GwnQ0GAR/9Bj
         eWKAKQdjl+fd9RbNxnygoSynPclxFZDJ1LLab+NoXhSqcDKjGv4+mKxL2RcSg4/6Db2C
         JrSQ==
X-Gm-Message-State: AOJu0YyxhuDk/2w2GqOaqxmGcVWGmiQmCHwy7F9MEhGwk16PMNpIp0cU
	m8SEqYSS362pRDhCKWEIHhse+qH+1DpXMl1e660iFFb8K8mGbbAYNVE1xiR3Sp00qqXXm0HHqX5
	bpwLy485JnIFlas73Og5iw31Vm+6NU770xo1PNdBog/cW/HVC1d2lJT+bLyAVdFXYWbN4JQECSw
	==
X-Gm-Gg: ASbGnctJVVe/5Mz0MWjqOiTl8cdfQlrMNqbxRLtMbTMlJ1h9NvtzmhVfmgTR/DnG2U8
	UUIal27lMzzd1JrlbeVq+lH2NH1mOqVayGuiJ0x0nCLJsLsTKsCst400xCgdm0Y+WrB7g/RMjIQ
	PDm8oqrScNe7ixwm3WNb0g0BssKcDckPDv3hoYIdPVgpcLovplaRLr4GYDf9w/7iEKR0h7g7wsS
	iJtE0L0wkWyepoeFpgk6c82/0MKoWSsaS90lvQ3b2caYRiNfbvjFHEFC7L7lRGBNdnMDVPyx4KK
	GHCgmoYylvSM2kQofgtMiCooHUWET0YVGXN6cFKYEMbLT11RdVPHbKXkBhc1oumGKln8YG4l
X-Received: by 2002:a05:620a:2682:b0:7d3:c4c7:75d6 with SMTP id af79cd13be357-7d5f16ecd30mr862432785a.47.1751822015900;
        Sun, 06 Jul 2025 10:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp2TQSi0jVekug2dNXalnbUwANxZsadkC+S4/L8QoFt+TjF32+CpL8PPW2MMJsGnetybn5SA==
X-Received: by 2002:a05:620a:2682:b0:7d3:c4c7:75d6 with SMTP id af79cd13be357-7d5f16ecd30mr862429085a.47.1751822015459;
        Sun, 06 Jul 2025 10:13:35 -0700 (PDT)
Received: from rohan.lan (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556382ba9aesm1022051e87.0.2025.07.06.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 10:13:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 3/3] qcom/adreno: document firmware revisions
Date: Sun,  6 Jul 2025 20:13:31 +0300
Message-ID: <20250706171331.78877-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250706171331.78877-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250706171331.78877-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686aaec1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=toZMB1Rz0LQbaM7n1_wA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RNPNard11B6_xwec6q-NlDgAvj8I4NBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDExMCBTYWx0ZWRfX2Xmy9vf6ssJ1
 xIGAwFYAGhe+xJ7/psoJCUY1ucAvcwvykFYl5MXkXjnLbcPQxZoT8MCCahU1DLlPMhyo408futW
 02yu+AfuoD6GlGyXZJe3yx2ylzj4sOOxHr3wNvxIlNGYUMUaLeB6hYxCfWgcP/ZV1crERv8gU1Z
 /EYlRIQDZBenog7UL+xc3cMVl6jDCn3rOoBnBdNvZKaWbn3kk6y++Lln2BJ5Ir+wVAWQW8x+QD3
 HTSHb7SQs3JvgHRRqKgmcD6Y34abkfjO0ZInnSZkkdoIJZRAsLqJFNhV1di2O81+zy7bW06LMyk
 CgZuRNPq6AS8ImU862u/DrkXFZW6qUv45wXJaK8d4S6F6va3WNDk9rKDg2b0183emTcFaJ71k+p
 ziUZvxKlwGkh4GABsxLJXV9OxkYZZ5CUu9ghoUHNTSbClLOBMoEjyfRta0PNZ26kHG4UsRZ/
X-Proofpoint-GUID: RNPNard11B6_xwec6q-NlDgAvj8I4NBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060110

Document known versions for Qualcomm Adreno firmware files.

Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 WHENCE | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/WHENCE b/WHENCE
index d1740c514019..f38e4af6f2a2 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6374,6 +6374,7 @@ File: qcom/a330_pm4.fw
 File: qcom/a420_pfp.fw
 File: qcom/a420_pm4.fw
 File: qcom/a530_pfp.fw
+Version: 1.87.01
 File: qcom/a530_pm4.fw
 File: qcom/a530v3_gpmu.fw2
 File: qcom/apq8096/a530_zap.mbn
@@ -6381,29 +6382,45 @@ Link: qcom/a530_zap.mdt -> apq8096/a530_zap.mbn
 File: qcom/qrb4210/a610_zap.mbn
 File: qcom/qcs615/a612_zap.mbn
 File: qcom/a623_gmu.bin
+Version: v3.06.00
 File: qcom/qcs8300/a623_zap.mbn
+Version: v0.12
 File: qcom/a630_gmu.bin
 File: qcom/a630_sqe.fw
+Version: v2.07
 File: qcom/sdm845/a630_zap.mbn
 File: qcom/a650_gmu.bin
 File: qcom/a650_sqe.fw
+Version: v1.12
 File: qcom/sm8250/a650_zap.mbn
 File: qcom/a660_gmu.bin
+Version: v3.01.0B
 File: qcom/a660_sqe.fw
+Version: v1.12
 File: qcom/qcm6490/a660_zap.mbn
+Version: v0.09
 Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
 Link: qcom/sm8350/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
 File: qcom/a663_gmu.bin
+Version: v3.05.01
 File: qcom/sa8775p/a663_zap.mbn
+Version: v0.09
 File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
 File: qcom/a702_sqe.fw
+Version: v0.47
 File: qcom/qcm2290/a702_zap.mbn
 File: qcom/gen70500_gmu.bin
+Version: v4.03.11
 File: qcom/gen70500_sqe.fw
+Version: v1.62
 File: qcom/x1e80100/gen70500_zap.mbn
+Version: v0.15
 File: qcom/gen71500_gmu.bin
+Version: v4.06.04
 File: qcom/gen71500_sqe.fw
+Version: v1.81
 File: qcom/x1p42100/gen71500_zap.mbn
+Version: v0.13
 
 Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
-- 
2.47.2

