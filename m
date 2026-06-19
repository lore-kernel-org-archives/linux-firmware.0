Return-Path: <SRS0=KWmO=EP=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5904CD98F2
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 15:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DE371F00A3A; Fri, 19 Jun 2026 15:36:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781883391;
	b=tV3i1a4FmiR/22orZUcyBnPyMeDH/nJaQH4pFpcDgxxwDx8JewFb82b3Bsry61n58s5P
	 bgLXAjH066tiVMNiQCQCehRYO/hWMGBVtOdgt/V710EqujMjUm7gAsfL5EKsiE0ljdvRH
	 XOQ+s88mY2Gcef5kaHtNXOlQ9AMmDmL/eOxZBk7GYJcrIZc5smXi5aut/Db9NJdY3NpP8
	 69f69TaHbjU4Rnk9kBNkyIA5Byc/rKD80e6s7Hkr+nh60KGW1N8kybDPr4vkmMSw3nIvm
	 ziIDIEiyj8oROc4TiKaGZwsC1sFBkXwsUO7eakUuZWUxKWu8EGl+YPhuzaALhyz3fRQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781883391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W7f1W5yDYR55C/QmHFDZ8x4MhMYT/v8xr5e3WuFA5uY=;
	b=AkUj6R7YujEob0HLpgwnJjP3xSHzzHuZs2ZM5W15qanzOypgxBhWV7OAFGvZcOlkUZIW
	 GHF82EpZHPaUKhM3vBwetx4bWxXVZhs4fEtvOTPRJy+A32rUlCOAkP0HFfZ0aI4nIx3zL
	 1tmyYPd5w3GjB/PPr8i+Ri+yf0kR6NeWNhWOM1q+8+2Smf4amzop5Pmpug0eJ5gMXG08C
	 5h30mHfHzi18VlXb/hqe8biOWpnbLOz4zgyObWPqN2cfchk7Xvky4xjfosaJTrPEuYD02
	 eOGYxaPgoxVhD1ExFdjzx1CLNIqpVqJv+Th8QPnsGdNWgoU8RvXvlQ52hCM5X1oQf0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SS1mq33y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvqznA+M;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBD871F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 15:36:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SS1mq33y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvqznA+M
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CBD871F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDBYUv833379
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 15:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W7f1W5yDYR55C/QmHFDZ8x4M
	hMYT/v8xr5e3WuFA5uY=; b=SS1mq33yHyBvWJBw7NlnF11FetX3pDiLsKDSlrtJ
	InSaXnwxPoCCTB+aDRuHgnF6YgKs7NPx/U+f9fG+ImiZ/1NbyYYwi9Xi26BnMKTC
	ZQYX+/choaep2jCCFn8mxAFCxKfBlcFvYGD1DWiUQ7zUzBqxYbgDm9PlO+5QGj/P
	id/uKg39BMf+AIOTQWjxGvg0nwWIxl8VOsR4PENhpU3ZeRmFtHdiJceb7qAOb6Eu
	HbrABE79dC0eMKgztsN/N6jcjdxKHUDjUUANBSdMpeh7ht6lU/M1vNTUHXFbsdxh
	Qj8tluqC3O6OhIwmzSmVB5v+VLuCxS1C6TNfqy+DUcygQg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtjc6sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 15:36:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-72b09f14b5fso205109137.3
        for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883389; x=1782488189; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7f1W5yDYR55C/QmHFDZ8x4MhMYT/v8xr5e3WuFA5uY=;
        b=fvqznA+ML0GmGxZfJOcO9PIWELnVnMX4wrojEYfMY9AyFfMMM3zRncPik4HjVRdSVx
         irgXp+BRbk9L537kf1Eu37xXQRc3lt7xWOZ2yoHkdaZ0C9PnqnYL/1ivr7+SNHjA6+o/
         xv6qKamCY/sC6T5ugF9DSnvjlL9qiO52VRQ8MvvO6cnZPSxDJTV/zPyQ+UgTxVUJcNPe
         l15vqLdDA8c/5ru8UqEShx51/SBjh8JgutkX/9SP0snzolNIKjFsmL68Dkv9v1V9kDo1
         F5DYvYQaYGx9ZJBq2LN/Mo2ts4Wh13dob1SCFQuq3BryND7de3j0gT33dJOHkum+xXSC
         mPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883389; x=1782488189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7f1W5yDYR55C/QmHFDZ8x4MhMYT/v8xr5e3WuFA5uY=;
        b=gvwR6REL3zMe5c/UUAaUO6DzoPa7S8751i2w59ljWxSy/S7HzOGwUVYnxRNy25iXz8
         apgBUmm6sRgcKZUaIRSPRx7rh4Xnju8MU5/85qBpaUmdGZs/s4/PK00RqrfoZWFvTlm5
         AG9hp6SvihfiivxRqVvGsGNTS2f4ezfxu9sJfPayi/zz1FY93td7KKqF1r3L55Ger2eA
         QSjYMLamjHxR0Jpe7CYMg6nxEKVVD3P/El2X2jCFoHIKMj9eYRCNy/JhA3PmYHcojs2g
         N8ZtR0DMyrryi/Dj3YuTzJB471RFfPz5ChZiIeSqcIc/LsfVcE68xFqLgC4/WZQQV2Uv
         0Uwg==
X-Gm-Message-State: AOJu0YzG2aG93NpRf9ispVEEgskvNOq0VWOQfXIprUo0yrjc34rgLuuf
	lRvr8ig9EDd2x63rruFknQPmM9mqP9zKb44KcNo5xDmUGDT2Af7Y39giYARIO622ihj42c0C3w8
	rq9NMbFH6SpzoA7INdie2fa4UaB3GYSOduqACzD7xeTqqKWM8UiZJdWcxU6oRMS0=
X-Gm-Gg: AfdE7cl6iryr6D5z0pqdZrawl+SInO0IAC2oSDgGxtH+AYYpfg0KPpHs/R0TJhwH2J/
	jjjEaOWUOQLhZ50CBUvMmn/uXOzjxVtw9xN8pX9M45MVIjwC9ybfNIR0/GjPFYrnZl+VnUyVGs9
	y/Q3M2CwWaMl+NHYRdaJvbgib3B7s7RvGmGsRsyRzRQu62eibYLeN2c6/oFevRXwIdjIHqInn6m
	LQTw5B26VW9mlneBbI0Ao3tfb8r6DXW4iInD+9+sLU6cmEk7nPJfejJE6l7Px1vkSvoQQ7gJjxK
	pgnWV8WiLu/zDCMhbRRLwDrHV2l2WWKq0QOwpTxzBxdMHY7rjMvfoAhHh3io6Gh2gjaCbZQDxdF
	5oWFK+zNA21aXfSoQ5HONQl8TmuTMYo5OsGZuLXUKrWgMdde0rC21xBOJv2a9XjXsmCrxIUP7jr
	vh+GQ36UKcF7YeEkg+7pQ3Lqcg
X-Received: by 2002:a05:6102:5121:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-72a1ceec338mr2309664137.6.1781883389206;
        Fri, 19 Jun 2026 08:36:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-72a1ceec338mr2309634137.6.1781883388709;
        Fri, 19 Jun 2026 08:36:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5748606dsm651238e87.47.2026.06.19.08.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 08:36:27 -0700 (PDT)
Date: Fri, 19 Jun 2026 18:36:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update ADSP firmware for Kaanapali platform
Message-ID: <4v2esbmhe64ula2j5oxdz6iq43ie43hevdhomqz6xhl7dx7hhb@s4vmeo2mk5tg>
References: <5143bad6-56aa-4e3e-af4b-5e50effc95e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5143bad6-56aa-4e3e-af4b-5e50effc95e4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX0Up34g7IJUD6
 xXhLojO4CRnE56jtsmcOgriEEj/TBDI/NThcvw4Hz5xdFkW3OPlsuSr5BkDLp3LZzxaM4Fo9How
 7QNK5pI1IeS+j86CbMKDS8V4oQFQ0N0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfXywSzvem3HbdA
 NG7ht1UwD9MaM1YeNxim4m11MF/ea8itWlTc6p2UP8qPL5Fi/xq4aKfknDww4v/ijTu/PHmYBsv
 r6Fm6ju5Bon+hXuhZ2szgP3oM0qVM7fwDcOZayNjl5uhR7Xj31XmLXgKqlAaQNXEG9x4hjx4jNV
 yEfhtKb2JowDE5+poKK63WanNKXhnWY2DcItxAULJ5cHrX0raYZBT7MylMO8ynxTVV0+Tbbsxaw
 CRJB4HZ5iDTk766dRZxXlEFtPHc1e+KUZW7nvwQHRGcI/5+soyhtBSm9yU5MaYQflflMS67CbP9
 3ZR7aMD57p3dmFyPAHJ+Nwxjifw7wDqIS88bh/XJX6zTyXa8K7eEOjuL+RSyX2OMXUS17kRClFQ
 9yTj0oAzaNxZXOE3+89FGS/kaJ66GMmCa0Tlx3DVlQKerOF7xiJ0ixS17v4/70IKgS0wutwMJDp
 K11IiihLR6wGOB9auHA==
X-Proofpoint-GUID: 06lK8I_guDwVyazPtUsydtBXLHscK8fc
X-Proofpoint-ORIG-GUID: 06lK8I_guDwVyazPtUsydtBXLHscK8fc
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a3561fd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=EwnU_-auADrnrq3yS0wA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147

On Fri, Jun 19, 2026 at 08:24:06PM +0530, Venkata Kota wrote:
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
> 
>   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-kaanapali
> 
> for you to fetch changes up to ab176b48adb97596630110ac58e8a540f07a3be5:
> 
>   qcom: Update ADSP firmware for Kaanapali platform (2026-06-19 20:16:39
> +0530)


Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1114

-- 
With best wishes
Dmitry
