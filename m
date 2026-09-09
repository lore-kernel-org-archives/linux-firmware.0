Return-Path: <SRS0=EHhp=HB=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464DFC79FAD
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Sep 2026 12:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D8C91F00A3E; Wed,  9 Sep 2026 12:40:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788957619;
	b=imveOW1m/Q+koZez/pt1vB3OnxCJi6FHkqnHnHT0F6VFTkHsA2RuB+wEpNpDAQByerxj
	 7IKaUUe0U9zdxsOl9zk03PmKMY9JGxnQzYApgPQZdR1rBpfwyoAQZkFb4Xd00AZW/zS/y
	 wKsfT8qIC25xkZGqlgjSTNDzyuSx/OuOAUe35NM/eJ65gfTQD6ksbJXMfTV8VcvwAVpLl
	 D3j8DEcRMZwDJ5IsxNFgMBJK1BVn56m2YeC+2ZFFF95X/AWiEGRIuJi3VbRwCVisTdSnX
	 yBe8QOQhn8TlmuDkgQ574RDikUHP6AFtM3AaySkPSi+MJNKmkRhVhg/5eJlEiJQ/Q+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788957619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+v5UO8ToV48l3ESQFNYjwhiGtoJqJIcIAg2FzlbZQn8=;
	b=YH5iBT6tztqMf0kFOCXdXQ72aCCbMZVLQuy9+9cDyc7uHCAmK1yfM0GBIScAyT1OyFO4
	 HdRAOJ/M9QuSx7SG+KUqv2MscBMoQNMhgcuqYIMoVHAqXCfeXHgyUY3hasiNut9tRvAwR
	 uO4UInN1N3OX2yOo+sdVAkkd4OUAmLGYLtevs/nkwjIVpAkz+/I9fmhVnPPsJfuj/nEsd
	 vj9rmvyPJvp4NFMIkns3ItJtZ4AVnP1GMhMp438amXPf5lHVjwhYmkUM86pDZdGde9H5n
	 Pbsvc5R9TbeAA7C6OUmgpBXhcBX0cXmJtHBi1i6C3AemNWK9+/VfeeMtsNCs/hBS+aw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T3pS8LDJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjkHHoI6;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CBC61F00A3D
	for <linux-firmware@kernel.org>; Wed,  9 Sep 2026 12:40:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T3pS8LDJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjkHHoI6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7CBC61F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoV2N2698515
	for <linux-firmware@kernel.org>; Wed, 9 Sep 2026 12:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+v5UO8ToV48l3ESQFNYjwhiG
	toJqJIcIAg2FzlbZQn8=; b=T3pS8LDJFtD0Ywc1eRTfAR8b6qIaDaSXdysiZ4kW
	HbJVlaoGG7KNyVvR9y8S4xLS6JqjPJ5ALjq3nO9ch1/koDVbc+9namUWYwyZupKH
	s8tvYbpHueM15Fndn1SovNOM/yJyfmTsmPv+tRXAtWR5C+tx5hUuR0ALV/fozNuA
	neaAvclG/QHpXemxmmCXk4fDhtbTwr86DDzFWsYuiVtTxjpgOKlr7BpH4h7uaGjN
	vEDRmoobeU3tz1XlUw7AH4ujo5TPxK0NQUlgnHQy8d06Y/NjSItlv5q3rEMfZ3K0
	0dNuSP/JwZK41zZ1QELeErcVqmb700iGijjcBf2u6CQt8Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh05jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 12:40:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73858d44c8aso1278162137.0
        for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 05:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957617; x=1789562417; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+v5UO8ToV48l3ESQFNYjwhiGtoJqJIcIAg2FzlbZQn8=;
        b=YjkHHoI6cARHFzpQJaMcQ4cAINsEl9c26EvFpghD9hyd7SFKqCt6tWhJEEWKxbFxGf
         u6OAMMZxkbb4NL5bgbU2Rgx1QH0kqxPNfb/L8G01SldjWaI1jPqyCIjoXKLwzTrakUL4
         jWJWhFzqIT2tIH1w9U8KurpXgpgUZ8YlU1tpA9ExWD4GZkqVl4AAXVSX9qXXRq3b2CHA
         F92r876pCxqtnwCiD2zWu5cQR3nBCd7RHTZulDKe2WMFP4LZPrUFvixNYZFI9GO9jFLi
         8IBObSLdFyLs3BVR4ZOKs5s3D5Yp0jvSKtqL0jF/vs2Lsops98uWCnZrphgZah6PjAXg
         rWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957617; x=1789562417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v5UO8ToV48l3ESQFNYjwhiGtoJqJIcIAg2FzlbZQn8=;
        b=egREefvLhRm62nb9A9/g2DEWVKp/APzHBdMDDiNZYWKiMjs4cb+ET2uHvQkUoHFEgD
         R3hPrj33qDFlcAR6vJrcp1HwzKQ4Pq0v7CWWDIjZdmthE5A6nDKV9EXJ4pkQGEXQSLtl
         Pa8rN025wKIc7uJxZSBvR4fK0s7DvfH4/OjeUweQZ1kdGPjH1PfqmyblhxdwvSZEzZcW
         d4r16dQeLbg+cGv12Lli1nI7ybmm7ncTtXqH4kO3gxz7dCdhPWtH3QfLkO7t2NGjIqX/
         B2Tf25ZycV7BmSsCtTMvSiqdigSRYtmRvD6rXwAACtZDGiZodS4j02CVwMFqWF8JsrRx
         yXJw==
X-Gm-Message-State: AFuF++kFIMUowdbXmsL/1wfEf8YWyoN0ABmshY2sMVHf1fCs8IJZf7B3
	TlXsxdOGSotqkNKRazA4ar6ew3ANRH3lAgw+Qq03iLdZ7HZFd+X9xPL6t0UuX8nH2xltzHNFAZS
	KnNye9qi03YPVoLKDqxQPMRTM0Ub3rNKH4XFUjY3lPDB91hzMzNqzun5HwTjb3kI=
X-Gm-Gg: AYBFou02DFJv3pn0Q4NRVFn9Bf8pKL4pQc9KDKdrCLc8U5hmEV8VQur8iSnD/wCA3Yp
	paSXHyR2rdpV3M5ejWdpUUVzlSNMHBHkaVr0O3XuQH0WTLVdNc/jc9oGUXewhBXjyDO4g5vSrZZ
	qXEoSglMgIx6YVxwPkHzvv54BQkyOKeeZqwXf82zy8S1QEnzHqHDmBWViyGxDM6l2lUh691IMSi
	2FMKtYs1HeCjfzezMTxE7faJ48O7leDaHwRaZUkW4yrz0wxatq607Sf9EEOiuhtm5qoFYVZhdI8
	Ap0SGfjo6UbcJWeCuoLJOxS+1eaE8x6TpuwtATp33z+KUd4KNV3GzcnjSmi8kc5t0eBTHh4pANT
	n9Zyf6Lc1F0kWpZS1dciM7wcWBQpPCZs3AJn/Q+8sNOY5tPE2nHhmJtdryKeX9LmzFEWFeciCe3
	iX6fUeP3GqaKya
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id ada2fe7eead31-78a4a68089bmr13533643137.1.1788957616953;
        Wed, 09 Sep 2026 05:40:16 -0700 (PDT)
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id ada2fe7eead31-78a4a68089bmr13533623137.1.1788957616536;
        Wed, 09 Sep 2026 05:40:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6167031f1sm3725940e87.60.2026.09.09.05.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:40:15 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:40:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Subject: Re: Subject: [V2] QCA: Add Bluetooth firmware for WCN7750 on Maili
 platform
Message-ID: <45535zr5qyfi7doh2eyk7cpf536ncqaqzqxkm77jznkzly2caf@kn5gq7wxeffa>
References: <e2681e20-cfda-469a-94df-8f80f4cf56fc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2681e20-cfda-469a-94df-8f80f4cf56fc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX4MRpwfnkuH3/
 /IHCnUImsD8gZrLE1RtIbGJpIHmbjZ8SljthcWSp7+zpM56NhC2TevNN5/4RVy/QeUXn/Cd2qHP
 fSFUjmgD6tuY+d2SaGDqzA9ur0l4gRcuhv+0wOa/pvnTedZqJRIT3Jq9Lgf0LuwQEaAFwR8RrM8
 ZJEYt62a0NIiufjO9O0KCriLjJk/uvON4oQbvp3DvSBsFCvdRZfMwtSNc2fY7bYGmmYEHYGxFza
 EZ4Pz2BdOlW+FQ0XRrFf/0AWJ1qHTjfiVzC3BPYmwTRR16Eb+K785B8SHxQAxn/6mh6/lYv4SDI
 uoS5LXZ8HdbplUVuOe1LeTkCL7T5cUTWrV5JTIkYuP3eLgzsp/W4kcAIIMrtzNZl+43Ic9vxfaS
 XbdKxcOvSVyrA2sYtw1mYrJ15Z9UWlqJmSrkdH2bnDexsjUe8U7C9Xiv31lkbB+bHqw6Yy/kIPe
 H681otINXtDpBVstQjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX0KZJ1hEFMOCY
 KSvUC1RpKK6T8Oozlc3qmML69Q77A6PfoqjqMtwNwUQ//KaHj7ClQAA3XJWYNkFtDs7MrRRnWYl
 a+hnetK401nGCduJzddx1NT2Fu5MrP0=
X-Proofpoint-GUID: lIHonAYm2G22PBrAIRvzrg_iKBZK6Aac
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa153b1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=3k93Aw1IGhuTUJ25zYQA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: lIHonAYm2G22PBrAIRvzrg_iKBZK6Aac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141

On Wed, Sep 09, 2026 at 04:12:46PM +0800, Xiuzhuo Shang wrote:
>                                                                                                                                                           
>   for you to fetch changes up to 240a1135182a9b23cbfbee4427bcfbef21cf8735:                                                                                                                                                                                               [0/1394]
>                                                                                                                                                           
>     QCA: Add Bluetooth firmware for WCN7750 on Maili platform (2026-09-07 22:43:53 +0800)                                                                 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1217


-- 
With best wishes
Dmitry
