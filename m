Return-Path: <SRS0=ZRYJ=GU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EF7C61DCD
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Aug 2026 22:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CD1C1F000E9; Thu, 27 Aug 2026 22:19:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787869144;
	b=SVzlmhlkQM1IM1ewTbFoffwd5KqTs47rtBRVetPul+KALNGXx7NqHD+P1uD8UE24OVeB
	 TbUV1Bfrt8qFRNUi5CRnZkbx3VK33+LMByv/IudQRAzxkN1JU2yjY0A/QxOAaPJHeMrzk
	 vIqcUAPszkFOxGnaRTzqU4nLBz7rrtVidTSNt5S0gKT5xWnRz0shtkVcXRHxTUlABa+xN
	 YOOmIg8GuGIkHEe5IFbVxeR1Oq8ZY+hSgg6NOuvxHfgL4hAqMAZFBADq+pii4XRz6Q3aj
	 pgyCPrRZjciHGVbYrm77f2Z6pjEUQYY1Ic5m41dVXqPPMx3fB2z+aXYUXRNjaLN8CcA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787869144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wWBwsFzAu5mYXb8+/pwxHrwlAorVViXjNaacDyfTK3I=;
	b=ehUJUD2EOd/DmGj8Juy1GNS1HSjdsoph8YD7MGfbjDinUxyML26lnNzy0ozMPDdkUe7d
	 0ykdLWCcEsTQDgjJitsKycX+1T7CxtWAGHNDAIrU+3MpdFPy+vDcLZbVm5Wnnz9gfZ5lZ
	 /ndEvXwPtURDflKCrtuf9i9ZtGVYmcmMid0vI9AlvHAG9Rhx59iVKJupPlQWf3macgmpa
	 U3mK/JHNy4iFBHNr12hNNYcS2FDLaWpEp/4dkWw3RfWreH+Nn8dJNhKcQfkvOLFwXPkyf
	 hENH5ZM59CUhwt7siKuMbwDvOz8NNw/hbaMPiS1S05i2NL8pc1C9eQRKZfjVSjOhOIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do4pr1Op;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ+p6D0h;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12AEC1F01566
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 22:18:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do4pr1Op;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ+p6D0h
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 12AEC1F01566
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RJLu4g1117685
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 22:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wWBwsFzAu5mYXb8+/pwxHrwl
	AorVViXjNaacDyfTK3I=; b=Do4pr1OpKh7ccfmQbHOpmWKfgRFfaMdiVVR440FD
	IeUeRSlVCBANaKDoEXQ9OGLowt8e2Jh7nk+fnQsbVvKuNPBDMy1nNi4E4U0DSCCB
	GAVH4kErFJndaDUb+qo1unj34KAWGLmvEUBm8hlWZ1yfUj15gy+Fi/ggaEF4AeXS
	A9pFR3nHJCO9ugRTDkkBacjZ5N4Jaf0VTytW4IrAMGoXGiXFyYy7BL4AL3lxggDz
	nscgL22TnF5VqWhzcg/xyjXD+pl0+Bit+T3eajBtWcLwFHE82cKo47j/VCx2hcuC
	GNMfZ1FqWw77GIZgy9KFmJRl7UPQfZwZLwweyBSXR9RvmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0hfu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 22:18:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52de05de414so2528981cf.2
        for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 15:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787869138; x=1788473938; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wWBwsFzAu5mYXb8+/pwxHrwlAorVViXjNaacDyfTK3I=;
        b=HJ+p6D0hmKuV4N1vH6WqR/cg2cik9l44Zoe5v21OM4pfvLGaah8w6lNgbm+i6bLjDC
         /WuO8efeH80vXeOjw/QTi6RZ0Iy8SFv07cG+YrLf3Gpp0CZdub8y2J/5Wb1u/cx5rimC
         EK6D2G+dJkf3JikWcVpPXdlwxff98vFcFsuVxDTwZM8BqVhGWieY8TJIrzYnkxW1N9jp
         2+mZmUoXuxNTTSLPnIwUHmWP+gZDeV15RyIt+1Z3teKO1fmDIa9geH46H7vSw2/8u998
         ASgHM5BJlbRPMF8lJ1BBRrJ5DSHclYPBNfmNnRPTzYVG0vZlFKbED6SPalTaV+xrY0WP
         K+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787869138; x=1788473938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWBwsFzAu5mYXb8+/pwxHrwlAorVViXjNaacDyfTK3I=;
        b=EP5O7n594sIBdkmdqwLsCBbrrpKf740MISrynv9E9Qy9AnzUNEU6iosmcv8I8QZ0WT
         sHCt0BWxd+YIjOruEVx067379LPmBCfv41KlFeDwJwVhqdygtldTM+7aosV2cjVGCsbO
         RrRhmqzAfvLbUkqBJMhuH0z4CWhVYuAdD3IiE/QKlmU7mpMCZ2uBUq3UwXhaz8DpWAq2
         /fhtF4HzsDpcjMAZ7VbJiSCvEJcNybLkGxtDiE2udquwXqZZP0CTTV5Ohf/1rPYIP49Y
         XjtSoSjV1Zqnu8rpuI+md3/d7JA+LiuElWvNyRFbhRmwROMTcXBGdzfEeKCeHBYbl4z5
         s4VQ==
X-Gm-Message-State: AFuF++lO5G51NvvW/HL42LCMYuQZRhYr3rNKoZooglRfTTVBCvit2c9b
	YgzHD6kqn6JOg9nUGLVo/NUFTEMUSpAHj4p0j0K0kltFuqJryuRD55KO4yr0uuqplA+AhYsmzSg
	R2czjZLZZeP+bhPxy2KnhaAbbAw7l33GXGVa7T2G/hNiXgc66Uht5HYOxt/QwqepUkoB5cVU=
X-Gm-Gg: AR+sD11ueLiZ+ufHwmXPD7R77vmjCysftGs/mghUMGwZtQKygegUJXzmICuIc/Sc3S5
	tZkEjKzBtkLLkbOYQdWFc+GFG/v3jG+tf63uguKZWyyWqjlnLBCHC6iGQj4Am+6j7cEpDmLIZ34
	1WBqKBLimpFzuAGRHCO5pDwMRkEl6cvcO/jqtqmiHltni3RQnd2cK9xoptUSBCBu4XwxfLs++EJ
	sthtZUM8/Wvx5BEsbIFituOpKSKtpvMVp5MnDbDRKt3GAo7hfTzGsYbr1YQXFYfmvjdXqiLbaRj
	VDEW2xCgpCmOBVhYgoz92I4KwYhEX8ETzcO1YidsSzK9U8Tt8sS8FkWirIqVwevB2P5T1CEu+NK
	zSCmFjuQzLsWyK8Iw9Q50URHaAIaMYOK/L4wwsvWR3hdr0i2dZChbzMSBO3sPxeNHt1XidpeXZD
	sMkTm/LJWr2kyI
X-Received: by 2002:ac8:7e8f:0:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-52fb9425a08mr29767361cf.12.1787869137760;
        Thu, 27 Aug 2026 15:18:57 -0700 (PDT)
X-Received: by 2002:ac8:7e8f:0:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-52fb9425a08mr29766881cf.12.1787869137306;
        Thu, 27 Aug 2026 15:18:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e713b22bsm116794e87.18.2026.08.27.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 15:18:56 -0700 (PDT)
Date: Fri, 28 Aug 2026 01:18:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: add HPASS firmware for nord platform
Message-ID: <rfc7yqgcorqiprirgjjzr62wzdesyzfwkyfqu2uucl6jffxal3@oidzpf4pcyx3>
References: <f9a167d2-a893-4b54-9030-dc013df765cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9a167d2-a893-4b54-9030-dc013df765cf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE4OSBTYWx0ZWRfXwYy6jabJMRDU
 IyCiM0yAv/q/9DVQyOq25Q9tCYFLxHutEb+ccXpwWsoxRYwSpstbOF+lYTgb12RRNV8USNfwBHv
 h63XVFUtOsL95yRQRcUMaTU5RRZ+BwQYRzqjGDlXHxt3ehxx/ZyGWcZCKZVfl+a7jmBMGcZw1Eh
 u06OJUAbuaAU2DUTFBphAz7xQl4qpoID7/uf3GXki2rWbrRkzgL5n9W4gYRxxh5Br8eyI2u7Kbm
 KRoJjBlGtV9hA94XokYu9KJnS9aYVVeHBXiSRgsBhA1HdAkqRI1Tex1WVa9Tg/hnglEBpERQNz3
 Xb3U5i1rwmwyjXZi+ikClid0NMiGQB3NX08TydZTZS4XOhhW/9RMFL5W2xBov0GINrr+o47i1SQ
 4EKsoUPqw9TReFA9lNbSmwn3jP+CORZsMhmrJzDPTKeDIxU0f7ZNcBBCK7s3UOtS/GwR/a8eM5F
 KgbbAgKQ8ZeiqrJoGvg==
X-Proofpoint-GUID: PEEZY_WqzXdgRzTp6OMbsc4k5gH653gy
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a90b7d2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=9YOavRHbjovP9Cgs3JAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: PEEZY_WqzXdgRzTp6OMbsc4k5gH653gy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE4OSBTYWx0ZWRfX4+BcyxXHe7bg
 rXcQjX+nSUiMmRjgDSglmj9qN+EwMaOPml0wZrVKi4SVz4KLnYkgvxsCQ6zRMd4USIi6mbn2VHZ
 HXaupsN6rW22HJkFKrgULZryXQvRuCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270189

On Thu, Aug 27, 2026 at 12:24:08PM +0530, Saddam Patan wrote:
> The following changes since commit 01205307636157a12c29e6a774bf83b218732050:
> 
>   Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-nordhpass2
> 
> for you to fetch changes up to 83a3c7a3b3c770359a384eede4bd46855922817e:
> 
>   qcom: add HPASS firmware for nord platform (2026-08-27 12:20:10 +0530)

Thanks, merged and pushed out. Note, robot didn't pick up the changes.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1202

-- 
With best wishes
Dmitry
