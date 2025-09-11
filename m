Return-Path: <SRS0=0Phl=3W=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9B1CA1016
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Sep 2025 11:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE878C4CEF9; Thu, 11 Sep 2025 11:34:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8913C4CEF0
	for <linux-firmware@kernel.org>; Thu, 11 Sep 2025 11:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8913C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBSIng025658
	for <linux-firmware@kernel.org>; Thu, 11 Sep 2025 11:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=andHncVIWo9NmOnA0WUnQp
	8epTa7OUCTOk3ih9UJrIY=; b=kO8sl4s9qA44j05TlRQvdpaBaKPVXA7iHBuuiJ
	sVP+EmOnis0K+y2M3bs/9MQulajpwxSAr9Ty+RkMlNByjTgqJw1FNfvJi5XBR858
	gSs9wTGflVniifMBMZ5Z6JvA7L1sUVfQ+qp7RTBUtvgwgWmlkSPefyrbXq4ECm5A
	/DGs1hD0E2IDK2toJ7w0kL2QyU3JGQhVJvTTnXvlMO21jEvB6x+tG7VKQ6toEOTG
	ZsGCbZtIjcIwWcBrsG++iOCSm9qeq+6YPeJlOVA1mwJ0pO3NnyznV3Fn19CpQwYP
	YYDg3SvXL0XC/u11krH64EVGPqLxzVESTversAtakX/QJ0xA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ybx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Sep 2025 11:34:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244570600a1so4566445ad.1
        for <linux-firmware@kernel.org>; Thu, 11 Sep 2025 04:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757590459; x=1758195259;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=andHncVIWo9NmOnA0WUnQp8epTa7OUCTOk3ih9UJrIY=;
        b=hMmJvj9OAw4va9ydKcGWUKmMK6fc+QV1v/57TZvdXAXpVcNrEwM+8bhLOrdZ2mcGMw
         KE9j8D0Rc5aCY3OEyTrGD3z8/Hn8RL8VzsGHmXnsjbUk6zzksui6mrRF9Cd8T1WWy2hI
         X4jlvGH9Tb3d7mJg0Tgb2E0KOmXzQoqwiOY1F5GdZWsyZCk6qIE4rruJaWAiDfh4b5ao
         +tN5Gi8RjsiPfBEN8IEzzUAcS5zcJmqPsEH34kp0LttyTto3Tk+Q9Qilol1jUo/JA/pL
         ueJpXG2qwiS0yDMbwwaQXC8Lrj8EQuYcRJ2FHFL0vpIkxLhG3o+CR03nCD5Sg3zCpDl0
         aNzA==
X-Gm-Message-State: AOJu0YxqGmHaBaVJ69aJidzq5T4pFVNX4+KifWcevwcv0QUp7cec+FDq
	5UTXb2UWWAKFR+Fd4UPaBbcJx99k2PummBzIFNEWsMH8PEx1y4S59k7SN2ijW3meIQ0KCP+vh8h
	9Oa9xMfbnaJEvGVA9xao6rG+1VLB5SEbMlbxbDLKpXJhdtPYbjy4c12ndxGO+Imj7k3hbIwMLuQ
	==
X-Gm-Gg: ASbGnctXQo8jvWJ1upkR7Tp8HHbcbW5EcZiISVbgFkG0OQdxQx9gL7u/e98tULdeW0c
	mqOa59LXdXjMR4+ozTnnR3LocJrRtHq0p0HiRlhQGh3pxbq8bBrfGg89rPurKB8VttvhJmkpgCw
	gjOPyh2kHHMsnNYqKHY4h8ShUXknFrjG+2NM4QLeQvw75PgiPmzXdRvhkN5XU3xC0vbqQg4UoBc
	x8niX1iVdRAoOkPwJdVwHCIjwsvvTs9nAf+NY6XP7XGG2odjX/NJRGgr7F+BmRSS+NY4/3JEfj3
	ISmv2TJWsiCD0pt2+7i9i1VEDNWeYh0TpdfeRX7sJlNFzDbPIQK8r8sG5iNfOiJc/TwPUQTZ
X-Received: by 2002:a17:903:230a:b0:248:fbba:964b with SMTP id d9443c01a7336-25bac4df2d5mr34424745ad.12.1757590457000;
        Thu, 11 Sep 2025 04:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4DfnzcCzNj1IgeNtY3f9qL2qUH7Y+NLeGZc4uwkS/CTK5adS/WQ6rOjXVuHhsfqV2sEevTA==
X-Received: by 2002:a17:903:230a:b0:248:fbba:964b with SMTP id d9443c01a7336-25bac4df2d5mr34424375ad.12.1757590456459;
        Thu, 11 Sep 2025 04:34:16 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a35bbc0asm1648657a12.1.2025.09.11.04.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:34:16 -0700 (PDT)
Message-ID: <bc6d5804-1967-4b59-8de8-17e8bc2313cf@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 17:04:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: bkumar@qti.qualcomm.com, ekansh.gupta@oss.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DlqHlLjUFxXN-c-nGpYihBlMIkYdI9ce
X-Proofpoint-GUID: DlqHlLjUFxXN-c-nGpYihBlMIkYdI9ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX25kO7gZT7ZL/
 EgEASNdo90MrFYUzH3/CFaEQzHD/H5UNvIC2BD69hcl8QQTE/pEwDc+1uHcDDEsE63W0BF0o58V
 Kmxh523sFmvwdPwHJY33/8h2waJxKN/FxlfKfQnOYlDVz5EF+1FPL2sP9ahjiuWdEF4N1x/QSdq
 +NVj/Es7wiEWhKJQL/uEsXoPa37wzjz1svdhrflhFNIfFaRdYHHpiow4rsxThBKQWUPbl7cFovL
 mNiIavsX9wEoQ4Y/WA+9+VcrQG5gCkg9Je9mPB5pe5lqT5x/38sD6cyvzSaaDTDnpGNLcSDOcdg
 yaO/dsRnTfSA9pXSFJMyQMJCsCzkv4EeM3PFE5G0E/Is6ZjvfcryY/AKRUjz4iTLEWoqdRuL8qF
 NxFO65kP
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2b3bc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=XDZdQkNs_NvRwuYxZQEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

The following changes since commit 4573c02ca0caf001c5ce5dbb62015d588258588b:

   Merge branch 'mt7922' into 'main' (2025-09-09 12:02:45 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-qcs8300-dsp125

for you to fetch changes up to 13410ff8f90a06e2544236b13384f3068d335ac4:

   Updated adsp cdsp and  gpdsp frimware for Qualcomm QCS8300 platform 
(2025-09-11 13:28:42 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       Updated adsp cdsp and  gpdsp frimware for Qualcomm QCS8300 platform

  WHENCE                   |   6 +++---
  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3092480 bytes
  qcom/qcs8300/gpdsp1.mbn  | Bin 0 -> 5844992 bytes
  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
  6 files changed, 54 insertions(+), 3 deletions(-)
  create mode 100644 qcom/qcs8300/gpdsp1.mbn
  create mode 100644 qcom/qcs8300/gpdspr.jsn
  create mode 100644 qcom/qcs8300/gpdspua.jsn
