Return-Path: <SRS0=qm9z=53=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC68CF394B
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 16:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86FCEC4CEF5; Wed, 19 Nov 2025 16:40:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80AD1C116B1
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 16:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80AD1C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkZqT2094012
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 16:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpqX/m6rqLZVrDosS0BcqY4e
	jcjMYsEfLv2GnUM1yVc=; b=IaQB9aEVE63az7E6v3PZpPIWcwhYGM/19PMkW/bS
	GPvKIBaw6kj3ojTE9TZ79RW7mPuKm7Zddx0sV9jvj1fMItkkYr+kaVta5eLB+6sk
	DH8Ls8XO9p6z5kURCOqfkE7TQFW0UntaELHOIklweaPj806O00qaUC4haPKC4ePm
	x4+uZh+eqQWI/lqs9WPZOot3KiQsxrkSXCsffBbbydWEddjrFQeE4ZGdUnn7sP5c
	9I5ojsMd/M+5PeaxDqXZQbNQ2/r9o9zGryNydnXKMnprJPr2906sSk8wLmnMNZu1
	JybEgQvjKCZQx5KB8j4KZLsVPpYFTt5yvyAVgIkpDkIBRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah88w9vyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 16:40:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso222651691cf.2
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 08:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763570448; x=1764175248; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpqX/m6rqLZVrDosS0BcqY4ejcjMYsEfLv2GnUM1yVc=;
        b=WNaetq1vPnbU2c/vCuV1KG25q6ACq6eTTzDS8OMsLKu+V3F9Dyd546vCwhaUA3nV+d
         +S0pMVwMBzLQrMVHOCH1GoAzJo4YbCTK3Czy1v9BYGWOzuv8sr0VmMfGj9lsAJBGj7gE
         bdxj1OeWLBnLDknKq+JKUQSOMms6Cr2UVQLIWSHzukKRJvOIqLv2jvreWXV8WDU1p6LM
         0sbLGsoUoT03UzH1tYYqYV6zlQp7q4ge76TJlQVQ2iHrZlGVPd9R8kyypTFYN9o1SrlH
         LsixnTDycqYXnhJOQx8nWptBC9YN7YdGNNRSve5Ht94e4vTfBZzFqJj3A+iuoIRikSpB
         Ka4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570448; x=1764175248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpqX/m6rqLZVrDosS0BcqY4ejcjMYsEfLv2GnUM1yVc=;
        b=gZZjoEnW4fCJu0XpKgaULmsqH6hYamCSm9RXG6h22jChXWGI5DdAcBlN+mpS2mz+f+
         tc0JdjmbkOy7mbgAQcaGuKzL3+PJbi7IBCm0cb0UMroDXS4qsfWUaeeXaWleifF11E4h
         B+MGe231eAOzQrV9SjcQuAxjnw4/G9wuPqkXQPMY1BPEiU8AVfF0KMVq+6ma1H0a6OnC
         O1+7tLM0ANQHrKsj9f33fbaTQux2L3CHsNweySuaAkT/wtwjmahhrVJwaFybX+IKMlNS
         Qymxk6cCkpb4ls6voh6JsjdPeYQNGvwk6q5JJcDiBCkhDB82juHnPTA54IlG4lFgcxd0
         hTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGP880zD6JP+xQ5dox+e0WOds8pOw1FJ2abrMYn+6ei53MJN5JpdxgsyI0XhXGkatR4N4jqFRes+PHTNls0w==@kernel.org
X-Gm-Message-State: AOJu0YywKd7OOB4AHp4U6rbpZc+1YZyCFrolZFxYhiexyJGmnUWQvn8R
	ckWSdnWDsrEn8jmBfUaFyUmmNj1D/7VkF4SbqY9DpWshvqDHE4KwF8aSrthwYdDEGfKiJGlnp35
	mAWdWTTVyUQcMVIujwpajJ1l59M14siRK4ldDR6+eSWzgKJDEehr9cyGm2I26UJg=
X-Gm-Gg: ASbGncsicYiB0Nni9Vk3EFr9g5V8K5JJgFq5+naIVJ6ju4NKvUHvhkzbr0dfT3DKLv+
	x7Bz8PelRufiCuwG/FumCvYctzMt0Bx1BaWNIS2Yqlsn9sFApy1N1YGwqrustqibcpSOOPPhfhP
	K+PeXMKtWJD5mKVsmh2UwwgRfiLzM88EI9R8vtZzNPnfptSEJAs8qDTzx1KtO3cULzJARj7AqPi
	9Eo4idl4268Us4V/ndpZ06wumRO/7377LSU9z8flPJVFvk58nLIhABczn0axDtTHVCasiEJIb1N
	fnFJemUbfa32EFbUOKMy7ayMuMcHrYV/Rjw4i6vPL7qPXlXhVpixJD/EuKca+oBw4MMu1V2i1nn
	X1iGKwaebx4FHiisC5ptaqVZI1geTmj6oMEe8CcKcvUGWk1KL6ZXVrJMJ532O6UAqTsApLODc/U
	qnj+tP434mP9jfkpxPn9rac8A=
X-Received: by 2002:a05:622a:389:b0:4ed:44a7:cf78 with SMTP id d75a77b69052e-4edf207fa83mr295914731cf.34.1763570448020;
        Wed, 19 Nov 2025 08:40:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGv2IpAQUbhb4gOv7Yag0uomnJnG4PEXl8jFSBBkhowMMNTgg8SVPvGdp/WOl6NWutN00UpyA==
X-Received: by 2002:a05:622a:389:b0:4ed:44a7:cf78 with SMTP id d75a77b69052e-4edf207fa83mr295914411cf.34.1763570447580;
        Wed, 19 Nov 2025 08:40:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405a4esm4859991e87.95.2025.11.19.08.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:40:46 -0800 (PST)
Date: Wed, 19 Nov 2025 18:40:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-firmware@kernel.org,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
Subject: Re: update firmware binary for v5.4
Message-ID: <iznnjuldjlzscbasoxxwgemtd37pemtpo37dw2q7fj3pfct5y3@iepxxugydewz>
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMiBTYWx0ZWRfX2Rr4jzNYi3Ub
 E3flbfIzQaYsI8SLNNHdlA9ijyvugdlF52o9iIjogDvpg/VDH8GnE8uuWeGZTmN0mkVBfmL9zr+
 NOE2FPS6yXJI+hO+j6kTnXXEVikzBZVVxrM3dyOIzDqB/yCIXseey8/gyGLabUs8L27zCE0uavf
 8ktxQwag/hrFto3Y8X6K0K69azJ0KNVJUReEpAWx23x7DcPjo62LTbpd82EVmKLOr5wXcM7bYBG
 LT7y5P/IAfmquWGrNqEVo1eUVivdDK9VDzc7nCJ+bc5BRnowK0T0crUPwb/bi3V79G9481qZXdH
 dZ+1CxfYa33NRsjVMcLfmp9j1nAwMQJvnuoNsaLRJBeuGW/qz8eLOK7PKifBtkeDwUqHHelnsAU
 TklneEPdFSL5qMBngOOjW0ZkkOsEIg==
X-Authority-Analysis: v=2.4 cv=YKqSCBGx c=1 sm=1 tr=0 ts=691df311 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jA7b84KwVhwt0_gD4FcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SKt-yDUCUhMUaerUeoPbpb_XkuVXO3f5
X-Proofpoint-GUID: SKt-yDUCUhMUaerUeoPbpb_XkuVXO3f5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190132

On Wed, Nov 19, 2025 at 09:49:17PM +0530, Vikash Garodia wrote:
> 
> On 11/19/2025 8:22 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
> > > Hello Dmitry,
> > > 
> > > On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
> > > qcs615 while venus.mbn would continue on sc7280, but then we wanted to use
> > > same bins for sc7180 and qcs615.
> > 
> > What is the status of the current venus-5.4/venus.mbn file? Does it work
> > AS IS on Talos EVK that is being in process of upstreaming and on QCS615
> > ADP AIR aka RIDE boards?
> 
> @Renjiang ?
> 
> > 
> > > S2 variant can be produced now by re-signing this venus.mbn itself. To
> > > achieve this part, there were some elf alignment fixes, which is done with
> > > this bin to make it re-signable with any vendor specific #.
> > 
> > I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
> > is the difference between it and the new one?
> > 
> 
> VIDEO.VE.5.4-00060-PROD-1 had ELF 4k alignment issue [1].

Commit 891a8d4fdfef ("qcom: venus-5.4: update firmware binary for sc7180
and qcs615") left me in assumption that at that point the
qcom/venus-5.4/venus.mbn has been working on QCS615. Is my assumption
incorrect?

> 0x34 % 0x1000 is not equal to 0x0 % 0x1000. This part is fixed in #62.
> 
> [1]RuntimeError: Program Header's Offset, 0x00000034, and Virtual Address,
> 0x00000000, are not congruent modulo the Alignment, 0x00001000. (Offset %
> Alignment) must equal (Virtual Address % Alignment).

-- 
With best wishes
Dmitry
