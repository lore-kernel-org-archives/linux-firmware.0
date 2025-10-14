Return-Path: <SRS0=LlTb=4X=oss.qualcomm.com=janaki.thota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD83CCD184
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Oct 2025 17:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A26EC4CEF9; Tue, 14 Oct 2025 17:45:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A258C4CEE7
	for <linux-firmware@kernel.org>; Tue, 14 Oct 2025 17:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A258C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFUZ8B001524
	for <linux-firmware@kernel.org>; Tue, 14 Oct 2025 17:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=cNBq6GswCM8aqUjGLsHuGEUAAQZ2lDqdA2/b3McfK0Q=; b=WD
	rDtaFj2CvbNbV0gwixC0oIWiVJCApiGqjMJnmMfCQecwb1s6p0aTukqRnVLOHFa/
	yo1Mwxw84+qFffZQGLCryyrYk77dM2UNAf1Lxypz2dQAZdyKjcwq3BMWcnEjZrvz
	455Ei0nsublZYdY0PWTIXccYjT96bd5XrTipVRBXjXw1oEJfL1Ze1frxYIZXVmRN
	JnMOTvbBZdUCHmxL1nCZAE0cUefYxRyOQPukEWpX1Lixc9ZicmkbISNXK7Qn/Moz
	Yo/cIWUkX2u9kROGACR8Bbo1Jk51kkeGZq9VN9Kbjrt8n0h22EOsGy7RP35qMMIo
	TEzppP6+OKy55CYIsQFA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk9evu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 14 Oct 2025 17:45:18 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-43f7bca4765so11104612b6e.0
        for <linux-firmware@kernel.org>; Tue, 14 Oct 2025 10:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760463918; x=1761068718;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNBq6GswCM8aqUjGLsHuGEUAAQZ2lDqdA2/b3McfK0Q=;
        b=R5rI/Q7dY7C3CkJOICh5xJ5kLGlkoBgvBLbFZFZ3vZRGBJ3bWIwEr/OBpLOjNlgaiU
         6lmmK1hiRqeM5V2wex/CXX8KPH8vjYV5kaqe1/eWDvAQGhRTJnbiy26cDVw/qlu3GgCZ
         dHJLNPtwtqsWkCZKnYGIXWnxydzdObf9uq8v+HPtMpKlATd8zRrDBbSek89R2R2HQVW+
         1BJIwGbJyiMFJOBfyVIlJ4B9Kjt9lsplA22dtsELJxl3KOGbyDzVy/EKlhDzywcv1pXo
         PWvQV4grUh79Ddpxe7Bzmb89vEj7KmPc9+9m+FS8/fHt3jkDtoH1Ho7wWn/pbDrkqFXh
         eO0w==
X-Gm-Message-State: AOJu0Yx7pTEIKGLSmrceIxhS7+XRKailWEPy1A2Y3Q1WioyXUjqlj3cb
	9tm2flOc8ZWavxivuoNhFGC+fdZC9xEPW3KG3Feujcdku3inCQs+rID2MjTMyWl0kvbwbcrNhL3
	x48oOcuVGy2z1pCIX+V8Xnh3L0pQ1e9dQh0cD2xPHrjQO4W7odpQ/9hqC0YBhxI9S4PqZW61BA0
	UHVuz46Zort7MCaj5weNrEnpAEfwR0PCu2plx0ZezI6/cV6GFc
X-Gm-Gg: ASbGnctACRhn/4+AtRHvNBZvROMuuruPDHzQdnAXkEmBlPrcG0hX3BS71cqnD8Uc1IO
	SXdWmV5FyFJRF8u75RQId52Q3ViBMJs+rDLhM1gUVk01Gi4Ygwawcjr06oxG+nNxtsO2XAsPt1l
	LYxAB8qPm+IBbt3oB858BLOw==
X-Received: by 2002:a05:6808:10c1:b0:43f:ba16:9fa1 with SMTP id 5614622812f47-4417b373864mr11387815b6e.20.1760463917809;
        Tue, 14 Oct 2025 10:45:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG40YAIUU6+Q1AyGUvmQ5D6ZRSCJyLAm73wMNz7XNUZHLsdmDDpsCQwJkuau+mqIo4StjHK2BRwLk4d2zh5nIQ=
X-Received: by 2002:a05:6808:10c1:b0:43f:ba16:9fa1 with SMTP id
 5614622812f47-4417b373864mr11387798b6e.20.1760463917385; Tue, 14 Oct 2025
 10:45:17 -0700 (PDT)
MIME-Version: 1.0
From: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 23:15:05 +0530
X-Gm-Features: AS18NWDhnBVWuv6KwQzSA3EpS5q3_Na1UOcNxBvzAZtXRJnLeuG_AsWUrFbppqQ
Message-ID: <CAPiVHHiGmwSb3L1P=qWBdiRMfM2kSgbCKkirsiGugTsPsh3TwQ@mail.gmail.com>
Subject: [GIT PULL] QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to 2.1.0-00659
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: AfC0W_epRXS_oO49vHxEMNv3X3F3Pix8
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ee8c2e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=CKa_9q0wvlshr40s-_wA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: AfC0W_epRXS_oO49vHxEMNv3X3F3Pix8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzEAbP7U+Wcj+
 q0xpudfqrrx3tREiI0Ga9VHpGMZc9a2t3G2AjfTTMMhxGGLGErHp5dYesslMO5rmQ+KTVFyghFd
 2Jk2cw78VMTIK7RRF7dLa5B+tCGj1Ntdmf6ijcVK2UqY3JMPnSYdAMA71lVLDUUIMzkF0ewkn8U
 tGhuve8pWIc7uAkLxAwIZ4/gMWFDbzNy2FhESyytksen0+fYuIC1llM1lG0sPnZ+BCNIpL5+Ooc
 q9PXbdEotiCT+SYpNpLmh/npIZa5jzTONBOYsvYmRe5UYNLV5IJsCJ8J+Lfi3RViLDLy0v/6qUr
 lPx4+OJpQYGqr4K5Y+S2FNUCNBOrp1cDmcvhnzXHctUUc89xUO7eil5hx3ISqXLwbdbtn1OMBOH
 0Q8d3IbLd5vbG8k3r4vitP12/VriSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Hi linux-firmware maintainers,

Here's a pull request for bluetooth firmware. Please let me know if
 you have any problems.

 The following changes since commit 849bf4412342998d58ef902f3905ebee36e99107:

  Merge branch 'robot/patch-0-1760383836' into 'main' (2025-10-13
19:40:41 +0000)

are available in the Git repository at:

  https://github.com/quicjathot/bt_hsp_fw_2.1.0_00659.git HEAD

for you to fetch changes up to 12f59f02d35d87a76a9f26085ee2f47e678b68cf:

  QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to 2.1.0-00659
(2025-10-14 23:03:42 +0530)

----------------------------------------------------------------
Janaki Ramaiah Thota (1):
      QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to 2.1.0-00659

Thanks,
Janakiramaiah Thota
