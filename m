Return-Path: <SRS0=JOQV=GL=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4438DC5B572
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Aug 2026 00:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EE551F00A3A; Tue, 18 Aug 2026 00:55:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787014521;
	b=W5BR1FqqKlhUlaib4xhPMO1S0zQNHAMDFPPdYInPouCqbBfXYORiHVndsuLluKaX08DW
	 8Vg1Eq92B8W9vcx2kwWFIfGw+Z5ruyig+aTA88icyYNaqRQ/L/D1xXnR+pIpIlJwLeqow
	 bT471XUgRYxVM3HhRAv8XhCbZX9RUBASMN3OSFb0Qs98/FP5mCIy9+5FnEP2SGhgXXtmB
	 odVx5oPjEicUOWIBfCvK0xNezIUovd55uJcu4Ho1pgslVKA9N7oEA+Ex/KECmP2ji5Rq1
	 AlO+kqmlAkvhnUKSkE9HOALKxjkA6M812srtSeF5zuqjAsv7zdyQPXrdROtXuagrNfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787014521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Fggt2TmWKjQvz6J2SypLoaRbNEGVA7UnNxGPQPVMqfo=;
	b=NoQ/PR7ue4wRmNciG0gFWemmQltzGB3YCP660EQJowZgxpULHXFSzL42bPx6/vZEGTik
	 ADzR0vMFvPJG49cMAhl2bXl0H4z8MF2bvOgH0SkgoA8FzJh0sQgMLvEpuHbBJucCoa1uK
	 UcpWSdiJVBWfEAokAqFhMjFcTCmBq9bfuQjVzqfjlU5IAThevi4JTmDztYTFNzoRVq5eg
	 +0hKy9aZLzKSu2LZ4c70ftiWLj2z2wdd/Lqe6dhHfARoTxYQr9ShXGXIpsZ3QvkkP6645
	 GW0QTjntd9vOmq56MqtPYEk5V18HzXPBU+OAbu2S0s7ifX5Vnj7P/XCSF5VARZDEqUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PsAirPDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dilzE/EG";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50A891F000E9
	for <linux-firmware@kernel.org>; Tue, 18 Aug 2026 00:55:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PsAirPDc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dilzE/EG
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 50A891F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkunk3370574
	for <linux-firmware@kernel.org>; Tue, 18 Aug 2026 00:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fggt2TmWKjQvz6J2SypLoaRbNEGVA7UnNxGPQPVMqfo=; b=PsAirPDcXP8i52M8
	W8q7ZYvmTi8aND9VfagRtdY+ZQyP+JzuVSfgvHiELYdc4ODuRoNRSXjaGTQhameZ
	f6SlHH3mCmJxk5rrRdthslvelkaQRJze2iiiy35jVT7GE9y2hooZIByD8y5gQ60S
	fH12QEcuXKb2eWChwQIxEJqIhzZggzfKHjERDzzx+Uzv2xUtHBw9NIWsLy4/UEVt
	lWYcejWbKYc8wxk1CES9Aha6jCF1fnMFJ/VcI1frdiXDVDeFoZMy5xOW77t6yEl/
	Wj3slHkKcMDh/1gu/WKYVgSiHhriEgNQNrL4FAXUwRfwN+mAYP7lvYNWMrxRAwfc
	LLtZDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xykbr8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Aug 2026 00:55:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so473250385a.3
        for <linux-firmware@kernel.org>; Mon, 17 Aug 2026 17:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787014518; x=1787619318; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fggt2TmWKjQvz6J2SypLoaRbNEGVA7UnNxGPQPVMqfo=;
        b=dilzE/EGu36B5upq7j20lOD59Fnmo/ifuTDZX+0780YNAHtkrOqcceKVwkxrKgMaRQ
         7jrYZwswhXNrhWux8R/C6nA1k4xJzwTMYVZUjut2AoK93WE1J8IEe57Opbtsx645Wb7Q
         HybS47UDdx5BbWSHh/yhPhLKW8prZuW//dvMt9NUMocw9Z1fCTyVLgrH9kL/yb/v8wDf
         GCImmZD2AHUb7vc0txVkL+SYXn6xB4YD9oidjGnJvadwEoxlexJtaOtIVkbRcRCdBAyg
         Dq1mjrzOi9w8Ov3X6PsZpjF/9xU+GMzu3y6ndMLeGamCdoQKKdP/YP1DjOx8LpPhv710
         nyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014518; x=1787619318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fggt2TmWKjQvz6J2SypLoaRbNEGVA7UnNxGPQPVMqfo=;
        b=O8T7WQpT/CSssQ3AD4CE1mMA9X9k5RTfMFgi5v+M8IHnz78eMyR2lmg/sBcZIVxosg
         PJ0DLk8WSH2+L8YfqaWcYDREwNWEuUl4hN7BcBcEb5WcQ2lvbO8+19fFQKaUXM98Wt8/
         Vxma2sQKC64+LIeJmbVLscKrS/j2O/prGUSJfCCozu3XXHR7wvy0EUjd/kW8rB5OcIQ/
         bz6mFgdSaY5TFfTQafT42Ls+yHdB5O8k4Sr0dtNa/G67sGy1nVGjV+shmS2eVici7OEI
         SCV0ydpoSVham/bvOiQE1KCF83iagcNXZ69DpGgj47TiXYZ51/rbJJN7SJX0oBrT7/Wx
         2qHg==
X-Gm-Message-State: AOJu0YzkAh2HXLAnruIZcPbdNEI59sVMCZBcBdLt0N1WAU/T3mXGcxrm
	rsTn40EAexCo3bIecX8Rb7dSmsdS51qd67tEFZ9gYzJCcZxmddyfATe6jtUq1wX7R/+5mRoN4sB
	Xo3WJ4J99XyjMn1wHnRKO5XYO3OQGzvT3s+mwAU8D9oO/HceSUNKmobvGm0pgTiM=
X-Gm-Gg: AR+sD10QAjGqq+HI8Fl5LNCbtDd5HHsxTsG1JNrJiTN9KnmBJe9+OeYVtIisLYXR55K
	lWa26lqm7L3ld36MkeC/iZTC+8dmXqkEFjT0z1r6FQeSxD8m1KIe/qMygSd2OBnQvBPg8jEiLwE
	vCsVob5GbQ5ke/JQiIMOhiAzF4WJwcC/H9azbhYL4H/Ys4QvzKd9yjKZhxVLZwG43ZAO5bAqo+8
	1CquG+n4C5GDj8WyuFC3P2jRQdr3xZn/fN0MVd2sFFsmrtFMdnS8QbY1ZGBVp+Z73zebN9QKvon
	Xiam0SFmQk36brK/kzb0wn1U1rRqHr3lT/Na8Dm7cItiLopBjUb/nCnIzCpkwRpDiR6p/X6T8bo
	si+151lVKwhmQBxg+Oysl1x63V2RV1/V+U9Sqkirm6JJrwGmFhxcApwnln7FIDDG8WfIeMNodlp
	irLHbVr9Nq2YWX
X-Received: by 2002:a05:620a:4154:b0:92e:76a1:96cd with SMTP id af79cd13be357-93704b5221bmr460405085a.13.1787014518392;
        Mon, 17 Aug 2026 17:55:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4154:b0:92e:76a1:96cd with SMTP id af79cd13be357-93704b5221bmr460401885a.13.1787014517945;
        Mon, 17 Aug 2026 17:55:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d01669dsm768288e87.69.2026.08.17.17.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:55:15 -0700 (PDT)
Date: Tue, 18 Aug 2026 03:55:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, viken.dadhaniya@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: Nord Linux-firmware: qupv3fw.elf
Message-ID: <yoju53omp4qhbhjix2seufd7beyjegbnzjinxc2wtljexonfq7@6fgc7d7ckyqp>
References: <36e1b825-7896-4308-bcee-f695149b3c0b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36e1b825-7896-4308-bcee-f695149b3c0b@oss.qualcomm.com>
X-Proofpoint-GUID: QNAK1-UITmAFF5fSX6g6g8w3KdLDf1mK
X-Proofpoint-ORIG-GUID: QNAK1-UITmAFF5fSX6g6g8w3KdLDf1mK
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a83ad77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=A-0ANAbjvZ0rXsIMRF8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwMyBTYWx0ZWRfX90gGUBEHK78A
 bqHgnc6/rUWIQmuP1xAiIF0wqVEFN0mhjiAL429yGkOTUodvQwZ1e+bfaD2j8LdSEXFAeMWIjNT
 xg4Hl9zAf2bfh6+v1jVIRgGRVYzfBoRQLcieQg1PO+B2z+bdQiEBEJ1HtXR+V869mK88D2miBzR
 z95AejGMOgTQE7aWu2A5jt21W7ZiNgrNcc9qSyP3D5d9aUPDuLjc5N6eBDd0u4HyQgTFN4tdma/
 9r3jxMwUupPUSNmhNC84hoZfQ5/72ltTUCjfPpu95qV0yxHMdMhiQfJhGn4Bc1Pw8QdiCwp6V6D
 Q/q1EIeeqSRYDudgazh6qiEd80ytYK0p8f85O+mrfswncPng5oWy19h39bNa+4gdppj6Kse86cI
 ZmulrKQrOOnkwZVgdxFO3aCesVEu1WENTvKQeJERCPUO88tzflDd2fOpsepLCjIi7gR7ML0XE9e
 0TB90tBXOMpH0YUsvGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwMyBTYWx0ZWRfX6bVb9XwCrfpM
 5vHnO7qrU1vHBrCag4p/wkRp/Q6acEn8Q0Y8F3bDj1bBS3Q0URNKRErCnJnR87C9d6gExXjvNYo
 XFj2F1/fRfz8BfSIoz4sr6n7hak+4fY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180003

On Mon, Aug 17, 2026 at 05:26:08PM +0800, Xueyao An wrote:
> The following changes since commit 583d336ee7c2a15fd9e92c223b147d30737ec04f:
> 
>   Merge branch 'intel/guc-v70600' into 'main' (2026-04-02 18:58:02 +0000)

This is a commit dating from April. Since that time we had several
releases and a lot of commits. Please use a more recent base (Gitlab
points out merge conflicts with your changes).

> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-nord

You are extending the entry which is mostly sorted out. Please keep it
so instead of stuffing your changes at the end of it.


-- 
With best wishes
Dmitry
