Return-Path: <SRS0=zEwb=ED=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01013CD8C8C
	for <linux-firmware@archiver.kernel.org>; Sun,  7 Jun 2026 08:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C94571F00898; Sun,  7 Jun 2026 08:27:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780820841;
	b=RuTfl9lPGYRdVsyiK/v+NC2krgpdJ7dT/3GXHdRLRBjWjBlAwho9+Q0p8GXBY8j4plZe
	 pg1iMi6S1NCCguWOVF3rjCpshpyTTEFlvV1XkCgzk3jBNUhrfNXwXW01IsRnDUd43L3e4
	 AlJ7PDHeJ+C05R1v4gh4URieKuCVfk79nXvNFyS450hkV5XmRPO9qpz2HFblOPDSoS/q+
	 WdDbufr/HfPk2xA1+iNyl753KcaBOkaPVPge8JyQ+MtMR/sOB5z2Vx0axxyoVcMlSuYKb
	 pGYCUNi1q1TO2PLH91Cr5GDsilcYwLmn75xzJrP1tF4/QJ3wOZBSukb2xo8ZlDRHfrQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780820841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=f5U7gWPL6YdfqYvbIUbaIwcPwKSx40bc9fxFMTN2AD8=;
	b=uYkdqAuFo3aTUkXHFd6LmODHxjNld+uPmYt7HCFKfBX4pq5A0/AV4eLqdlf+Fq9s4LoF
	 LphFG+/SoOi0m7+KZ1G1jFf5NbLLzNrRapPcm0McNOmIlxeHvfkHXBFGQwYVUclgwDpxe
	 ROrDGuPJCmJBOEDp2d8MFgjBe4bx0nwzkCJnjoiCsz6h42GGuOMr0ZhFxDBLZOLbgCTAF
	 GfT7YoakKmYxkWnstvWPM8i1JZLozTTl6aJ0UCW9ovwlVEx2fD417ij7s0n7vlc3uBcaG
	 kSSANMFizXbjyzUa4mO4xXpXPdWEw+QoBDNZPtdhfgRnD7adQ/qn5y44SIymUpa4ijA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVxN80aW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AyADIScH;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B7B01F00893
	for <linux-firmware@kernel.org>; Sun,  7 Jun 2026 08:27:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVxN80aW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AyADIScH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1B7B01F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577BVY64148004
	for <linux-firmware@kernel.org>; Sun, 7 Jun 2026 08:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f5U7gWPL6YdfqYvbIUbaIwcP
	wKSx40bc9fxFMTN2AD8=; b=WVxN80aW98/SsQc7NIQwAxLCtbbI0T0lBMN2rNKU
	OCHZQTA7G4pnd66Jol0bIwGz2tV5Wb0gFmCZtH0c5AHYO4hvihGRq2rJlzdHdsRO
	MleC6UutjarzFe3UFN+7sRESOzrF95cy0fonOeuVfjmBBUl1+kS+CVmrV5RMkXO6
	GkKAo2LApE5mThRG5di7BUM3b2nhRt6JNXbO2npsPWOjpGGx4TQIywK26ExquREM
	Fi2OrNRYJTiA7GKyNFgY4FUbJwZ9nyDhT9Ph8GJGBNyHIEUae33tUK/SNl34z4J1
	/52fdmjuM2YQFUmU/3cHgKRLjjRVZwE0f7M8DkRWOJ/tsA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w3fe7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 08:27:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfb3463931so4344859137.0
        for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 01:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780820839; x=1781425639; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f5U7gWPL6YdfqYvbIUbaIwcPwKSx40bc9fxFMTN2AD8=;
        b=AyADIScH2drMQwBytsK6v0vALYMaReB5nXDEfxHJZ2876aCnbITCAUKczuqWsBwi1Z
         uXM0n7dtICZGgNmRF+M2rfncrhXinFrdRDhirgNLweFGmKpULL6QMU4dnNa4NJcAwvYC
         d5T/5Z/+bb2P2I0VyG41jwVQh67HtyWwOtCADIFRp5MF7zMqIb26y+vhq50q7mLT7Zo9
         pneSBlVjIUDoEwlvFUvO3qL2Ydh5nzEaJiEQAfV85A+/tZ7imgOACDNLZZP/P9YdvPNa
         K95Rfv+GNwZdgq3EEOqzhHoO6NGzatM4Ky3jHq5XRo2mYX/NVfWUoqW2Ju5tJrW9M+Gb
         Bnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780820839; x=1781425639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5U7gWPL6YdfqYvbIUbaIwcPwKSx40bc9fxFMTN2AD8=;
        b=aXoUssRBq4Hi+1Ge1X5gVB31PwfRuGA2KtYRmTmmZvhnwEKH2XlS+4n1NZ1OjBbsRH
         9oi5wQmQzwwy5IgSfqQYwgh99OV4DFWvRY08rKJjPvyrZWABqaazCrZ7OX1uxgIkdygj
         o9uoQHnNnSDx/kJmUB1p4Fy8BJyf+1kUydMRJsPhfet6nMUfJ7fPWmMPiGiKAFrGF9Kv
         gyvqiv55nHDTS/2JE902V7XaXakz+ny1cOHMPpJjUDG950LK5C78x0q5ViT0vuQHurDQ
         rkYsY9He+ehso48OtBx98Jp8rr09qAPt7FA6BcwkrCugP0/jmIedgRXihiuY34Dzz4tw
         gTPQ==
X-Gm-Message-State: AOJu0Yxhv/9Zx2OLarFgC5vJ1nlOApx72zCsf5LqZnZWdac1eQPrv4qK
	1CTar0rdqHxGFBg7BrSx6YWEIu4FkE9aDzfbr5qz7BQffgl4kaqf68aD+Byj9t+97pUg/1QsNs2
	BFT1uCLMKDTvqRRMcJDQBqHcs/5qMmMfEes7reyDvs1SJIaoBO56X3F/J47Prc9+Feiq1cjU=
X-Gm-Gg: Acq92OFLvO5s36qyu1sJIf8ASNiktSYGl6Z8x6j6xSKAnDAXDoooNMrGKwtVikTmpe9
	DbSSb+Z5o8hCeM/Od119JRWwejjE6qljf5BWfZ/QGCktqxNC/PTUH4p1dyxUWl9KxQSEbowblAi
	w9s5utd4bmX9LOoQXo+2yZ5y7o7R2prggycEUklzBq/nGXNq/eqJEpdKv9iIMAqMQjShxOgK+iv
	Ayz43q0pYozR8jRj8b4EpAljD6eLL/ISF5sgQ5bufdmRQnvGGrFBMiMmIHVoMUc45PCdTSYnvTZ
	b8o5nUt90fbF94u189R+sfrvHm4x6pYcJYmQqCx2teLBqlGpGQXknkiqq5VK/HTukdB0IYCOVb5
	ANvvDX+iiiPHx1/549nk2RtVjgLD5jsFD7uhHHkuKKh8RBzHaFCimcGjSKJMh6/VWYqV6XnK966
	VrTaaD3+cP7ncyOTTQ56idEpglZljpBie/6SwpEVky7rCiRw==
X-Received: by 2002:a05:6102:3e0b:b0:6ef:d9b8:88d with SMTP id ada2fe7eead31-6fefc8b6fd2mr5783334137.8.1780820839287;
        Sun, 07 Jun 2026 01:27:19 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0b:b0:6ef:d9b8:88d with SMTP id ada2fe7eead31-6fefc8b6fd2mr5783331137.8.1780820838847;
        Sun, 07 Jun 2026 01:27:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b042sm2944022e87.47.2026.06.07.01.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:27:17 -0700 (PDT)
Date: Sun, 7 Jun 2026 11:27:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update DSP firmware for sa8775p platform
Message-ID: <2vrx3wv3zztn44sglmpcyyfslq4npaw47iytchn6ffphcra5jx@mckreexfsd6e>
References: <24b6e1e5-5d2e-49f2-8d63-a921eaf3ab3b@oss.qualcomm.com>
 <CAO9ioeXOROr4rQvkGWmy3OG-03Dq-P9B1XnJXutVOzVn0dEC0g@mail.gmail.com>
 <f2644d05-ec91-4a96-9f92-6993a7bf078d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2644d05-ec91-4a96-9f92-6993a7bf078d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: q1B1VHn7CNYGO4fBH3iLPZB46jsU5Dt7
X-Proofpoint-GUID: q1B1VHn7CNYGO4fBH3iLPZB46jsU5Dt7
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a252b67 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=EUspDBNiAAAA:8 a=DJEpATKe0MeNTvurOP8A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDA4MCBTYWx0ZWRfXxvVfX9pTKOSq
 I+3FY842UpntTCZPLbYQ+1k1djraDQRt6IQ3hpq+6ew/zlJuO0KL1tPEAzfjfr9TF9EnorEE6In
 n/mkaNgtNil8dJeRrf7yWPrUVnqnEBV+rxXe2vhTgquoeF61TdChr8sA/BDB6cqpGpXAZMUUo+x
 KlzVV93Gubue/Po555bNowVlS8EybsuP/gXpHHucahG9SCWUtm1M5xaRNGZ2ucTyA+uDspEvkjV
 UCWL6YQxARp5KQfJUdsJUvpU1zL/1Nzb0inuAn8sgkceLtZcSnMS4fbbQkS0mG6mhCHrAz2ASn4
 LkSJj+Vi8InhFRJ7Gm7S6Uk3FQUHYxbx7suffsrsQ6cy94gi1lRdNJHlAjXGMy8FjGB3c0+gUm/
 BHZH9eR/qsqax3b6EhwCZMTTLq6s5MO35Z9rFZwbaRSXP+IwNMaYiWAOtb4wReUXUiN/SEVqnfS
 WNBzW2l70QZzRUlttDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070080

On Sun, Jun 07, 2026 at 10:01:51AM +0530, Venkata Kota wrote:
> 
> 
> On 6/7/2026 2:34 AM, Dmitry Baryshkov wrote:
> > On Sat, 6 Jun 2026 at 23:56, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
> > > 
> > > The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:
> > > 
> > >     Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dspfw-qli-lemans
> > > 
> > > for you to fetch changes up to 1aa3b79c6c4d0cc5df27be6cd6ecd3afb380c477:
> > > 
> > >     qcom: Update DSP firmware for sa8775p platform (2026-06-07 02:23:32
> > > +0530)
> > 
> >   -- Added Fluence_module_fvxv folder and updated dependencies. -- CENG
> > Driver Update
> > 
> > What does this mean? Which folder? What is CENG?
> --There has been a change in the folder structure for Fluence Module
> compilation to go inline with the Fluence changes on the latest mainlines.
> The corresponding dependencies across needed a change and this fix has been
> included here.
> --CENG is a Compression Engine. This code needed fixes from Static Analysis
> and they have been picked accordingly.

What stops you from writing all of this in the commit message rather
than being cryptic?

-- 
With best wishes
Dmitry
