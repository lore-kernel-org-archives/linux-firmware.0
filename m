Return-Path: <SRS0=LEyG=ZT=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236A1C83F05
	for <linux-firmware@archiver.kernel.org>; Sun,  6 Jul 2025 17:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 150B3C4CEF2; Sun,  6 Jul 2025 17:13:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FA27C4CEEF
	for <linux-firmware@kernel.org>; Sun,  6 Jul 2025 17:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FA27C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566BDFPU015547
	for <linux-firmware@kernel.org>; Sun, 6 Jul 2025 17:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eWIHN5GOjR1
	htDfDjc4a6+m1ZJbXYnCqUG4ESUAE0x8=; b=HnsPQVM+dq/P1xd8Dtsy26ojIju
	wm509QTzJMubCwHMWLPR6AcwGTa0TC+XWCc7/SQ8hazdGTkxoFoyl2Z197wsuepX
	qj/DO76ZdKRwCD2t3QOvJq7EfEVHFyVxv7aCTOn50UuuV5UqiNvqKfBKfx4N/Lc5
	gyvCEjmLGbRS5w/o3B1YGjvN9d4b+FWAPr/Iz5mSUfrKAbue9sd2olMuUZWvnph8
	o4uz/I+vLSlHJ4xzejopZ764OWPGmc16viNU89P7DLQS/yvLtdg+j3S3kr5kH9Uq
	PW/ZZfAa/s2zGmIQ9DHiRtkX3qgmZVqLUWXvvoi3NdVIy/djL9Ok/BGBGSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xdmvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 06 Jul 2025 17:13:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d446ce0548so414617085a.3
        for <linux-firmware@kernel.org>; Sun, 06 Jul 2025 10:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751822015; x=1752426815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWIHN5GOjR1htDfDjc4a6+m1ZJbXYnCqUG4ESUAE0x8=;
        b=OrmvACs91rn5Oo3Xn2toKkn3sAOr3wNCp3wCVabsXNRxbT6IVSL3JiHtlpm4YY11ED
         yeQa3ORzZNSTGPH9RTQXuyLSsfM92tR/xbVxdqH3Un0OORIH3s6gfe1wvSAeCXgDSKGb
         FeevhDpzPlzkoOnTHoOZbf/uBRScQx/5+KgGYCPEOcLBO/m5jXI+xIDow5P3vCl0m8t0
         eCw6QHEz3Mg+J20uDwdplps52lNz6YPz6igo+QFzrpT0LdbVJ6AJ1lQPHloMNPLvUb8K
         IuzelqgeNXMsHo43KMIf61HJ3/qOKQ+WdrhBcsqzOP+QLaS5ylFykdVNRQdUnyJEwziS
         mrYQ==
X-Gm-Message-State: AOJu0YzddpAtfPhEQHPlZA8z3MS1ogza8b8RJj6u2SaPyZGp4cofOmgH
	zeLoHdFPHAAN4gprZBqUZL+A6juwxHyeyTSn16FSGjMus64WBODNq9/FfAv+iAOxzsAuQHYEuDG
	l0uIYI/f+oKQF+ZBE+VJRX6GKOGEja24dAJjafk36FHhfchZvFsuX1tdepTbqYhaiZk2IQFa8Uw
	==
X-Gm-Gg: ASbGncvYPwu0roThQfJiJRErGXcSKza1rSq1UBLCPYC3BpvPkj1W7r7ebRwqaEmknK8
	XtEV+ZXXI1EaboQnpR1t98LBb27AI1YpmvuCRxCgrUYmfoE88S8hMHmYtDsb5tE/RMJCoQGFINx
	WJFWF7WXaYLxcCxvPqokK+JXLwg/T0usTcO1YnqYz3fSLi/iBWSoUxab3Khz7Q4TRPbFh/Uf1cR
	2FPuXoFFQIn/6JDpXCFYGQXJzSSZvHVbkEOykQ8lENdFaane8cASxrq2huue1kr0M4XMM9LIlqd
	0uZ222MJ20yVcjjySiG14dL79zzAQ30PzTm+zNaX3Bn8by2EzZ0sy1Q+meWN6widt7wqw9R9
X-Received: by 2002:a05:620a:1911:b0:7d2:1199:ac89 with SMTP id af79cd13be357-7d5df152b89mr1386794785a.36.1751822014550;
        Sun, 06 Jul 2025 10:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcFQ1Lcnswd8lupNoJjnUjlbeVNwylN4uin+6Fwnx89RDJesffsMfPKZr6FDHn6rkA78w8Mg==
X-Received: by 2002:a05:620a:1911:b0:7d2:1199:ac89 with SMTP id af79cd13be357-7d5df152b89mr1386790985a.36.1751822014161;
        Sun, 06 Jul 2025 10:13:34 -0700 (PDT)
Received: from rohan.lan (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556382ba9aesm1022051e87.0.2025.07.06.10.13.33
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 10:13:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH 2/3] qcom/adreno: move A610 and A702 ZAP files to Adreno driver section
Date: Sun,  6 Jul 2025 20:13:30 +0300
Message-ID: <20250706171331.78877-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250706171331.78877-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250706171331.78877-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDExMCBTYWx0ZWRfX4YzbESXCRPPn
 2xcjrIQpLNz+y705YzJofT+LnuTQ8l3J9LKSKLFZYmBSwG1pCKMeNRCEq3Lgl3R95kAPmowj6y5
 x8avSizv9l+chJj7XUiJ3JYcl1dBl/MZ9MhqzFve7nYPMPe813YM0UrlugZd7Va9E6sF8gAJNxA
 VqwC3u43ENJyARjwtg36fXOjmmilI5bTIL3HEyjMgaTFZuiwc7LpJQQrIoAeWcuSXn8U0azt7Zb
 4DnAEE2FG0gcpTr5zAqPwJPLwPkvbqNTwDU3YXFFG7afefLmD0PpXC+ErGfyGPPLDEVZ7enyJn7
 vM3vyjORMm/+9imiDcx2GjjdsjBhKv2wl+ftL/Uv+2Y7bM8CyH+irWkSGMhV5dNVUW/bzNrUgqj
 EzsGdGAU0W+36554Z0XejbCdJoPT+b1mijCr+vdF26ETwEX3iJLtujlVFfjaFpIddcn1iG68
X-Proofpoint-ORIG-GUID: BZFCa29VZvhnRknYcE-YzTAv5UTdljyO
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686aaebf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=EbXEDBAxkFbNrIegu08A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BZFCa29VZvhnRknYcE-YzTAv5UTdljyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=952 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060110

qcom/qrb4210/a610_zap.mbn and qcom/qcm2290/a702_zap.mbn are used by the
adreno driver (rather than PAS driver). Move them to the corresponding
section of the WHENCE file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 WHENCE | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/WHENCE b/WHENCE
index 92aeaeae3015..d1740c514019 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6378,6 +6378,7 @@ File: qcom/a530_pm4.fw
 File: qcom/a530v3_gpmu.fw2
 File: qcom/apq8096/a530_zap.mbn
 Link: qcom/a530_zap.mdt -> apq8096/a530_zap.mbn
+File: qcom/qrb4210/a610_zap.mbn
 File: qcom/qcs615/a612_zap.mbn
 File: qcom/a623_gmu.bin
 File: qcom/qcs8300/a623_zap.mbn
@@ -6396,6 +6397,7 @@ File: qcom/a663_gmu.bin
 File: qcom/sa8775p/a663_zap.mbn
 File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
 File: qcom/a702_sqe.fw
+File: qcom/qcm2290/a702_zap.mbn
 File: qcom/gen70500_gmu.bin
 File: qcom/gen70500_sqe.fw
 File: qcom/x1e80100/gen70500_zap.mbn
@@ -6440,7 +6442,6 @@ File: qcom/apq8096/mba.mbn
 File: qcom/apq8096/modem.mbn
 Version: MPSS.TH.2.0.1-00481
 RawFile: qcom/apq8096/modemr.jsn
-File: qcom/qcm2290/a702_zap.mbn
 File: qcom/qcm2290/adsp.mbn
 Version: ADSP.VT.5.4.1.c4-00013-KAMORTA-1
 RawFile: qcom/qcm2290/adspr.jsn
@@ -6467,7 +6468,6 @@ Link: qcom/qcs6490/adspua.jsn -> ../qcm6490/adspua.jsn
 Link: qcom/qcs6490/battmgr.jsn -> ../qcm6490/battmgr.jsn
 Link: qcom/qcs6490/cdsp.mbn -> ../qcm6490/cdsp.mbn
 Link: qcom/qcs6490/cdspr.jsn -> ../qcm6490/cdspr.jsn
-File: qcom/qrb4210/a610_zap.mbn
 File: qcom/qrb4210/adsp.mbn
 Version: ADSP.VT.5.4.1.c4-00013-KAMORTA-1
 RawFile: qcom/qrb4210/adspr.jsn
-- 
2.47.2

