Return-Path: <SRS0=GFt0=6D=oss.qualcomm.com=yushan.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968BDD11183
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Nov 2025 07:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79966C116B1; Thu, 27 Nov 2025 07:35:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8583C113D0
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 07:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8583C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQLl8ko1667784
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 07:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oVwrI4hE7ngvievc1EZpm4
	bxZK/FTx02wkNIYwHg4/c=; b=YW14cuco4tfyapKdMxwTd4D6V+xvtVtKfDLF5d
	xb2qbgpNMA7ayXEvJXycDOtjFD0C/HA1I2MXzbhOOzvaTAVpg5aqYfdK1e5G77n8
	Yvf5eP/x3u1JnL9smtwjd9tD9qvLzM9QMMJVqsf2iqGb7ipxPHnewXlf727pDcmb
	AwIyHA9xudkuueWz3HVmMRxF4rE8OkxJvD4ZS9SWtsUsavpSBTAAYhkLpqFEs6EP
	2opW5S3ke0lybzpfhqVJI8klH7YZEmu16QpfB9pqopyrfh4PUf/C8PKFd5hH+uh9
	dbA/oLHuW3vOv0UUQHq3YTXKiJ8JK7fbev+nLFkixgsOIgVQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmtwrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 07:35:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f8a2ba9eso11979075ad.3
        for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 23:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764228915; x=1764833715; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVwrI4hE7ngvievc1EZpm4bxZK/FTx02wkNIYwHg4/c=;
        b=Q03xzbXGzqG6HvmIU0ykJ24oLFO/9tXBOIVrCLbDVnLK1rVIvTpCqgKONCE61YZEtP
         ugcabviLNs7nVjIYyQ+h2TglSlrlCimWpgDgbBWMMZGNEynFU7FBWf+HeSYB8C4IyzeX
         t7HGBx11PKnln9rkYcl40tgDfyaa9er9/VCS5NXXSjTBTfIxdW1alezkznLofyz5lNEt
         U7OtwORLNWlRkAEEfi+gGMmoAlt847UK72IngOHBgE+hYpr6qY7dTjTdcS6XlQh9lcJa
         bhpbWQUkN3oey7UitwasBU0vbbCcOHYasOtfyiTUc5cgjMYD+dF1RWA2Q85U8SgxGZ7y
         V9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764228915; x=1764833715;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVwrI4hE7ngvievc1EZpm4bxZK/FTx02wkNIYwHg4/c=;
        b=EeoYYh1cLtm6EaJY7EDEbedZ2clkFOoHWm2LMocVkAi7+hlHTVSetrecjw/tAN5wQc
         iCnCmsHaX++hRNV5BPeSLPzeO5jAxfT5VKYUl8FAYYTVId//NG9H+GHAEcrGLJoW7NuD
         KPTDHtbe04IVky9eTbu/1dU7DWk4HbIK6gu06R3q9KPCCkXb4JBhV30pc0vY1ptqgP7E
         ijGANHPhD+VPR6u8lQZutalBN/SBU/oFMCY64rGxmC7X2Y0wh9aXgYlUp33b7L3lVBkj
         G5FHsYjxIG1ghU6haZCJI+ZKhVvMPl/QzV5IaqtNF/IP+ztQ8SrGeiWSnfKSkjBXXMyA
         CP9A==
X-Gm-Message-State: AOJu0YzCLEf7kAqOzUqhexfEXMfA7OG3Jqf0EJ2PzAeg4S/WlfJowqgD
	Cp00ZsLPYt93vLWM+YZP3YA4jDhkytzC7HAtLlRRW9P0zwZl70eddLvm9F1d8/VKAJG05GNU8+H
	3ywlEZwGixOy+noA/ZVxS9Df0+SBkTMw06nxcVvJvDYizVL24cshl6AewK3LPXzFFbtCcDso=
X-Gm-Gg: ASbGncsV0NV7Yq0enPnfGXlAiUdnewllURuA1/b964scnQ4MKWsnfZ6jeqxMbhFDfkX
	vFdt7D1Rq4bH4rL+OxFsL6OWKyb9j1XPyjQEq2eWKK8JDpixoskAW3MkBw3m0HKUseesRe1Yo4l
	4cJCH+oagxA+Va8Pa4AcTlVr+8haKTAojsEPbP0Uhxuo+WIzY2MlfByoVDEsu52i8KmoBd7uxox
	8iTQOPud+ZQsYpCHhOxF5pkzXAkG/vS90FPEI9HEziWh2ge5WgJjajSuth5CpGczMznn+8y38aC
	/i81V00rZDNvzRhr4o5Y9WM24WAW1UgZ8ZwXwqf+fFBS5INJ9u0AFeEIaHWdFzFH/X1BXtnQr8g
	rVPXOelPJ6sHYUb5/BbIIzi7Zs1cOU+P6kR3zAQ1G8o6rVdwz+Aez7FtrinHDXVBP2S3Ea2B2/E
	p+
X-Received: by 2002:a17:902:e548:b0:295:28a4:f0be with SMTP id d9443c01a7336-29b6be8e2ddmr276051745ad.10.1764228914803;
        Wed, 26 Nov 2025 23:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCzmKxPH91dnK6/xD0OWXZsaYzWdTzT0w9g3gD71KoowDQ1Pc0jZbEZNtbcBHlMBk02RSC2Q==
X-Received: by 2002:a17:902:e548:b0:295:28a4:f0be with SMTP id d9443c01a7336-29b6be8e2ddmr276051435ad.10.1764228914267;
        Wed, 26 Nov 2025 23:35:14 -0800 (PST)
Received: from [10.133.33.95] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4142f4sm8483935ad.10.2025.11.26.23.35.12
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 23:35:13 -0800 (PST)
Message-ID: <f1482155-eeff-4885-a3a9-088d53377fbe@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:35:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Yushan Li <yushan.li@oss.qualcomm.com>
Subject: qcom: add ADSP firmware for x1e80100 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=6927ff33 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=sW5-RZx4Uyqg6PA8wXIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1MyBTYWx0ZWRfXxYJPIsAjzz+j
 SxYvhp27a4Abj+JYy1l74KDLFikudeRlUWpvRtkaHNU8FbZ+ZgAenfiyZGhe91mBTZxsoExcJ/L
 Gc3cUgk6NtWRF3bXj6ZB9OMJ9tBWmxdbabddMYRxiVuwSG0qYNuJCBWwKhRxD+2uy5pxIvbv51K
 d5ESEIh/kqyTisEdG6CAb42EzsIusFz++qBvRrzcix9NLGtmKzj1bLCekK621U/XTSotzp0V+Fk
 jWKtsmwHwuj3OnfGifDZyAT4oES5hToa1qgwjhAMgKUSaTCf0/PAeFinmjABuabInta1mhSXib1
 SKb2VEYe9KHrEyXWdg3cE/PwtBXuXz1LTMnN77ZjrBNY5n7jZozarAJYNZmKUaQHyXSdW584/YB
 sfdpsTaARymqDQ58eAV2aDBymrYiRw==
X-Proofpoint-GUID: -__xTpNdA7d7tY6Oc0l_Xc8SCbCFkItK
X-Proofpoint-ORIG-GUID: -__xTpNdA7d7tY6Oc0l_Xc8SCbCFkItK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270053

The following changes since commit 23568a4b942079631c9378011aa0a9b29de19370:

   Merge branch 'intel/guc-v70540' into 'main' (2025-11-25 18:40:29 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
x1e80100-adsp-1126

for you to fetch changes up to 63cbc5f5f40326f5c361f4e0575ffb1564d7f471:

   qcom: add ADSP firmware for x1e80100 platform (2025-11-27 14:08:00 +0800)

----------------------------------------------------------------
Yushan Li (1):
       qcom: add ADSP firmware for x1e80100 platform

  WHENCE                     |  14 +++++++-------
  qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
  3 files changed, 7 insertions(+), 7 deletions(-)

