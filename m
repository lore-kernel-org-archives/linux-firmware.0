Return-Path: <SRS0=C1ju=EB=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C222CD6E7B
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Jun 2026 17:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6DC41F00898; Fri,  5 Jun 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780681411;
	b=DTeXnc9953Q1gw04yPCO/i8qLxssO+mabwKWtdKzctydt+KpTUg7Bb7EBgMUkXlb4oBU
	 gMMSYtXIMz1hgxC/sMN5QU7BrMARsi4M/2U4wMS+M/xf/f8SOLropLYKg5yBBWGahtcGg
	 +WxkrzhFIQDazqqdRmfF75BUh0wDD5YXB9/HUFY5yVrZiYA914auIfbXDqSPUkojwvPrg
	 valPD5Tkd3C2ioogxe6mX7ChsHkYr4aPKxtc8t6GqKbxxfzj4+esyDjzK9FQnsspz8+NJ
	 zJ0TOVGV4l7nKSwyS6P6hLGsOoSfE1n5ASOQj/fYT/Kb7hhFNeWvyJi4uH9AOHsI/mg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780681411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G8BkRrygW4QNawELkA9I2HBxaLTJVqOBu5babBAIMbs=;
	b=BX1Iz8TXjv7PxSYTFm8qAmPhWew3rkhbyxvY+QAOd1iFztsHxHRkJE1eSrht0x42VPA6
	 GZ9qN85Kdi/UeGz8Yy1uu8thpqluml1S6tW9LNB4J+NxcWYIlABUUAAXCQFbSf+G0NDkD
	 2sHkCpyuwGKZQKzDF5IYPvpZp4fTd7adpUbwdMnbiMtWrBihAXR6AWTo4xy9dRFD2z6fE
	 uNbcdk7bKpLWiaLIwWi77SQ0tchVUlXGtrPQAr4vpu/rh4n0xy44XaPDfPj8TKggKLxK2
	 vJZbYDjTSJ6VlyxSMOv3JN5bIaYLgDeVNK+AEYwMpUFYjBjN/6ebJJoNPDd6lwGuR5w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUAI38eW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fr0bVE9+;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55CBC1F00893
	for <linux-firmware@kernel.org>; Fri,  5 Jun 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUAI38eW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fr0bVE9+
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 55CBC1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655FQirQ3604043
	for <linux-firmware@kernel.org>; Fri, 5 Jun 2026 17:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G8BkRrygW4QNawELkA9I2HBx
	aLTJVqOBu5babBAIMbs=; b=mUAI38eW7BajtjYryioeKdtuCe+gVw6tAz5Hcyyf
	f3mSUoSxH63Xbgz42LqknYPJjDi+QaEqgfr3NIPu7GsIyMfHcXHLHjMy9u6wGf93
	XnKa3RRu/yDZO7JIOQ3tInhDGjrbpweTLxQCxEGtANISxorJ/tKCvMUsKeNDAZ3R
	Eo5tsy7XZwfQXRKnF7M4LNelkGVZMAsKGSvIrUdVrxVqn/h7Z7MNaUOoWSwAL3aG
	onut8UvwjsnQU23io0KIkv45jNtl61iADzJmYwZY66M4tarELHg0M3ZXqMdzus6J
	Gb5P8vZ7N7oiw4fR/ewfrvgJ8Fv5p5Wkz1rU+BZFvPNaqg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekmhfbww5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 17:43:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b0a0b727so865742241.1
        for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780681409; x=1781286209; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8BkRrygW4QNawELkA9I2HBxaLTJVqOBu5babBAIMbs=;
        b=Fr0bVE9+k1WOK+6XqwBQiU9Eo+uo3C0PTNwTQM1sb31JsW8NVPjs3AlV23r8ttyDpn
         YnLg0V4+7f5WIeiPJUUYPJzjRWM+5w+fDLchGNpVq5zxU0t9wMHzEWUnqULdobrB9GA9
         kP30jAWFEbrIrSo7XTLGN+AQw7AafvH/GbMY5N19SR2v3j2D64KJGdtN+DgzJQ4v0nGi
         zbIThQ04bNttNXXSIeVGLmCrd9KllAYH51CYn+O35NL0kgz+WTuQ+cW+66MNnHl0LVv/
         GQ8W1tlFZtzC5Yk4wRPtrV75xfA3XtUmqhECCyrCD7mLCMP/FVCk6QQ66LTn4vTkvWaT
         NzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780681409; x=1781286209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8BkRrygW4QNawELkA9I2HBxaLTJVqOBu5babBAIMbs=;
        b=gmk+bZ6HTFBgOweg/No/kcaqHZe33wqVyFYmjzZCKy2izBUwI9zKkvftJFCRkPBO13
         4zqWWbqracZ9rqAASrk3l3Vl0jf3piJXURmqakv6VNjbE8FrbToM5UL9Ch0FFlUGdRaH
         g1fn0BFnzhHmOCERDPgxQTdWkycxup+OIZSUdtUwgsp4RL/2STJjJCflrqNoN6MdxDWv
         dwt/WW2slHJ322xlnB/qjYmWGLGxWbcKYTze9zVr4Ct2wB+t+gklSGVU2KvNaEtXQAKg
         qFy0LZVrotEoOVgYN8K4rXw1jVOAqh0Yal5mzfDvW85LNRuYS6tHFfnyd2enUE6ieE/j
         +UGQ==
X-Gm-Message-State: AOJu0YzhGRBr8CaFFSNnqyqkRKBC/xMLbQF41MfHAl9HLPlK5i9PlMDQ
	tGz1d0l190srghV/U6UESipJF9kxGTFhYc6E1ZV6i3yUj+L3atCcuFdIDz+jUh+V3flhg8ShTdk
	hZ8l6kDoeTk0osAKfpi5atmvIbKNne06KlJnNV/dkH5ywvvAfUWzY20oWUM7aMLY=
X-Gm-Gg: Acq92OHXFabEovW8lyllYrZDit50DfYEOteYsjukQPCI9ypy2CLGMIG7JT6IkeQctgi
	uwyBzcd0SSL8gAmnr6BTU2+YxcoSpxBXj/YM0X+prxosqvRCjzzV3tlhWy1KHSy+KfLQvfpZpFj
	TA8uBYjc7vQmqNOQEKBEyfiHCeprYwlHQSi5uhGbZaspLGj8TDPVmoidOBPvd45p7HqSSKUu3K/
	OgowVEvg9PlpmnpmR+MCNA2b8qVR+4uWebxgXo8AUNcSbJg49s0xs9wk+T80lWGG/byiXQC2U+N
	SIEN4Fx2ZgfeVQvHY14/r3ZcQOVUfsBC9S8K8WujR8lVtPc5LniuklO+RYm+GphIl79Irarr2p6
	z7l/o/1RdzOu3+Jgj+dJ8UQ1JkNBQzb1htDbA6Y0F9lnO8xUY/PKxL378tQKahQH0+TvVE33uTV
	axMjmaWteOs791czBd27Zm+Xzj34ZMY+gE0rKcIKtm3Jcn4Q==
X-Received: by 2002:a05:6102:94c:b0:6cb:d562:b96a with SMTP id ada2fe7eead31-6ff02387516mr3064804137.14.1780681409230;
        Fri, 05 Jun 2026 10:43:29 -0700 (PDT)
X-Received: by 2002:a05:6102:94c:b0:6cb:d562:b96a with SMTP id ada2fe7eead31-6ff02387516mr3064795137.14.1780681408809;
        Fri, 05 Jun 2026 10:43:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed925sm25635831fa.39.2026.06.05.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 10:43:27 -0700 (PDT)
Date: Fri, 5 Jun 2026 20:43:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mario.Limonciello@amd.com
Subject: Re: [pull] amdgpu amd-2026-06-05
Message-ID: <7agyehkh3h75nbmebyrfeqzn46zm6its5c6mbdtyvgxwnm7znw@wbsokjfygpv3>
References: <20260605173223.25087-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605173223.25087-1-alexander.deucher@amd.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDE3NCBTYWx0ZWRfXxDYkUZel/AbJ
 oL/r5jf6uTv634p5J4L1D2/KtGgDIQWFaEOlUaBBhigW26qpxOX4zYp2fzWCXnf+J3hdUHyL+SM
 8HeV3L6DyGyuo+lQuF7RuxeBOK4JRle3/t8sqJMHPfUk6eW2JupyNVofFbHVWKQqzN4kAax14yf
 Pr4Hv4QHDYA8yt8rJNv28HQlf6DVWjgb7J48pIkz5i7PaMdp2aSYdumtRBiQk2bXDgbyW7mArpJ
 37OUa9hKNJGhF6udG3C+IB3ok7VKteTs120nH5sEUSI8kFGYiEOHWB8AVr88xAqqfq/1tNgqyXK
 plrvVZ9Rpn4zlVGqkqch/yT+EFZDc3OQYfOvcHjre8lMJuja1y9CrM45QxovqfuWYvfQwcjO9Lw
 4jFwcVl1zQdQ56V3F1fSwta3MskLT7gb3shDO+fFByLwt2lFmtUH0W+ChPuAKCerfRsOwy4pEV9
 pkxxDvnk5agzCXNFViw==
X-Proofpoint-ORIG-GUID: XzPdKGZO1fhDkXpy1CO9phgm6WmaoY5U
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a230ac2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=fSHkmV0HaLl-wVk-szYA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: XzPdKGZO1fhDkXpy1CO9phgm6WmaoY5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050174

On Fri, Jun 05, 2026 at 01:32:23PM -0400, Alex Deucher wrote:
> Hi,
> 
> amdgpu VCN firmware updates.  Reverted to previous version due to a
> regression caught in internal testing (VCN job timeouts).
> 
> The following changes since commit c8c796dcdd3b8d1ec71de2c7a71d3d7b1c8f7a68:
> 
>   amdgpu: DMCUB updates for various ASICs (2026-05-29 07:50:47 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-06-05
> 
> for you to fetch changes up to a69ce6eacb583310d3c0d16beac00935d6411651:
> 
>   amdgpu: revert yellow carp VCN firmware (2026-06-05 13:28:07 -0400)
> 
> ----------------------------------------------------------------
> amd-2026-06-05:
> 
> Fix a regression caught in internal testing
> (job timeouts in some workloads).
> 
> Revert back to the previous firmwares.

Thanks! Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1080


-- 
With best wishes
Dmitry
