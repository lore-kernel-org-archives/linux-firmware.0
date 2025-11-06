Return-Path: <SRS0=PI1p=5O=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8F2CCFA13
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Nov 2025 23:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E85CC116C6; Thu,  6 Nov 2025 23:01:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACF41C4CEF7
	for <linux-firmware@kernel.org>; Thu,  6 Nov 2025 23:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ACF41C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6KFkuK3748291
	for <linux-firmware@kernel.org>; Thu, 6 Nov 2025 23:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CkjWRNIGvg7wg6lf09ABy3T6KDnA1TAM4G/cOSSBsS8=; b=az4nIXnolY9aSFQx
	S9C/J9bkgkLq9fgB5bfN9WftfLlmX8Okw8Ao8hIggYe/qovRFIashCwmEmtQVYpZ
	GMlgPpRyvWk+DA0Ldib2veP2d9y6t/n3kzRyK9/dNYeXU9JlGsjw5oyavE4K1p3f
	sif3FwBYZPEJe0Ga4MQAD993fHiNtJaKPFcwd4YkPEvye3e0+kY929fDmIPMkZ++
	UIPzdslpCg47drufj+pDp313GX0IX1SzmONrU9ETGmPlOa2bJ9DNZHvvw/bS6t3q
	oGx4IFpvgLS7wulEa9WGi6PHOT2AUJE8EVACL20jYsnpcJjYmBjq/6JvnZxcWOjB
	2JqVeA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8sy6j5my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Nov 2025 23:01:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-554e68b14cbso96553e0c.3
        for <linux-firmware@kernel.org>; Thu, 06 Nov 2025 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762470113; x=1763074913; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CkjWRNIGvg7wg6lf09ABy3T6KDnA1TAM4G/cOSSBsS8=;
        b=a/E8Z+Xb4AlHZsjSwZ1WR3Lp/nxCR5kFme+ioHliqx3u8Xr+hTFacXaodbtOS6uo7I
         8uIkwTqK4bXQ6vK+vNr52gDHiQvkFbLKKjqZaXbKkDGr43cAKNwgBGPV8N8vg8IhiFFf
         c3HWv5f+QtrxaC9uh2izf9KLtJW3ruFfFi10lHH3nXfkMSRb49/GpZjauOhLpH5599vn
         FRVQySOBE14vENRmVRg8XwKEitVQ+cSZe9NA/WaqdcUdnMCBv6getd7LNCRQW6wXpcJM
         PaSjLDDTS702EGgk/M9A27qZEO+V1J9u1e4JUZoi2IjVBgtfKr3hFWgrQ23l21TvKr4K
         iShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762470113; x=1763074913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CkjWRNIGvg7wg6lf09ABy3T6KDnA1TAM4G/cOSSBsS8=;
        b=fANgUcZWIFHY7s8SbgRL6gtDAIiwQHF9jEvOWIHug48bW8drKsLUoufn/b1jtmduWD
         2+0duEiG/Hs41+oIdWSsflUt3JxShJj4udDlYUHS6jP4ohnFr4dCG6ZR4YfUMnawhEt0
         vY8mli9MMcGvxsVCkGwckd0O61kA5Fup+7AOeid4KlQFL2Hr3oN9QFJjFv/igHHz/bqX
         U7oNvFfiWLiBIupncM9JNk8CnvQuvuvY8w+em5pCNzu1afwZjVH26QdoL02iBIzKe9GV
         W9X1l8RrD/eMwae2PIb5VQp0MrTcvz+vakV3C4pjSCcXT4mOpO93CTfyLOtevagEVE4E
         qMiw==
X-Gm-Message-State: AOJu0YzBnllwaHIDHVtZfscvKI01er4382ZI/59vSuiXlxL4YOjypjQw
	qiR9hyk+78dDm+Ffu7g85xoX9jU1h4rtP4NuERzJrm9siqFVWPtdmwAytzzr8yT6p6veGDbaCJ6
	RZDFtAGBUKAnCoLYY63LMkfFlVMcRlcUaooLYroy/tRKC8fWKXYuZLeWX8W3OuwLCA3+jHMM=
X-Gm-Gg: ASbGncuEoqzyQhy1a0khrtyxpgdAKOXj/vmZGcPWi2wdT2GcbPm0Ved1Urr3BF/o0nB
	8jgSpSKGMsABMlfq1xCXpzwJJtIF6i6QHknD6p42QN4bfHcE8x3eQlHVUfchAP9vUJPbDXOQWGb
	mDDvwwAeyPGx7Tj6I/pNLcFDVPykRrJEuskJH4nNERn03VqP236ZBe0zZLtZ7e+SXMG7g5c8AR/
	01o63d+/IHc6dmUztKQ5HaGc8dVasxxNggZ4a2i49gSlSXOz8rgjTHFvVI6RPpbRTB0ISjdAqrS
	w8BGZ1+R2RAqDdFbT1c3r6ox2ut3cfnmt49mJVvE808Q53lIgkYHHZdiQhBKC2Y9FzBgmsBN4Th
	mOgMLKjr1Pv+npEtvEbwYOxCI9Wm7nBG3AwRJKRxyJ8cYGDHtKrf5Y6T+7BsE/KFmZlPnOalU3l
	WOzcI70cH+pJzl
X-Received: by 2002:a05:6122:3d0b:b0:559:6663:8b1a with SMTP id 71dfb90a1353d-559a3a3e5cemr542119e0c.4.1762470113075;
        Thu, 06 Nov 2025 15:01:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn/EkRzueLnTsteXymnUhMY8JPxAE+Bs9jqLh6pvQ/BjIB00k/YflL9fAtuIAmSpWGhtK6jA==
X-Received: by 2002:a05:6122:3d0b:b0:559:6663:8b1a with SMTP id 71dfb90a1353d-559a3a3e5cemr542036e0c.4.1762470112447;
        Thu, 06 Nov 2025 15:01:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dd771sm8632361fa.29.2025.11.06.15.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:01:51 -0800 (PST)
Date: Fri, 7 Nov 2025 01:01:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add SOCCP firmware for kaanapali platform
Message-ID: <tqmi2r4vyghzl2xrgxx5qkk2rmgyx6c5khybzr6krmtgwnk2m3@uwbjabngohua>
References: <0fe8b17a-977b-48fd-8eca-1fd0b5f15e5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fe8b17a-977b-48fd-8eca-1fd0b5f15e5a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=690d28e2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=hesXoVgocUY6K2JOuuwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=fsdK_YakeE02zTmptMdW:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE4NyBTYWx0ZWRfX5A7JhQBZKHBa
 PqOTjiM01sQdjCx84kkcP4WPCuFNIuj2GAj7fNDaYtSWAn1d3a9cdlHXYdGTD22lgjb+fNSjhhj
 LyR9P5r3Lk2DPCjo3E4wmewf4MOS6DDhHkfdHgXJ7hrJcqQkMgV264Nej7OpFuDzkrwHkuNs+3f
 25pOvlBe75o+vFAqeIiCvkfWEc77J9d1yTJO/36+djBYMCyfrDldgbfFJf+XkNAfTUh/lvV8LVp
 4uJrl6+BRSLiI6Z5dcdW0C58z4BTBFtRkuDFMy6GHIdDhibfZklSO5MhGDbA6hakUOdqnJYDCxI
 8ew2anWCVEfs046dqxBus31NQzNINAHVxgnwQrOGk/mG5/EsA6zVRDy6Nig8Rs3nEWFT3nixhVW
 QjkiezISKLOr17pPHeu56ExcTAlakQ==
X-Proofpoint-ORIG-GUID: cVZ3jiQr7jOmR0U1t8y8PB-9Ic-wNesh
X-Proofpoint-GUID: cVZ3jiQr7jOmR0U1t8y8PB-9Ic-wNesh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060187

On Tue, Nov 04, 2025 at 05:04:43PM +0800, Xin Liu wrote:
> The following changes since commit 4a1728d0f464fbd73560239e2d907f8f3f5614a0:
> 
>   Merge branch 'robot/patch-1-1762131560' into 'main' (2025-11-03 17:39:46
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git soccp-114
> 
> for you to fetch changes up to 08a87b01cf1ff12def895cd1cba418d4d7ff432f:
> 
>   qcom: add SOCCP firmware for kaanapali platform (2025-11-04 16:56:50
> +0800)
> 
> ----------------------------------------------------------------
> Xin Liu (1):
>       qcom: add SOCCP firmware for kaanapali platform
> 

Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/769

-- 
With best wishes
Dmitry
