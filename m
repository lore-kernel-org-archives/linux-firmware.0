Return-Path: <SRS0=3+jE=GG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFD9C5CFDB
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 10:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2383A1F000E9; Thu, 13 Aug 2026 10:03:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786615401;
	b=cT0Jeo74GgBG5U2MZK1PiHthsPH+Y8pTAA0nbWtUgmqwBbo1grBF8phhXe4rKkCX+l3+
	 0E2xgCLfMgH8TcuyyQsswE6xHhvxQgA6lPDDgOOIAA94b+ldxRdYYh5xwmbZZ9A9LZBOd
	 RAQZZRqoBg/i3zrY/o4rlHRC1pMXVi2QP5n5p7yeGMGeNFgoWMVNHi4zCTpLzlub9USl0
	 EYT0PnQr/MMg7ZMYvI8gCgQCAEd3MsTsBXK3C8FifFceJbIkxcdp75MAK++hNDGUsTYGq
	 H5vT6N+CGhY23fAv4eAr9TgNYPtGnY+9tlA7rndKrExKRD+ZZrcJAxee9yZY9rQSVHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786615401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGG8kXFmY7EaD2Ioftf60vn+aFGWMNXvQsNGpOM5/YU=;
	b=pPU5cMFoYm67+ebquiIntvGRzBakqkjJ4vCLZi7mmNYH2/Fn0DfbV54+ycPWI6ukGdXK
	 YuI6v5bvOtnOQ1EeVr+XPWyaWVMeR7jV7YEXkqEHwJV5feD3N37lSftGnpr3nAjUPsg8z
	 V98Y0QMWnfhUWNuLVSKelvYKYhu1zx1sC5vq3G7lEyQWV2Kjo9ohk48fSK8T3TFq74LBi
	 E6L4izyDPtWoj3Vtl4eBoD0+dSeA6kJTrat5ppqvd97TCXnYewZ194T/FSgORN0LsH+jA
	 zCct4AALBJCNevyjVmSuAAA4cD5O+soaNwWr+3faqhbA4OXXoPf+C7uF0KkX55n2FzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cqen4B9e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZ6DeZjt;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 731211F00A3D
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cqen4B9e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZ6DeZjt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 731211F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D91woC3421773
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGG8kXFmY7EaD2Ioftf60vn+
	aFGWMNXvQsNGpOM5/YU=; b=cqen4B9eWt5KiMyjf2+Xd7/PbQtFJt/nfK4a5B0n
	zVIA61oteRWR1uEjae1vClLKsGcwpSveAJI4HGrPIiHP2ERD85Ymww6cNocv1nsZ
	godbU7gMKyq4bpI++I/AF0tbLQxi3Xa4XJkTyF5WlvWeohkx3Pyg0dyziTf3lcCC
	eF4cbR9fuJEsTCmNNFN1kczzvQ/IA+NKGI0CGVDpl/oRhNvZPgEJ/UhBMNpJy6qB
	2aNVXhFL1hBpTJss8ad84MlVM9q7xUIt3/8eu+xOsqX7GXf4TtdfCbtPM9psNShS
	RL5Xus+nvMbPEevurQdjtTmPPAEcjiC9JJCOmY4lFYRXug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152m9q7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:03:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso19725621cf.2
        for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786615398; x=1787220198; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGG8kXFmY7EaD2Ioftf60vn+aFGWMNXvQsNGpOM5/YU=;
        b=HZ6DeZjtuB4gIkXFS5yzm2UJV4Zcz28Dh0D6EQ0XmsbmxA2qhRiRi6dxWv4jUbX5A1
         6R5hLc9GsZK++nk771B0FOgeP57Bww/Tgk/T/obRWuJpCGlETEWUCw4UtipFyjhFsIBu
         mqzwsEc8Wqb+VOwUkKNvrcbNpr2k/3JwnH730CCIWwuNiDYk7KqiZhnLAFAQ3nR6z8GW
         mEwL8RhyZPXur4ss2Q9tZoA/0afZ+nqS/fF1KOwaQa5q4brlZgl6XL1J5VXY46iUAjkn
         dUVisHZoHTk3cwJVFCDsnTPXX2HOTQ/CrK8Xsi+f1WIvIfb8AURjLZGEPyEpewUja37Z
         ic5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615398; x=1787220198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGG8kXFmY7EaD2Ioftf60vn+aFGWMNXvQsNGpOM5/YU=;
        b=o+fRx5cPTurwxGUTvoD7xU9SSmrudsPRibnxafipDuJMaleunSy38c5FnA9NDvzDcb
         8blwmO/0eOPV/rAiwJNfOtcfHluHGeRikvpM1nI9basJEVvHtil/IYTRQYIDJnnBG96v
         xatuNhYG77C22vmW7mKEq0zT3BbTWF+tdO4bOztFE2U29OcGKEGXlsrCvy0GEtFcJxKw
         y4bnScPiSl/8mocPWiKx6yog2WMlwsnSMFH/Ubd3NUfaAvzC/BkzfX/DEvPIDmRGGPm1
         O6CMKK/stvZJoahfhTARWN601dl3xiTFJdlAb4nYFlgPoIps+0qgov0HhDojXHDCaLEn
         xoeA==
X-Gm-Message-State: AOJu0Yxas4FPrASOzJFdKktCDjQas0gXQzQnkIXVPMM44RmvUHteHfRy
	NbGOqX7NWeVP8SMs6xh9zW8fRbts6U+IPp+45tprwQnS07FRH97R6Fhr6l6OH3cRzVBs65tF8vF
	I1VGAU8IotHHWS/pQb5gaNLPtmEgd3LClMaA0a/VRkji8FWsM1221cyVlA7ySkEE=
X-Gm-Gg: AR+sD12XEtftSHa9S0DTVXuATJ4GfKf/DvubEaluBDTnQa5+QT9oayiIMxXheRNpSq8
	YgZOLvZ5Wz8sPoTsjmAT7C/MbfndSqCZ0JZb/xN2+V23vMYS8qIHZn/jF/3XTWCPDq8cAbBCuVP
	QHH3Gxe8np4LEJpnxP9LKGgSGSEFZnShlDktKTiuimU8PWBe8/OTTejSEVPIGTaaa3csBHErMF5
	sx12Pm5+HkEsXItnXRAlDUJImd8wAPA3HZjPaeG6aGeLrkyhX+Uly1fOLewFiK9eOJyTL0nbgVe
	+mPR3J8PkkFhMMh58kIWTNyblBg0fbScnT1r1ZQ4CkrP0wIEa8cJ1BnaXNC2N4Lw0fNdZdO3RRR
	OQh4nXYTQFfTF9PNBrIksvQ/iB/AdYp6NUsdIUlDdf2aUsdKzqQi8Tt2wTxkABWXE+ik9Pz4aOB
	pMlhhCS5r95eXl
X-Received: by 2002:a05:622a:e11b:10b0:52d:77ff:7067 with SMTP id d75a77b69052e-52d77ff7813mr15430571cf.22.1786615398506;
        Thu, 13 Aug 2026 03:03:18 -0700 (PDT)
X-Received: by 2002:a05:622a:e11b:10b0:52d:77ff:7067 with SMTP id d75a77b69052e-52d77ff7813mr15429781cf.22.1786615397986;
        Thu, 13 Aug 2026 03:03:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a6ec6esm371227e87.82.2026.08.13.03.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 03:03:16 -0700 (PDT)
Date: Thu, 13 Aug 2026 13:03:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: add CDSP firmware for eliza platform
Message-ID: <73gsva3jmdntvn4piwbfzbmqisufskb5j4u4cq4wvzm75fogyb@zhgarl4fmffn>
References: <155cb327-f378-4dc0-8573-b07f8b71dc31@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155cb327-f378-4dc0-8573-b07f8b71dc31@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA3MCBTYWx0ZWRfXzkMHVk1bzPV4
 qH/PX9U9x8hVhugTjVFkmxNt6Heju6IbQ9vEzp8SDM2BCfnNQQUP/nVRwA/TAJI9O3yoxeEvG+7
 r7gIdV+A/6j2PxaqHp3ijThLJHS4JO4=
X-Proofpoint-GUID: XA9OP_zXkZSmhkXY4ANpabpy1VZycbcS
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7d9667 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=Pvl0_q2E3_WcjjTIPSUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA3MCBTYWx0ZWRfX6ILZt1Pwawrp
 AcB+/bpDK9IG4J+ILnglXa6ghffgnoW2EzJdbeQUwIOy0lBoPMKZyq5tdndcS3lsvrNkHF2ISvc
 iwl0Rlf8iPjbnjw5gEYDp0FoCUS1G5+mxrA5WDCb/rc0Rq6Sw0mUxgViHgHgyI1dGP08//wDhzZ
 xe85oCTLk2Cw026zoHe4GqDAU+mxYoN0Ia42Hp7HUjAX4KgGT/8VROxdRKLp71lPCsHfkVD7R2q
 xo8YQ/+1Dbady2+N4u0WJGUwrSOw5lqpAxAhZlPiEd+zvVAilcYicd+Bd81tKwxaaiTN6ulixCu
 s8RdEds9Tvg/8UR0/gEKrg1ZRjkh8kpucXe+qjZ7PS+o6DTSMz3Que6UeOZQRipbftorzQnuodm
 a68p0V17BH1M+vXtvsiBr66awK/HcwgpNYndZQ3Wa5vHSSOnFCnX3UiXyQ7cAuKJqKiXQ9iAgkW
 FktFbLuwY+9W9tr7qyQ==
X-Proofpoint-ORIG-GUID: XA9OP_zXkZSmhkXY4ANpabpy1VZycbcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130070

On Thu, Aug 13, 2026 at 12:17:23PM +0530, Venkata Kota wrote:
> The following changes since commit 9b624be39b464199f21ad642c13c7ab774bc16d0:
> 
>   Merge branch 'robot/pr-0-1786556861' into 'main' (2026-08-12 18:21:03
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-eliza
> 
> for you to fetch changes up to 7461847fa9f643a061c7b13ab602ac1c41953129:
> 
>   qcom: add CDSP firmware for eliza platform (2026-08-13 12:12:29 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1178


-- 
With best wishes
Dmitry
