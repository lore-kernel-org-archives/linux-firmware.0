Return-Path: <SRS0=8enH=35=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD701CAC59A
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 02:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3554C4CEF9; Thu, 18 Sep 2025 02:37:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B416DC4CEF5
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 02:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B416DC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGJ4IJ026798
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 02:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4liDG4tGPpik3TAeKWe+8/lstrSBUnv4yDF
	B/758K5c=; b=ilRoz9MhaUSj4b5slBTtYD6yqAJpUg/3t8BvBIKDr7i8rqW9lSB
	Y+aN+qoGHJy1+0kMCxky3r127WE/VddR7BziHvnnLULSuCchbpDbp2+DxuqYLwTk
	zNV7c/MxDrWa2YyKZXGPMKjJ6mBanubm1fmcSmVSx/lelv5b4QzNejg+QAjwktai
	t7eva4OE/rxe8tWVHPZOaRSG3uSK0gvfCaXRmiV3Ec/4rlCYckLxNmtyu1sMTgGq
	fzyDHhig1LawaU5gDxlVsMAFvcLxtOw7Lf+8Bz7UJPaBGN8D/GkSl4iuKKh1jpJE
	Ia8iTJKR8rBezuZpEMmF8F88dsiflu5EdwQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt4ndr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 02:37:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b60dd9634dso9327991cf.2
        for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 19:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758163038; x=1758767838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4liDG4tGPpik3TAeKWe+8/lstrSBUnv4yDFB/758K5c=;
        b=VIq0oJi5xySe4dYxGRIRKWbmxkp4Dk4QECst98RxB8W/o8F3PXGLVJP4DbyVTYu3Kj
         vOw/lM0OmhLJXg5c7KA8KVtKI5AW+6unMbI25NcSUNKaTVHBUt7aIBcz2ON2gyDGlyba
         cYvr7sJoVSv6swOelmHppKKYzjxkokCsqA/BaF97L/ZFA9O4wj3x/Ir3hJyT8ytYzPsQ
         cJ2TDN0Tq/tzkpz85jtgaHlVPV2bZQQuNm4OVk7JmWJXFnGD7cnPVZiRjdKkbooyPFix
         vFJRb2zh8O5ofy9ZcAa1EQxVMXH7XLzJv+sai71ViQGyPWVL5DL7paoMtrr1HM+y0Mky
         LgqA==
X-Gm-Message-State: AOJu0Yz6/1YZ0eiC71I019QMzk+Ei8+gTtEyiSW/YDRGPFrsSjfEtm5W
	Yhuk8VP0HNpcNYwXgUw+EDRzgKUdL7T/hXJkTBFboXwfFOvp/ovk0BhLzMJsX6V28JByJvgIu8J
	JpXcFlpjDGSKp6ycgkti4csYqv2Cj2LXXSmZLxB4uUiV5WwIPb4LyEB3qcRxDoK9yMC6faso=
X-Gm-Gg: ASbGncti/gCdgLih0ugeb8RMGDwC1QW/Ri+yZrpuCfhmRipFrZJzw7ZE1xNF1Pvcu0i
	JwQ9MLb8wde1YlJguAZDO11+8Pegzp2x2JH8/6kOFkDCu9Et9DOeupiZEYA/pU78fC23nRK9BK7
	rAkXHquEToIGtHAqxHwDz1SWq355FpQRk6KKdN7rvrfX2UtjoxHOn3qj3ml+HjKQ/P+b7tDytRx
	Ze3Qf2nZMbPhrubaNj78ok3RJCajYjQ1KUavKfE2rLhNGqjx3I/Ma9l5UQ6flly/CJQnWb/pp7u
	XuvIHqQxKRaPLs45I/9XCvK4Q+2RVyPmHeqs4UYr+bKUnn1C86V7UmQCLzfbhDvyRtlLRKVgZaW
	crDPJ54+2iKBOE3+Vtv8eA76kS60rV7Dx6pfxtG8N2wTBP1sW1jnk
X-Received: by 2002:a05:622a:110f:b0:4b7:a7a3:617b with SMTP id d75a77b69052e-4ba66d12d70mr47973751cf.20.1758163037619;
        Wed, 17 Sep 2025 19:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8AFt0DsUoV/FLTpkbB5CNhnO5wcNFrb/cTXMVw6ovYTw28X0GZECBzvqJaCrURGXBkMmRtw==
X-Received: by 2002:a05:622a:110f:b0:4b7:a7a3:617b with SMTP id d75a77b69052e-4ba66d12d70mr47973541cf.20.1758163036966;
        Wed, 17 Sep 2025 19:37:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a68e87f3sm304377e87.59.2025.09.17.19.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 19:37:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH] qcom: move LEMANS EVK firmware to correct location
Date: Thu, 18 Sep 2025 05:37:13 +0300
Message-ID: <20250918023713.1504758-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xxG29UE5QGRAc4d8nWNko3pKyKf4OfK_
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cb705f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=-vgWLsOrbzkHSLGbejwA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0YPdzn3Gh/jT
 VO7WXVJMCqhFzc+NnOdzt8SuCAcOiUiw9PhTdwA+2v+j6gQd7VL8lPMjABnJaMA5bA7RaUXl8dA
 NbhwiezdiMIrR+kCIzGT5rhZW+x+JPC/sl1hloziZjOb016c5FJRslCPVRgdTU2/OFlbWEmbDBe
 X+pZAN4cSdFH9j+kh7yi3Admp6wqLd7XTOr9pBlnf72IIFU7iK8smA1mjN3Y46QtlqTsOr8I1YZ
 W/fZTXgopoU2FfQVpzrMdJj60HK1wAxFTF1Cf1NATnK8uz1l3gl3hEzlo/gQYLUnabeCylUxJUb
 RaJv5U9mmo/Twui+Zz60jDst7fMpk26dS5KSy3a4m74jK0wtxIkCmxXgIIBX8QxG1lnK7mJDtqv
 t86mMKSV
X-Proofpoint-ORIG-GUID: xxG29UE5QGRAc4d8nWNko3pKyKf4OfK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

All firmware for the Lemans platform is located under qcom/sa8775p/
subdir. Move audio topology for Lemans EVK to the same location and
provide (ugh) backwards-compatible symlink.

Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 WHENCE                                        |   3 ++-
 qcom/{qcs9100 => sa8775p}/LEMANS-EVK-tplg.bin | Bin
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename qcom/{qcs9100 => sa8775p}/LEMANS-EVK-tplg.bin (100%)

diff --git a/WHENCE b/WHENCE
index a93effa5008b..e22d8218959f 100644
--- a/WHENCE
+++ b/WHENCE
@@ -8469,7 +8469,8 @@ Originates from https://github.com/linux-msm/audioreach-topology.git
 --------------------------------------------------------------------------
 
 Driver: qcom-qcs9100 - Qualcomm ASoC topology
-File: qcom/qcs9100/LEMANS-EVK-tplg.bin
+File: qcom/sa8775p/LEMANS-EVK-tplg.bin
+Link: qcom/qcs9100/LEMANS-EVK-tplg.bin -> ../sa8775p/LEMANS-EVK-tplg.bin
 Version: v0.1.0
 
 Licence: Redistributable. See LICENCE.linaro for details
diff --git a/qcom/qcs9100/LEMANS-EVK-tplg.bin b/qcom/sa8775p/LEMANS-EVK-tplg.bin
similarity index 100%
rename from qcom/qcs9100/LEMANS-EVK-tplg.bin
rename to qcom/sa8775p/LEMANS-EVK-tplg.bin
-- 
2.47.3

