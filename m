Return-Path: <SRS0=Z1dH=GN=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C8C5DF81
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Aug 2026 13:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 759CB1F000E9; Thu, 20 Aug 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787231405;
	b=yrUVLJxJ0KFVw/0tlvi4P3iToZhKWGSzm05zaTDuFqXVVuKo+Q/DZ/qRujpcG/JlC9Ju
	 MK4f2kWehV6h387f0mGulG3+vVwkvByMSB/rijCgJ8ZBI0+5mzsBMtzlmSQap5xJq227g
	 UGdsEJRI/HVf+ua1giN5N+4R3z9OOL6bfwGuKyuDv1mSVVzPysDxm/mTxvoEvrbQugIw5
	 k1rMdAOX51RbekuYrvF1nYMvwE7bNQUWC2FwVVEBVZpIkWKHN2lA1mSRIe61fHEsL5g90
	 9LkhdeY7stSOAcOfqybAldSJvvckFY4v4ROENHNZOP6g1WxFq5w9OIhbkad5QgVMrgg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787231405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iOEZyxBOozJ/RhMckWV2HhiD8pTkhqyUBBIc9nAYGTc=;
	b=rbqUGE7+AkKrW/H5kVaR4lo1ilI8KB9X9ajMovynqwjKmxXbICp3ItiVKCg4KOLoFE4V
	 MrriDqzdhwVreX6Wb/Eg2s02cQHcMWfabE6nAYDNGF0lbBtFopoiA5ygkMtpfUs9zqkhx
	 FPoShAoitWJ2HDuf3phd31PdwIxznyVGwZue/kIbl0+VffLJme3o+yf0wAR25E6y061Wb
	 yU3qdadlt6yktCV2WVoczzyKTA2tPygFrk3+e/8a7aknnrVWVe9iEmCqRNLmUug+Twxn+
	 W9r0eWp+OsZbnEI6TL82ZlkKjPa6Hh6HIFM/hAafyp5TT7B/lToN25RepNWZq/xdaQw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EfPYVwoi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bFj+eFXo;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD9BD1F00A3A
	for <linux-firmware@kernel.org>; Thu, 20 Aug 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EfPYVwoi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bFj+eFXo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CD9BD1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KCpGqk2161218
	for <linux-firmware@kernel.org>; Thu, 20 Aug 2026 13:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iOEZyxBOozJ/RhMckWV2HhiD
	8pTkhqyUBBIc9nAYGTc=; b=EfPYVwoiD2p8YypP3l84JIAMY6mVi81vh48xg+LU
	E9PNxpv6Zsz4pIbbUTM2QxI0hxS76uBTrCkVHfveGztca8OIUu8oP7w9FukcQG+g
	Qi/9rPUIOob/x7aqiTPx/ZkYpu4Ibzvv+xpTrd5EyekA2c4sRAgQf1ZF65xlOyaA
	HzRjO56ssB4owPeW39TZQ1Jbw5e9chiYPF+Yst2J78RItRDmqZ6hz8cZTxCC4Ssd
	dKy3yMugG5Wdr7jeEM0OcNAFfuVaB0Ax4KjbyCAtyW0ZJTt9CuA5vlqF16EjC4mX
	GtzSwJjKyqbF44iMd9bxdlqyCH4ApJu0WYkpwAtLNigctA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7scrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 20 Aug 2026 13:10:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so34188935ad.3
        for <linux-firmware@kernel.org>; Thu, 20 Aug 2026 06:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787231403; cv=none;
        d=google.com; s=arc-20260327;
        b=P4dWLPx+CiDGhe8Z43Tl8O+r1OpBXg1P+J7MmUjYMCG+FKq+0PR3kmRokVSaUr5KIa
         /TzHVBbsJ7t2w46pEllTmAmPq9mF9VQX4PXH0LBaYhzpVQtknp2YcCRvrZtsS5yKI7uh
         OsoRZuhtakCcYwXnTlxwAEsI9UEd8CtbabXlPs+ABP7dVejoKA2pHHWPoqpD5ZouZHfK
         wwljihmergybYegf7MM+TvGhgIxn0Jj3cRw6qu7yxNHUzBkahK3OO41ZgKYbDyVJ3uaP
         QMo6joQWdzui1/D9NbdzskmzooGVD0QSrPF2dW4k1iPnSO3BT7Vc8QlHTU+r7URimcLA
         lXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iOEZyxBOozJ/RhMckWV2HhiD8pTkhqyUBBIc9nAYGTc=;
        fh=EyL0vxBl/pOnLgFiXBvDF4KrZ3COxosl8Xm5ovlFbrs=;
        b=AstXwH1h9R3vRTQlxE4RyKfZOHUvFYcEuVuL3GMZTTwi6Y9jCHPQ53qMjbMZX1Jaf9
         FGVp2MRRIqOJaodSpe5BsZRKvadt6/YmKCDgQp0AkBNu35DRIMmA9/GJhU7pKaXRgojx
         VQoBmlmUOM3kfb2Kk5ocksuVPKalObun721qiMDrQEXistcSkf+9DTXLUPfDo2gNt1NM
         EtOr6tCeOlJlO+xA2oiRtkzoD5KCIQ3Y7Jmd7Su3HudCnEEs7n7+rX5xg/whQBWT9r31
         BdgNdbyU+m+CsRnwp8ULs0odiKNnTvjO0yyu0e4F6jQQPIZE/qxbQb7PF4/TaA5ET9q/
         1OrQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787231403; x=1787836203; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOEZyxBOozJ/RhMckWV2HhiD8pTkhqyUBBIc9nAYGTc=;
        b=bFj+eFXoLNu81cRSqQ44cmCpdCvYoK7jEvDyoqguSuATuNPK3y+Rr77b3+ls0vTvGR
         bs+nR0szPtrzi0iBAcJ17R5X6i07spPPBs8Ol7z1+GqMLxG9oa4e74nMDg8QHNGy6FDS
         ET2028b6kxGCgC5I9aOuiyXEx8RAPrOZGsLdxZCGgoDtLMOUAk1azObnaAbOIJgNX1ji
         /n5wdzwq3Zc5sttWLQ3/M6Z5n0gOYl4GvvKNNZB4So9twTNLfIlqbpvorl4XppWElKV2
         8k/MVfNnctrmxUBP6qy8caCZToquTuBFBMsMbsPfZaWx3HI/xLC1041AhjE8FKFjRSgy
         p5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231403; x=1787836203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iOEZyxBOozJ/RhMckWV2HhiD8pTkhqyUBBIc9nAYGTc=;
        b=UWjWbQ7WJOjp/PDowVanBFHQgCib/h4lCxdSjQZwGri/sMu8CJg//FIoyQFnJo29K0
         I+63GhtznghexsCDFicO0+HBspwkYvWGLiol1FaYQemBSx+GuaJ+kADEC3r2jAnw3SJh
         XBez6//b0DGRTL11LfhVtiCiH4RIMtzQf36jRScGsFUpmKyC6ddvwiXO2A/ADfqfMsMr
         9mH33i0SOOYEQSIMaeXTItMVY+1eoolYOHqRk+18ttkXZmU474ZWm4xVPMftDn/P4H0d
         XlApfYiyXXbNsECv2fSmB8G9qaVsPE6eTZ6egKnJQKV4f5wGlWdr6wkZ6t6zjfg0Hs/+
         fDnQ==
X-Gm-Message-State: AOJu0YxiVtp6SYvZ7XTEfrnFRz/l+cNJ8bNP+JZxJrghUpYQ1yLqGMHn
	o4Q/VEstft+si3e05uGl5VKca79X9M10fsocCgZSga/wCidsh+j60n5ujkirY4unOGnsEBgZ+MW
	3039aw4ysVX7vQ5ahag44o5N0kUS72ndO4bAtUivkxqQCsXPxjaM0SDlzFu8F5hlQqj9HyCAhOa
	EVe+1+chjl6057BsqiA+TUKs014T2KrgHvXNUy0ULh0JjgleTKoo9JGg==
X-Gm-Gg: AR+sD11kBqyj+Iy7eCC+dNI/Z39a15CkkswxjTYWCZVL0USbyZ6r+2T9lKC/oF9Z1Hh
	K3xnBGWQ4H2BZRSq6EBxkLd58tYpiPHZRcj7opdSVaT+lMrcfUn2PSBBlf/GkkVxJEyrlppvVFn
	9S3vskbgtm3GhYYGBEV+eZicOzmtrg1eVxcHIFm/rOGO1H34ZpuKj/DPk=
X-Received: by 2002:a05:6300:2284:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3cd00e24fb6mr26660720637.8.1787231403306;
        Thu, 20 Aug 2026 06:10:03 -0700 (PDT)
X-Received: by 2002:a05:6300:2284:b0:3b4:5ff3:45cb with SMTP id
 adf61e73a8af0-3cd00e24fb6mr26660589637.8.1787231402812; Thu, 20 Aug 2026
 06:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <069ac343-254c-4ded-948b-9a78ad665ac2@oss.qualcomm.com>
 <4mc4lmxzz2kpwtmxja5zsgn32kmudut6kod3pfqvtesqwgf37v@jfnozyogszve> <bc7688b9-4568-4040-9d86-56ac3ea7c655@oss.qualcomm.com>
In-Reply-To: <bc7688b9-4568-4040-9d86-56ac3ea7c655@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:39:51 +0530
X-Gm-Features: AcwNN1WZEyyLiFTCNssK1DyJVf62q0W1dBdB86-ljgpDUzxbNOjkBZcLFPNyp3U
Message-ID: <CAO9ioeU5YLrqux8A43Mvtd23jiMFan+AR=Q71HcLTLPwiH8b_g@mail.gmail.com>
Subject: Re: qcom: add NSP firmware for nord platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5OCBTYWx0ZWRfX71EutAkxqe6/
 g9n7OJXQaGKUfDkXtt16wtcH/8Fqj3D8LvxL1R4Ce2Yr6AA+lbz50tjqRCpYXWBy9K/Cc60s+zp
 0onz1HCjBLvYSY6GnykPMB6A8pCkqtB0RlUMT1fcmv2RAHwkSoHECOvhaVLP4g9bbWVnrSHlKcC
 4R12TppSanpKCEcwy9tMvF1rwOLowG6riivpJ7DiJsOUg9r2qKOZhRm+QJ6kndt+x6c0EF+NYTW
 fsZFwP+7S9FabaJT0fEx1IH58EcZ7T57vmA9jyJpFuBATlGRadJ5srrKvWJxQYDCu8pk7PxkSQX
 94c/sbAR41iWjSy8wQsFPbRybDEC6Pq+HGrieXaM9b9wbL+pq70C9pDJKI+CeoQk8BuDyVLUhTF
 hRRy7AMbHrU7BOWOS1MKXseLp4CA84NkxeWKONkdGqDz7SGDjfETRxdF9teSkAm85I5BCLNo6VS
 s8vhmUoIYMvpcWZxN8A==
X-Proofpoint-ORIG-GUID: tnslU98kb3rbTw5qWTMNeYHBssUSROqV
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86fcac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=cHOCstO4V-xgQ3TBTE0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5OCBTYWx0ZWRfX4aDGoD6X96iO
 JigrkyQz8KiCKBYayW2g9HyMtP6Vv976klt+nF5sJPmFKJFtQ0c6G8w7wPrLE9tWwWHsOjBda8a
 MohFPBhGXTyg/Y7ZD+e99plAjtgvl4g=
X-Proofpoint-GUID: tnslU98kb3rbTw5qWTMNeYHBssUSROqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200098

On Thu, 20 Aug 2026 at 18:37, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
>
>
> On 8/19/2026 4:45 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 19, 2026 at 02:38:08PM +0530, Venkata Kota wrote:

> >> ----------------------------------------------------------------
> >> Venkata Kota (1):
> >>        qcom: add NSP firmware for nord platform
> >
> > Is it now common to all 4 NSPs?
> yes

Thanks for the confirmation, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1183

-- 
With best wishes
Dmitry
