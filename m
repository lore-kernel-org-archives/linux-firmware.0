Return-Path: <SRS0=gDYE=4R=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A8ECAC5BB
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Oct 2025 22:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09937C4CEF8; Wed,  8 Oct 2025 22:45:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0072EC4CEE7
	for <linux-firmware@kernel.org>; Wed,  8 Oct 2025 22:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0072EC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5ejt013811
	for <linux-firmware@kernel.org>; Wed, 8 Oct 2025 22:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kf3jA28822lGZ2KNKXO9wUP4rlQp/aA5glh
	sqiMLr/Q=; b=Kovuyfz6blZjDwhRssPsdFJ/0BDrTpvGIMy2RmNcSiV+s65ora0
	JkwQKTuMJ+gBHLXfZahUBdYxn5v2vnPGN1y6Qxz0FhmcT3zJ90MRxG7zi0yW+HIl
	z+v9OXVDBUV+NVs8TAp9GF78a22TSXBuB4aT+B9BWHGWeb6r3Au+qnvLW5x2nIKC
	IyKBtk0hmvrNj1ZCuAOYeFJD8ceYVqjoU1wachoKZ5+3W5qAIOu3tiS5Lur5DFg+
	PPfHPOi3B4SpuTFDPEkiJGvJFPG782p2r339+ZeECvOfMS87c6QuoymXSrZ7TI9l
	Ypaf5bQtBMo44DtD6PGCzl7pTl6KianLJ/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j0t0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 08 Oct 2025 22:45:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6a41b5b66so13686001cf.1
        for <linux-firmware@kernel.org>; Wed, 08 Oct 2025 15:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759963502; x=1760568302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kf3jA28822lGZ2KNKXO9wUP4rlQp/aA5glhsqiMLr/Q=;
        b=vdun5OBu1k5UJUAfauUntjr1r+J/GKVcfOcnUUojDM1to03VmX6rxReRVOwnzQ5HbY
         y+K3fSlWno7wdcRbsUUNVAGTgWFaJsRiYRcSlIPVo6f49Bm4kuv3cI1AKEyH2SNe0rdG
         tC3xXVYxYdyi2e608YDr1kuVPr45h30Y97VqQT3gq+lc6vSxPgGh4uB0s3o2bHwaS8PJ
         D4ScsEDWjAzU2o2KFk8rOjhes7UtwSjZuNO144PBrsL4PCXfiJm9YjQmewTK8a4PVa6d
         xARh6ultYnx+c+Ux6odK94FozsBSVj9PWYgv7GU4RPL0xnmbPYYSqEiMlcdA1IVGOt2H
         UK0w==
X-Gm-Message-State: AOJu0YzF/sfG44UhHX8pjLlbEKuTUUZW3ysT2Pbjs4dg6H2VNPzpVklj
	iESzozHbT3KbWVNH6+kdTnv9qcIlRMTY4LRapkLpNV4ZOMALTQ01rP6SzNZL3VF6btqrjcmsrbE
	PSl092knTcLc3nKn4XoRXcTug65Worf7Ny3FIS6baeTEQdKvFw6LApWn6WBEPoVnAelXazdg=
X-Gm-Gg: ASbGnct/kd5wdL4yQ1exmlGOqZGX99nCtb4+Wa5Oot2LOWOMuGIFXuiJkX5HWieMC//
	E21Z+XRVsS9X4HMdeTgyWVSvXndYIkv8GXkZRteJt3CWPSno2vmftaNGb7Xpxi8kFidqqYxIoOz
	28pbH0+NdrETZw5234z6ovKldNWGdanXzSWMtBN5nufa3ZjpUr5h137qf51E/oOjqtFjqk7ZYDg
	8bRDq2QokrE7blXXUhy63zIv5vMG4D38+C56/y2S5EkvCANgv4RP5jKGcfN2j45kXZszTA/1f57
	KHOiUTGOHMbe5wG9lF4GzYauJRGUtjMJJrXTnMKuctcmYCefsGR1mYzYhyBmCU5CwRbAWQ5K0Co
	lnaJVUae/LOWIvOeGRa0Z4ybA2JqTlKpA78+ul5Pb1sm5TU21MzVK1r8=
X-Received: by 2002:ac8:5c83:0:b0:4e4:f4cf:23b9 with SMTP id d75a77b69052e-4e6ead67414mr86292931cf.73.1759963502206;
        Wed, 08 Oct 2025 15:45:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRodAgczxpyFjczEs6QOfvMtuiIZNecGa0x3GBqRwGZQpRwZ8laH4dxsILMCldlHXrYyykPw==
X-Received: by 2002:ac8:5c83:0:b0:4e4:f4cf:23b9 with SMTP id d75a77b69052e-4e6ead67414mr86292621cf.73.1759963501704;
        Wed, 08 Oct 2025 15:45:01 -0700 (PDT)
Received: from rohan.lan (2001-14bb-11c-493d-c061-9ee7-3242-6286.rev.dnainternet.fi. [2001:14bb:11c:493d:c061:9ee7:3242:6286])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac1ed81sm431778e87.41.2025.10.08.15.44.59
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 15:45:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH] qcom: add version for A650 GMU firmware
Date: Thu,  9 Oct 2025 01:44:58 +0300
Message-ID: <20251008224458.73348-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4FTKNDab-6kvmse2vFFOb9A8HqKjdZ_0
X-Proofpoint-ORIG-GUID: 4FTKNDab-6kvmse2vFFOb9A8HqKjdZ_0
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e6e970 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=UJPXyfaQmAE5cLHPdS8A:9 a=9Bdy7GEi4qMA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3Lykbw/Lyg+q
 AbFT9JscS8uZ3tcF0mrsdkH3jfuWaCwAWIa0G+3RCOXBBtv2b8eAQmjiQSkex5GK1g+m3vDOIWG
 8G7oboWxYWP7zyPfzfbhXSQLTaDQUuUH9l2z0WrCn/uzaOcNLc2Qo59NyfYArXq4UDkPEi30rkp
 r0w7010q34irpHKwaurk5KOARhT12OLzG07blt4RcWcthv0T+//l7DKh8lE+P9TyXBhylJZJFA8
 iKB6J9zI1CaiGVlchUzeU6ClF9O2HfInf5fwDGhwl2OuUG0a4M837ZrOroBhulrFK0S5pMrLYYh
 cp4WkzEbO9GcVeiVc1SC56LmnZANv9gPTy+cxf/PUzNfAA0DDrH76jj1rya8+2RPcTqbaU01wky
 J0i/qH3qb5M95jA09UFuMe2jkTazhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add version information for Adreno A650 GMU firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index b74af1bc1fbe..7f4042afb3c7 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6481,6 +6481,7 @@ File: qcom/a630_sqe.fw
 Version: v2.07
 File: qcom/sdm845/a630_zap.mbn
 File: qcom/a650_gmu.bin
+Version: v2.1.8
 File: qcom/a650_sqe.fw
 Version: v1.12
 File: qcom/sm8250/a650_zap.mbn
-- 
2.51.0

