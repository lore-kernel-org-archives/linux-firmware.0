Return-Path: <SRS0=TV76=GV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E807C61DBD
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Aug 2026 12:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6194D1F00A3A; Fri, 28 Aug 2026 12:52:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787921524;
	b=k4t4FH6jEO8LemfBP3CcK3uCBNKSJqT0eACaITguMCsgb7fyJCdp6mjFdAtdpN3rQMjq
	 wABYfwPlVnyecpFPjVEQJYJpVQdahdFHg8Is3RgvK5cwGp++QDDn8p1NLm3FKketaAADX
	 JuP5E2nKzb4WkOow/nDjoGefN/SQAvYQCmF34bIiu+T9iO24EtQdYqX4QjJhT9p7yFNRq
	 oFJMUUeJ4SnygIAzEjmOnB/zre7FXilRypB2TRUU/H2fuqf1OW5vtlf8waK7bQ2Brck53
	 oYjED/z2vuvjhuF6u+pZBU7/RDQW526VIrpmAWdJ8hzq2qbQhDhiMCn+AJyYpfahyXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787921524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+wGOPsNXRLLE3xqmDeH3IId8aL+9W328Yrkts1EjAzc=;
	b=NLA1AP5h1CekvK6OIUVxyNlAQYWQqohYj9nZP0EAtrA09dvEUfl2Y5j3cJ6ZNtP2vL8k
	 hWE7GqtjDliAAd++3HA6Xhe2VeyQy1FBkOuA+aVMNYaB0FTNcJdgohvw80lZZu6iUBMGn
	 enh0UGPbmy9GI5ETC0l7/WLdPOEZNP4t+UNQHkx5GhcaKtCdjFJH0fujo4nRax8nny8S+
	 a0ZEU0dTybjKanVKyRuIjp1qDIIaIaYdS17fur8xHmmN53r5rLGcxM/xNvVL1ZOif3Lk/
	 wQkhxY+Jugefdhb+dAWKpoEUQbXJwMULxjyegafPvXESh5Z/pcu52ad/+F42a8iaabw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=odj0MsQi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK+jJ8N2;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDA241F000E9
	for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 12:52:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=odj0MsQi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK+jJ8N2
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BDA241F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7Kn52725293
	for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 12:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+wGOPsNXRLLE3xqmDeH3IId8
	aL+9W328Yrkts1EjAzc=; b=odj0MsQiZK8tATymVNvdo6JHOEb/NKXSNbqaMAKR
	pmqowE0911tlZZ4Qg8Uv4rVeXfUmrg8XTIKCpFRYnie6cPaaxEM5Pv4ANIHoTTUQ
	rOrnaWVfd119h/d4gD75g0a75wiSpkLoF+w8nubjDBra384sC3bpTuewztusBoKu
	0HA8+METF7qvUEvVpg93cxncJiaEtNKt95G3zdF+ZfBGBMwMaTIm7fzowb2QQmRb
	YVnGeaB3t3SSa0SrUyNxRxQJMphc5DTuK7UvSgxN5LFDzANUjBb8Sj5WTVKuk44G
	i1yW8SMNP5O8KeS6SyEPMq6Im9kHi+lGZ6UJddZc0ASt/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh0rcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 12:52:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc3bff8bdso4766301cf.3
        for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787921521; x=1788526321; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+wGOPsNXRLLE3xqmDeH3IId8aL+9W328Yrkts1EjAzc=;
        b=IK+jJ8N2PMd34Y+t+zo1EAgdfLNKyEbc/8f9bLlbJj0YnuLB7/QRAGChsQrSaCsx2X
         2V0gsx17f97TIwxvjwFxrrokZhMLVPKTau8bYSlTku0ApFvlngISfwaGCy0Vr8n1NBeb
         kV1YKEMKzse8WdfttUtv7flBWHN4sUviFNs3/tNC36iecnmRNdA4WtN00BOiiG+HbEPw
         l0ajRXk1RKfYo+q0Ahs3y3VkcsfY28t25C37npj7HKZzZJbot3E2ZFAyE+3a4ZkOuznl
         7ta4edd9ZE/cvMAExQ6mXcq3t2gWHxTVfLOoK6AZ/9bjBwMGFuX7TXSvBXIBzN7q2ajy
         ZRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921521; x=1788526321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wGOPsNXRLLE3xqmDeH3IId8aL+9W328Yrkts1EjAzc=;
        b=UrJn+PvXw73h9Xpehq+Uev0g5k5jUy2xyJamMZ06J9NIv8iwc+uCO0Mjkamzal4xGe
         i5JxwYVdaQBd33CEshLwUjCe8I07wnS6RpjOUAJvCiAYuzih4et2BVF9virmGqEZMRIw
         HM1ZznTugdQf4OxyvBxLAfxp5It2NtiVOtLvk7lI1PH1uZLWtCawNoEPYZIJFlq4GtwG
         EjERXNXATp/i53ie34vNz/Q/7BfFisFvvtzg/Y1gR3ytAf5pupERY9SWQQk3C1OzyBF5
         wxW7eCUWBkzgyMjXLy78dMqszXcH0TAk/aMwM8UMBWgo7PcVbz+gc2NDrQSbHLnAcshB
         Q8mg==
X-Gm-Message-State: AFuF++ktjLxndf4gwDXVm8yvkYSbp/XUw8Ha/8XJF8l09aYqrQN988wR
	j109dm07SrSe19t/+W1CMRgrQKFEQZARODOCEhJYDsom6XvR/kjVHx0D9lSPFbNq6B+7gyaJck4
	yCPlTT5ZB7hLQWlXooj+AwgpfhlUH9FY6oV/jvKVK76feckoGtWWnmGcOzfFaQV4=
X-Gm-Gg: AR+sD11EzL7FvyjJZvVO8lFZdd1s2vuQdbjfMokTdWlwgA5f7ep5Io/2h477YokLZHT
	AYMzdTL+D8DFWH5n+xP4nmMvgpIs7YEAH8vwjz5M6n/bi+wQ2TWei3w9kQtsllLl9JPO13EZQEn
	pcWKjlT3irxCObz9vsfxCu3BttwA6f6uymEz0dYp2N+r6jjvq94T5m2f/PnpuNkcQBMGLiC0u+4
	BOa5l77RRgmFsh+urL7YHh7rZoD0yM+1Z0lbye+eSfYYpKV0M65UYo8lVLjsJH+AF4KvbITT2jr
	yjVKXu01jWUad1z+S9lpoqXTKINdlcNvKgQf7xXr4sR78yxh3TMJrspBCE1cI5gfLV+bgHs4ZIS
	/9CRHzfUFaWGJFfz54pmoIQCPUFU5YLVp8eCXRXbCcwJvRTB0AbTM0Pi9abjLFmh2yet1va+qO9
	6HMDGMRSb3UFFo
X-Received: by 2002:a05:622a:e31b:10b0:52f:f072:a1d1 with SMTP id d75a77b69052e-52ff072b2e5mr13496091cf.11.1787921521044;
        Fri, 28 Aug 2026 05:52:01 -0700 (PDT)
X-Received: by 2002:a05:622a:e31b:10b0:52f:f072:a1d1 with SMTP id d75a77b69052e-52ff072b2e5mr13495571cf.11.1787921520580;
        Fri, 28 Aug 2026 05:52:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06995sm379309e87.38.2026.08.28.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:51:58 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:51:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update CDSP firmware for x1e80100 platform
Message-ID: <24lqvoucq4jfp47qdn3ntwd7hqelyqw3wyxpanfwkaeyk6myuf@e3zh7s3yi7nl>
References: <65fce20a-3cf6-44c3-9b43-2b7ed8112bfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65fce20a-3cf6-44c3-9b43-2b7ed8112bfa@oss.qualcomm.com>
X-Proofpoint-GUID: 7ZzuhpfHubiCGstsXhns6Xkn8uTv-RfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExMSBTYWx0ZWRfXwtcm73EsJxCd
 VkGLagCZ2NSSObz7QZqoUnnOj7X5j1QoOEhjEvEeBm0tS+DUhMPpIsRSFky97uRE9b2hF95KamJ
 qke0yY3/KqbgJqUV3f1Lm7NZbYYTcdmaY8AvR2eyYiKxV4W93csxoxlb3byHpgjWBswdT8SxY9Z
 Rxj0tChoPU84y8klKDGMVkgTPNHfago5IeUGMlF9XRnQ1iS1VY1831XpXOMGuMb/Uzk4l6wBtLR
 zHJHPQuRjzzFxNz1Rq1/0sarTOSeXWA1bPbEXhFOHHMI3Ld+WW83I+rrAsnuaI3XeSLmso9xIq2
 qi0rhfuuD5dmG7RuZx6u93t6Z0def7WjWKYe8LCVHiULH53N/vFwEY16IxJjjNrPzHWds4EUEJy
 o+wHVI3RMm+8QM8nCySoPlOudEwO+8t3ysxlBcxtuO1EjXydoEjZ753aeSrUXk9enHaRwzk8Cgj
 wiPTI1ndm2GKgZNYsxQ==
X-Proofpoint-ORIG-GUID: 7ZzuhpfHubiCGstsXhns6Xkn8uTv-RfM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExMSBTYWx0ZWRfX96DrE3dtye5T
 wvfUzFOVsxD1HtUOUNoWKZK1Di90i5hQbLM3RqlMdjPkHgi7obwd8BebMCo2sQn+Pc2HF7z6+pY
 Zm/OoFRvrUsPWDMDBF5tX+zd9OGI29g=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a918472 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=RxFpF409x3T5faziX2gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280111

On Fri, Aug 28, 2026 at 01:26:12PM +0530, Saddam Patan wrote:
> The following changes since commit 89aa3ccb5b67be68c4b15241d8ca666014288afb:
> 
>   Merge branch 'qupv3-fw-nord' into 'main' (2026-08-27 22:42:34 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hamoacdsp94
> 
> for you to fetch changes up to db9b63a5baeddf32fa1635507383adeae997fbc3:
> 
>   qcom: update CDSP firmware for x1e80100 platform (2026-08-28 13:18:10
> +0530)

Merged and pushed out,
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1205

But. This also hasn't been picked up by the robot. I don't know what is
different in your setup vs Venkata's. But if you can't replicate it,
could you please start providing firmware upgrades as merge requests on
GitLab? It's the recommended way anyway.

-- 
With best wishes
Dmitry
