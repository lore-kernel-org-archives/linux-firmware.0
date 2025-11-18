Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C26CCD19A
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 04:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36AAFC2BCB5; Tue, 18 Nov 2025 04:54:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8856BC116B1
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 04:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8856BC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2x82T375824
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 04:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLYY19SVZIexCtRPSuN3MFAe2SEhK8DkAb5AbFLSD8w=; b=hl6ZPafOYkE4xBtE
	lFn4aXJDbFdtu90ZDHIRL3BeLuKBPt5LwAHdSCDHpGRbJBlaUJ+C+Ups44CUhx/j
	vxQ06Mg0D8ca64cNP9zLQIe3U8S2sxqNjYpkCU0l9wVpStszyKjLeJMqYkl5h2qt
	wDUBfDoB5NSpNn2N7dJz0OXhVY+OwHgdAttUkg13JlJOB8u3eih6rtsfp0t+j/dA
	7vL6GEOhdAptT2jkC/P5thLaCMSJaDI/8LKWHyxN6HRk6iynjuVa1JV1EhTiKhdH
	NhDEe+/e9/A2wtJR1mLaSm+I2m59D77R+1z+CW1R+mfF7QyaENUMcHuYSBqqjwMd
	+71nGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nhtrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 04:54:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297df52c960so132331255ad.1
        for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 20:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763441647; x=1764046447; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lLYY19SVZIexCtRPSuN3MFAe2SEhK8DkAb5AbFLSD8w=;
        b=TAgZ/E9m+HEC8BQwVT/oWpnXs1BXacrbrvGgEIyWkVkd0/cUixfXFaKUl+lheXxWkP
         1DUp+ia4A/4V2UU4UDcp9FT+yACRizeHkZRsj/zaUr9J4mhuwhr3MJgyo0TiE0JHAIww
         i7+g+BUpNlI03nAXe2bk9AaWg96m4/PZLyViY+D+ib3VtaIcC2tnSrNpEu1ruIDyDu2N
         uEfUdQvjLBk3/E3H8gyuO+5yul/aelZ/mo4th3hBm54ftSvT4zTdG60RTs7QBCrblBdl
         0gvOM4Nc/6YOKLN7KMSn3pW/a1Q6jFPPtxticpXAATWkPXSZxh2ypKk0MDjKm1UQTP0j
         kFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763441647; x=1764046447;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLYY19SVZIexCtRPSuN3MFAe2SEhK8DkAb5AbFLSD8w=;
        b=s3iU4g9jOj0nROnZI/GOkZlRG74NrpkM5/+ZWSd5XhMTuj+L2K5XomuGgt0JYfTZ3R
         3W2CY5SPGtN+83c6Xel1UvFOXqNvcsCkNKSu0lojIYVKuIkI/ImrglEu5uAQcv6iFlEP
         PIsAiq607hgGX/+u0ASzhfZqjWpAuYwJa9OYLIJW4QTWC92u2fWADgDhjXPM2PiGYuGV
         vp40+ikRCdWg0pNZdOMYGuGoFISxzABj/MeN28yLrpsiw5cAQokQ/v5k6cyXf7sFarQU
         ZLq9rjzftLgG/pBIcb36UngNwt1yt463NMM3fc1APGFaAr5B35WhazctPR2ZSJJnf0nx
         WVfA==
X-Gm-Message-State: AOJu0YzpgHuKreKvWfn4brUDjQbOGXsPW7N3pkoceLjf2KB7oajBcEV/
	uTT1Wbk3MMVAOigB8VVC59NB2UsizOqoaI9XJb7rHTfqnqW05paCHm4qeudpl6IAKLwLcEeFUDH
	StrAMkJbUEMBFjK4l6B1lp5xbRKgLL0ZHftIjsUiyhvmKrinGSTlcLcr/TG6yRypLYR7APKY=
X-Gm-Gg: ASbGnctB6GWeJr5vZhEpteV5bkBGbuyPC4cD0nMFvZG9NgjOXrS1gsDRxtmKg6kYNMK
	2if9XvjaXmmOWLHHLOcYBFj2L0/AZ7NO8hhEMsXlZYPvYdUYS1GObBpeSeHG4zzO9Ba9Rdia/Ux
	W6atHlVo1gWSlYbKf0HUl9omzF8rfSkyrJXBymsyffLkbf2EoDXt9IsyB9pbLJxQtqa6WfP2Orq
	b891zo1IQSccGZw8dn6Qtw297zuLuXbtWePeLdk3f/hngBasNXCwQoFtK8YGBLYub4XlXNqEJbL
	Rc0t9aYlAIkVhurA44R8qDCIwhSI0CQMLiyo4TlvNyGT+PD7jREUaRt0zOIbOjtfypBayYimjEB
	JVQsY64R8b+CWwFYsnMGNiPmyFeAM
X-Received: by 2002:a17:903:19c7:b0:298:43f4:cc51 with SMTP id d9443c01a7336-2986a781adbmr177469175ad.60.1763441647307;
        Mon, 17 Nov 2025 20:54:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuoneKF6m8F62HYxNUlcKn37ztaHp1RcAE0lrfyICyadz6zagXKadbAxB9jlOM7WwMGI0KdA==
X-Received: by 2002:a17:903:19c7:b0:298:43f4:cc51 with SMTP id d9443c01a7336-2986a781adbmr177468945ad.60.1763441646817;
        Mon, 17 Nov 2025 20:54:06 -0800 (PST)
Received: from [10.204.86.168] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07952f8sm20153460a91.9.2025.11.17.20.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 20:54:06 -0800 (PST)
Message-ID: <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:24:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzNiBTYWx0ZWRfXwNH0DF+/DVZC
 +DgYHnYAJ6AowfkvRuFnrxNSa59HF8AHSXIsy7iN9ep63mwMTJZ5+RIr6uBvf1VRBpqAoHGZoqi
 4tR2KC61Id957MojBU69qUZjdpx3MwP/5oXQWF/yU/AoB7QAFmocZXW8gb3YZRj361387a19FnJ
 2E+6KlUmUsLL2RKrVEKS/BNi6JBaAdZha5ZJZEdyZ/iBmp9Fj/m4xd3QRfk3xSuYOB42lHDWXjy
 6eLH4YDxqFPWEtpN0k2E2+YD+dLzYshDXJSJwmIvzqWQ4KO/eOVCsGBtIoThMJW5LSNthMfmxJz
 0HPsE50XNnLmaphI1tzsiltCWRLdkh1nHPcvLw8aSamLvOyOWdft9n2rD5NTAd5VEcWGhM3FDQx
 FmYPo+sjymmyuaBHJZZmwsif1ydjvw==
X-Proofpoint-GUID: Kp6mvOTKG5axxxdxxl1k0Ce-TdS7r7VG
X-Proofpoint-ORIG-GUID: Kp6mvOTKG5axxxdxxl1k0Ce-TdS7r7VG
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691bfbf0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=wANDPbot73fbpfn_ViMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180036

The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:

   Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-kaanapali

for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:

   qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18 
10:20:00 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update ADSP, CDSP firmware for kaanapali platform

  WHENCE                      |   4 ++--
  qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
  qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
  qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
  qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
  5 files changed, 2 insertions(+), 2 deletions(-)


On 11/18/2025 9:38 AM, Venkata Kota wrote:
> The following changes since commit 
> 53adb2085ca81337df2db20b96898b1980e310ff:
> 
>    Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> 
> are available in the Git repository at:
> 
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp- 
> fw-kaanapali
> 
> for you to fetch changes up to e1e4657026b4b6d9468e30d452434712f050c6a8:
> 
>    qcom: update ADSP firmware for kaanapali platform (2025-11-18 
> 09:34:47 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: update ADSP firmware for kaanapali platform
> 
>   WHENCE                      |   2 +-
>   qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>   qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>   3 files changed, 1 insertion(+), 1 deletion(-)

