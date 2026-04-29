Return-Path: <SRS0=VOkD=C4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AFEFF8867
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Apr 2026 12:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37679C2BCB8; Wed, 29 Apr 2026 12:39:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 451ACC19425
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 451ACC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q3s32095332
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3kB9mRasWBVWLLpGi8yTO/Lc
	L8eAIYK+VM7L3Bbjaiw=; b=WncebXEC/wvWh0C3EdQ49qpWzjGoggkgMuDOKk1k
	bkzBwGwzXLooNTkjI2bzaSt29gPfAon7H8padf45QXZuIFLfoCfxAzGdMyexQetf
	qy52gu+LS/E+nIyYBGZjW4IjdbMdV0FToIuGZjb7BL0ibGJrIgFrD784nGeIKr1U
	+cxsp32wd3fwjc9f0oAGl7J2r9LECycjkqmMl9cL8319Kp2PdwvQOecuwe9ihrH9
	hBTEbSJOIjIzRk7FvAGSFzB5VD6PuERctgfz1EHRzxUgULAiiUubUWIh8UounGqi
	q/CL2tJqhT4GeELBUnY7z+n2bHBJHQwcx/6743w/3BNXrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3s9yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:38:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so342274311cf.0
        for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777466333; x=1778071133; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3kB9mRasWBVWLLpGi8yTO/LcL8eAIYK+VM7L3Bbjaiw=;
        b=ZYelgPYz89op6wOs0Xcb4Yd274f0cR4ptT1dXfVe8Qre1dT4rqpMlzhko32t8yTwgm
         KHnjsanTumarhvINfhsR8Y/352WQqD1kOZaqUiPW+8xI0VP/1+Avpj2HBh1kIx5+4gre
         GlgcfwtaRvETN49/UWTq8tqOxLxQ20dFp4zXsZLfSIaSBHaHCJV35a2hZU/QzJBe+Fw0
         uo2YrSWyrNBmUn5Ydq7Q1F4w/TWmArM6lJtsFnix5pPe6mpHqnHIBXNTwFDkdd+ZoG8s
         Wumc/EjJsKtyy1088xpn8d5AWbo44X85J8m7hK0dUFVcF8dQJ3dSdVpx5PiVJlAi5Ar6
         nchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466333; x=1778071133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kB9mRasWBVWLLpGi8yTO/LcL8eAIYK+VM7L3Bbjaiw=;
        b=e9D1OoWVOQGtj4JpH0CkBmOXL3l6VAWir/kc8cCFW9pvGGPnqwgcZ0C5tIV5Wa8RCT
         iWTzPO39S5FpxHN8JONo6Knihx3ed9iTYVfyJdNwuRuLRRxJjxOEQ5v66lRMY3uyly/t
         7iel+wWJtGTlb+ldm2pS9TBg4d6EX4vOarUJyb7HAcLCJBow4oPESCLaFv5vyEhwax2A
         t1eu2+4eoaPe++av1xs4yjo8jcolUYGZMgQVuqPYwTMh72BPc5vvhmC6Ov3BTTVwXzow
         vk1+J8aKH5qNlp7L/ben9siRwKTh89eSrJdz+4wF4MFBWo/JHIPLZnfv/TcRtp5XAmvK
         YqsA==
X-Gm-Message-State: AOJu0Yw8wfgYeguWtK3Eynglxa7azlwpM6IWvHcDg/ThYiELOpxtw3p0
	4Tg8b0mhtydBw2PRPbMStN+vBcc39wvchfJ06FA1sswr1NVboE8e/yf5139NXj6esnN6QYlOcrt
	fZMxWYwrfK9lHs1hrCCIAqTGf9hLCLc7NYvYBl5dRg8uu+8zd75XBHIatqlGQb90=
X-Gm-Gg: AeBDietTYrWXp4cSd0Lrbzb1TzUWrxqH9JQTdWf6g/141jLnvREKa1BJ43LA8Ng/lac
	G/taVDMmAGGha5EvnpRY/SYh0Y0LidjkWOLA0HAV4HXa4tQccyvp1h5F2m47HTJp8jwnHY18S+W
	iMwcVUmz+CDvZM+X7m7/rAuEreFqJSPVsWufVJJHmIMWSDQ4pEcUpnKfiY4B9wF7/XFgwCMy+c6
	Brup7qiXRiZkm+ecu0bhz7IohV4tsNeoMkf3ACa4s/ecS4frpiWX1k1O6a+DJksdRDQcS9DFepV
	Rcmjo8HWTNYRJaUJZh/hnhpSDP0XrpUZXLsrCBEgqACDMrMAuWFDfkrMrPap1gV7ka/y4znupk8
	fTIzguHhZqvkue0Sol7m09jkpctIqcQjX4bZJeFEaBUej4j+irgFLKwqDHi+5gp9m6KMyNZRxZQ
	2icW0KTnexBCSduT+hFDaPqh9melN0l2kpMJluCBPgqupx2A==
X-Received: by 2002:ac8:5796:0:b0:50d:8350:9a15 with SMTP id d75a77b69052e-5101854b052mr52485211cf.0.1777466333414;
        Wed, 29 Apr 2026 05:38:53 -0700 (PDT)
X-Received: by 2002:ac8:5796:0:b0:50d:8350:9a15 with SMTP id d75a77b69052e-5101854b052mr52484871cf.0.1777466332945;
        Wed, 29 Apr 2026 05:38:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756d26sm521183e87.49.2026.04.29.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:38:51 -0700 (PDT)
Date: Wed, 29 Apr 2026 15:38:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP firmware for x1e80100 platform
Message-ID: <2yykgu4jhorxmzlgfqlz7iqumb7hf3ghod3pkldzqoqsiymfit@yhnr4rht5mao>
References: <8c1f05f3-12a7-4ba4-a30e-6f7de93fdf3b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c1f05f3-12a7-4ba4-a30e-6f7de93fdf3b@oss.qualcomm.com>
X-Proofpoint-GUID: lg0EvEH1ZKMChEsp01eKr-j1gwm1tpYj
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1fbde cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=cfFg3YOhIKUW4U9Fo6YA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: lg0EvEH1ZKMChEsp01eKr-j1gwm1tpYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyOCBTYWx0ZWRfX+gdbXafKdkOM
 T+Uhk3og4vPTFlQNePg8ACKwpItEHeapY1vfq7/MykLLVPhXTgAnwiR+pRGKS2m7pXhtaZDzN89
 eSRuR4WukUef7umlmLE8WaGhJkM0ocDHUQIKL2i7pV1VhBeA4oP2SU3QOieNWYoVW0pD657vqYO
 +/+iCad4HpdfAuAfurjoxeDGk1Swj48JH58mEz58QugGmWUT0eFo4qkIQdnqahF003QEmLQeR7M
 25WGlTOmlvLXTybCNTdG4U0QSt1UsX2wLWbrEXtIHgIiskN33oc15QIbgsHiZLq0S4M07ABm/sM
 9HdceI0ibYW/VZ4caGZLSkTD40Kc1E+0W+oKGjVV8pcVI+uWA41AfhJlrsv8Qds8y+uUMUSN6vY
 z5xS0FcCc5FvD12PUtMLZ72NBUVqls2fHslU0G8uQnW60YdTQIhR3BIKglDUGXaBnIk39DAo4me
 oOHryTFOoRnHZJ2q9zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290128

On Wed, Apr 29, 2026 at 04:04:17PM +0530, Saddam Patan wrote:
> The following changes since commit 5b50ca02f586e0e44820d1b98d6c7fabc465b2d2:
> 
>   Merge branch 'dell-notice' into 'main' (2026-04-28 17:26:03 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hamoaadsp
> 
> for you to fetch changes up to 66976b75fc8fb85382796bc6830a65df92fa2d8f:
> 
>   qcom: update ADSP firmware for x1e80100 platform (2026-04-29 16:00:20
> +0530)

Merged and pushed out. In future please try providing at least a minimal
changelog to let distributions and users understand the if they need to
upgrade the firmware or not.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1027

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP firmware for x1e80100 platform
> 
>  WHENCE                     |   2 +-
>  qcom/x1e80100/adsp.mbn     | Bin 22452664 -> 17922440 bytes
>  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
