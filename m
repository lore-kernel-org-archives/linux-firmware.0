Return-Path: <SRS0=a3Dy=CW=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F35F9935A
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Apr 2026 09:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6971C2BCAF; Thu, 23 Apr 2026 09:34:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA423C2BCB8
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA423C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uPhO1565879
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pDre3fqdjOkamf7x3mMepc
	ukSyp8a/rM1/O93rbVcDo=; b=F5X7BJ22y9hZetWLMvN4BKFSZoFl1Cdl2VM3fi
	LfGSec16DGMN7d2APEvByPSZqs63nGMfweuHJx7tBXlUi6uBtgMZJZMbCcs9uPDK
	80ZRnzF2qea28iggwcAwcC38xgmoylb5YwnDTO71jjbs5o2dFw2+QrNDccvO6WPN
	rk72OjyRZdr0dNI+nbZe3QqsihoNbVuQ8PCXcP7AAujfVBy7eSaR5Nq+HC3F4+NO
	vHzbARRppzx26veumjw3ozgo5ho+vJxglivPX5FhV1cQRYe3jWAi9+cbK+/cAyPi
	3TWR1d0N8+RMRnhRVrqHTMwMPYK+Et4LpKtuIoDtsYwa0x5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wuag3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:34:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b461b36990so68766485ad.3
        for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936856; x=1777541656; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDre3fqdjOkamf7x3mMepcukSyp8a/rM1/O93rbVcDo=;
        b=FIfhTMu/H1a/RZplKwshvIyttTTCpBe9Znq+t7jlhFDitDTDK7cQAwlBb58CWehOEZ
         /fjA7tUANrpCx8oQVG3v+eMkABdxx+O4FIb2SXUq+8v46PYWLxEeCLqfSXGZYJyuQsjn
         hTTAM9NLW2+ez8FbAyf/+qYxcFdopJEsXakA6km1lPk+NJ6CCcapeOkOjnX+xpIviBe+
         3PGP1+OIw1nPqpZObsdkCdtSCBueIX12b/xsfhk5kpldPW1ooxugjoDSQjo0HDrSY3W2
         1zWrpda+nhlRISDTCZ80CJEbB+gcWLl2to4TXlk9Pm8xtMwC/LyD004nH2UYdtjyxtE0
         jWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936856; x=1777541656;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDre3fqdjOkamf7x3mMepcukSyp8a/rM1/O93rbVcDo=;
        b=ce0gSizg2tAfGiwMgxhXQ3DAqThqigERoZnOTMCf4idMFi8JTL0JX8NIOaDbzKsCWc
         2NtM4yJyfNx4hzliT4uiiSCb9IUObcpjcK4bFGjt0iyshbbW/h+CVO3cyIA+ak4++kzz
         I4lcEu2objEpzo5pmqFlvXfGiqKceO/m9q+5VJkuO1ydSvfe8XWUsWkbx2pMeIaUucfz
         W21kRLTR2/lCvf89u2hpI0Zox4IEknnROFGNR0TQ57Wa630waQ7KyOCUlX24fZWNYxRj
         +I6AY/rnx0MIF5PFK3w+EBoMIoUif/akwIWJqEB6gLFgdkCvb99Wk5bEWoXuiHL6mLiU
         9awA==
X-Gm-Message-State: AOJu0Yy0yf8fRieQQYyuMNhIHIIdNDYsy2QoqTilOzvlVW7nWTXxjKqs
	5wgAir/RT8YPc97jPuOf5zz4XQ2lwoN1hr+sZxiJUMsN+ce5sFSgedCesggrUo6IVqQZzUHdqeN
	FOgP5yANVJT/tIzYZhRtjMw4fsAV6LV0FWldGcxhPQOyPX/AQUySAE87WVUlAh8CEx4U7S6A=
X-Gm-Gg: AeBDiev57Pwjl66uUWLCKpzlD59aDwlemv8KHE5vGTkoLMjQ/WG5gMX3yXJEcVEKvH9
	CQgUZtjDrifrXCr9VOnGjGlUbPzfnIfAeXve5FdRI8dN8MyGZwS+dIGvMbB9ZDnU5WKbmgYHwL1
	4TiMwJqyYC3ZY7CjzzhelLvDEEcuoYai11TXWnQtVVl96GF+wf/pC2ly7nZGdsErjz26bbeQWYy
	Jkx0osouAsYEHbD5jkiBTX/u0qcxdLSzA/0o5qytIszDn/jaw8BFVbOzy8/DpNnHPAuyteKew3F
	Ovk2+rql/LnWmQXQcPfG1DTHccvLWGj3HwOY0wx7c/I9h9McIXNshHdmnuJ3l7Iggrp0Kv10yrA
	V9cLDVbEQMPmF73G74oIm0cJmiJLvmOMmujkYglua3XWcAtcA8G28j+vDYusxBA==
X-Received: by 2002:a17:903:166e:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b5f9e85b42mr280496955ad.6.1776936856116;
        Thu, 23 Apr 2026 02:34:16 -0700 (PDT)
X-Received: by 2002:a17:903:166e:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b5f9e85b42mr280496615ad.6.1776936855605;
        Thu, 23 Apr 2026 02:34:15 -0700 (PDT)
Received: from [10.216.23.234] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b7a9efd0f2sm13877555ad.31.2026.04.23.02.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:34:14 -0700 (PDT)
Message-ID: <4a5c724f-a593-47d2-a271-367fed6fa6ad@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:04:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for Glymur platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MiBTYWx0ZWRfX0zEmKTiaOdIV
 AgGjsElsEd436lf51Hbk/roccbX6N4LsqBCHX50iljo/OyWh72LGCs74R6k+Bvn8aVwxoLjXauY
 jSCGYINjN1ZSQrFM+IXMH+tTEY+52ahFdgW6JCdOW9Cpub4rIyEp7AGY+YaiiA4igfCtdXCEdDt
 u5VWaowiwg0ZNzW3q5WTJBcSMxRLP52dGM1k0WhN5/FJZDGK7aXFTZffWN2al5iz2Cs+PxYHpxt
 f6uCoMfB02GZT21qlwQ9981RPwLYULACMBUgs3JOh3YjLLp76OWYCp4zWAMnNG5Lo7LwoX+ikKn
 ++TC/7aGlUHnQkANyBViKdiNwPp0aRJgt+lCLJXVhN7QJ437YDErS+1y4mQsWZBYT/XU85fOjXP
 ad4wNy8a/bdEKsVsayubrvqOhoLRIr/eEpl02RJwTFFXNuzbuWT9Wm+bzZTUwTGGHYwuzVwD5h3
 cVB+NFovl/g3iEBo99Q==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9e799 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=AovXlVlvWH2HDCExXUgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: EvUGAyLmW4aZ0L2CzJ4l7_cAnWc3RYpe
X-Proofpoint-ORIG-GUID: EvUGAyLmW4aZ0L2CzJ4l7_cAnWc3RYpe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230092


   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-glymur

for you to fetch changes up to 4a74616a3522816f6f33297219f9f27cfa4e3268:

   qcom: Update ADSP firmware for Glymur platform (2026-04-23 12:18:50 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update ADSP firmware for Glymur platform

  WHENCE                   |   2 +-
  qcom/glymur/adsp.mbn     | Bin 18622472 -> 17049560 bytes
  qcom/glymur/adsp_dtb.mbn | Bin 233272 -> 225080 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
