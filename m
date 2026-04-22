Return-Path: <SRS0=oDsg=CV=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B6FF9B60C
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Apr 2026 10:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8312FC2BCB7; Wed, 22 Apr 2026 10:31:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6097C2BCC9
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 10:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6097C2BCC9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99JC01082404
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 10:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gDK72rrgC9JIRMV1Ia9SRA
	Y8l7RBMYM0+0jhJ+MeK64=; b=icMmP71DXDRc9Z1sID5zzvONh265RMMBIOkZta
	oL9o8s1w75r0vef6xp7xxT50cTmbm6HLt0W1z4g8r7i2M0ziIEi6X0BGhW0fyIaX
	9+FUKsVjdyC9S/JC3TBvH/8EC+O6riFpOE5jAhBJYvvm7BEzGgvgiTUUdczaNi0/
	YBuDMIjWyYRC0B1LNJ1zGsaoFmOUywlZ3ef2JfU8NUR3C/kba7/zPnuuQo6PWFJq
	Hn6bq/Iw9m+ZLhexu/dqpFoz7ZcnuQgHYhzkOKPy/p/8ObA9SSyTDxTF+X4w5JeA
	8P2+d26CRsl1Yi/9iG8LmbJqUcsp4uCFK0TmxyvA2mtZD3lA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng30pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 10:31:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f8bbb4045so3355824b3a.2
        for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 03:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853894; x=1777458694; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDK72rrgC9JIRMV1Ia9SRAY8l7RBMYM0+0jhJ+MeK64=;
        b=CwCS1SeRlbZwwLYrDEffb2BAKdl+mf5O/k9LvayNBnUszcOUYJVhgJ6SLozq0YSCZE
         cv4kA1exFTpWKKg/oMqRg8Eo87pUbUhrVlXXEAkszwUAg8+3Ln4ypd6APl872l4DCNLK
         o6HJfZqlF8PZfAFikxjQaxxZh0yTMC2MFNREeb0eqqGlfiEa2ChZ2+tvuRBG9FYX5BHf
         gaOWjEMH99V2eNQAD32Vxtfc+k8ukoRNlQmxqxGYmeffJiBqgkRPx1NQR3SRP5lTINSw
         7Ne0S+QER5MYbYuAeWx1O7UFbIFLx9aOagOOVzeAWRlk7HWe1CoTrOrE00F8pNjBnUgO
         OkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853894; x=1777458694;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDK72rrgC9JIRMV1Ia9SRAY8l7RBMYM0+0jhJ+MeK64=;
        b=LqfxoiQumWTuRF8wcVnTR/BiMEIOit0BCP9OhEm3AbSqbkcSz58w5H0txw/vk/ha8X
         eipYs0XKcHBslUqprp4Jk6vgSehOSl13cWitwMI/4on6PBr8+lszoC4qRyrefxGVJNp4
         Cb6OzBV7LwZfX6Ti2OxYb+LSibm0lgyKhHTfNWQAWmU4BI1ksYGv4wAU3BKdXk4VdoME
         z9DHk0W1KPu81pFWmGwoWLAzj1skZVUJKvWWQfztMheGs9ZTEgWlQW845IOwiEDDnrnF
         X/A/uzE3OfNYMm45keJUXxaik5Bdj+eb1sV73B2nrDvlwmAvq5Dyf3TdmtxfNBfDJSCr
         x5Zw==
X-Gm-Message-State: AOJu0Ywa0/8T48HFJ61TH06GPzo13jXcm9p37RG2mqIbVL7eJvun+kDX
	pZE1FIo5ljjTScsbifVaT9BFBeLjuf07bEQe8q9ZYthsW1Jc/9vDJdW7kA+X9opau30LL67QmNs
	U0ASuKaPxwEAGZOA1ner15ummT2v7AjePyfmZxg4BmSI39G2M+lsLYmC72mNvoqE9EV2V9BE=
X-Gm-Gg: AeBDiesnulyO2WsrhelRdRNiQhbhZa92cKQ3euCnHvTaFcobK3hTJHw/PpXvYHE0dsO
	W6IJP/ObphEZInpy04PgdVyPV8N0QTFtJCFW4ud080F0jD7dm4jXmw7w+rUNmZQaAyj3CEIUGfL
	0mE/KElQBU1r/PqDD9NzvVACQQ8sU8QHwzVvEQCTKEcY6l3eClvGHbmElloP2yB7FJ9ubQFd905
	b9M+Pb8GfK0ti6b+C0BRDoPd8nOpwnxCRcWgz0lSujWCRLomiHcAL7kafbZiQNCrHbm2yQI8tkr
	14TTDiWYQkM58k83IcxY7jj24u9Iz4v8/AW/T8cpl9nt94TzpYuZqYt4jyNzlTfPfKI1r3SwXUJ
	D7yLyXklMc/Cmts9iDeDgHk0G0u1XDQ3G3QLGeFh6i7wMdFDlfg==
X-Received: by 2002:a05:6a00:1993:b0:82f:6841:8733 with SMTP id d2e1a72fcca58-82f8c998ba9mr23064015b3a.48.1776853893702;
        Wed, 22 Apr 2026 03:31:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:1993:b0:82f:6841:8733 with SMTP id d2e1a72fcca58-82f8c998ba9mr23063980b3a.48.1776853893142;
        Wed, 22 Apr 2026 03:31:33 -0700 (PDT)
Received: from [10.216.23.234] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm18133377b3a.17.2026.04.22.03.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:31:32 -0700 (PDT)
Message-ID: <46b3e445-55d1-44e5-bfeb-061584b6b37a@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:01:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Saddam Patan <saddam.patan@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Add gpdspr.jsn for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8a386 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=MuLD-fxt9wjwros78D8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Rad6KhMk1jg3kczfcNucZdZCVi15MTqk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMCBTYWx0ZWRfXwD4L/7GTK7dy
 Umm74PjtwOsTmzRmTDmVs4VT2blriziDi9covUtIk10nm4RPe7shx2v5lZEE4aatbtRx0t0G/bZ
 s+8wq9qQJWbdViqCuxHG0FE6FCwc5BfBFMnLpgiAosoHwikPGei2pao6MgdXHw+/CU8hRsFYop7
 KcY8BTEhJz6hffZR6WBcy+cMZa6tmJZfoCiIz4UOIl5/PvW8QTfTVQvdIQxlQCs/cqYTSFdI82q
 XHAauHNSJjFcu4kAKogeezShzfEYitDmEPO4eTPzSht2q/+xmaRHuQox/IAHZm1kDy1Sa8m93CV
 MbG/feRTG1uRwGOaIftHGbu7KLpueCSITqULX1DMHI+P8OsRpjCIsq0hmohSNH5kN36EdVsitGN
 4a4OEGliK9Vf2G+afQWrvx3GU+RnR/4vLLWh1n586XhdfKew9wV6Z4iXVMAK3TG/EdTaSQHcB0m
 ctxHy6r4yMYTg2Js2Iw==
X-Proofpoint-ORIG-GUID: Rad6KhMk1jg3kczfcNucZdZCVi15MTqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220100

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-monaco

for you to fetch changes up to 8d12de14b0ba826ee03b0bcc76753630be32f43f:

   qcom: Add gpdspr.jsn for qcs8300 platform (2026-04-22 15:50:51 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Add gpdspr.jsn for qcs8300 platform

  WHENCE                  |  1 +
  qcom/qcs8300/gpdspr.jsn | 22 ++++++++++++++++++++++
  2 files changed, 23 insertions(+)
  create mode 100644 qcom/qcs8300/gpdspr.jsn
