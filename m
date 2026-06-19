Return-Path: <SRS0=KWmO=EP=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D5ACD98F6
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 23:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87A6C1F000E9; Fri, 19 Jun 2026 23:43:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781912628;
	b=fd4wpRGl//hy5CKyMQ5t6e+4hkw/CE2d/WtQvzfjxA/D5XHW4StRD/v+ETg3b4RNS6aH
	 QWtS8+0jTOPSQ/vvHStGwEV9/JPBzqF38PGIeptQsDxaqDY7gibB0MDCexHI+P4cYeAwq
	 SuS+M3J06gJNKplkq0jnNOsi4RsK/8d6XYRzqPk2oEvL599NnhdU8Z6qLgapZOKRoS+Um
	 FG6KKN2gol+D/D6c4/XZ8sBZvy4BCeIDecYr5KigKvXv0CSvB+uz8Mcpb5hOZGogm+jz5
	 i6yYF5YhI9XiarxCisIDzmcP8SUKFVa3HLoOXh1Pe404oHvQ8y1x8L2sYC3LqbiUzRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781912628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=obLv7Kagx6AIpUF1zP9cJUFI12gvRIUwkER8BMrN9Oo=;
	b=SbzMTE3H6kNZ2z9NQVAGP8EUraQYhILG69dMy6N2JoTfUREsTlCMBppn5iQzb/lfljjp
	 GrLRXiCD3DGwUfyZQRMRgcpImSiR7o+eoMVJ9JdGT4AN+OPubSjms37g1R0xIgnRDTGwD
	 /FTUlPV1vgBEksjqkI8XV025GWEpIXe8tY71MvUDF2FPhFky1xw10AFutbj5UgfRtOm+S
	 az2G86YXCxo44fBJbq1t5pKdyPRn04AdzXpmnDlkWXACbOl7O7p6FbWS/Mc0YrIiWAUD/
	 2DxBD3osj6FW3x4+LdCfewfLv46yMkvM9Bm0AkzCMKIfASnBU8pZ+CKVZT7NGQKPQMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVuSrlUu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VixuQmXU;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D037E1F00A3A
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 23:43:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVuSrlUu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VixuQmXU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D037E1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JLXn461819229
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 23:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=obLv7Kagx6AIpUF1zP9cJUFI
	12gvRIUwkER8BMrN9Oo=; b=UVuSrlUuUrtJcW/w8vhe4a+1QQTXizEEh2cKrsZt
	ri/sqZPPnltxibNSw7j8M+vWjKPlbhLhzVvB4h3P9/7iqbe517KfrMp+U4eI7QGR
	6nWjf8pnOz7ywHPHGyLbvbs07KLADJHlzK4v8gFCWUTaE057ahO0piMEQg9r1/fQ
	2xoOmNibIW+RlE5sQ7sAv7R1G9KPANLrla//42CEt9DMV4K0ot70LtQkvbcvXrog
	HWCebtHF6gRg5B8VOUvmfsCnDzGXiruBFVeRzNKshH8bv6/6+zm9ZB/LJm1zEsNV
	XQW05EtrLaP6EGK7vqXTRnIap0mvxK5nK4t1l82FxzdJpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sdebd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 23:43:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ddefc5be4bso35048716d6.1
        for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 16:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781912626; x=1782517426; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obLv7Kagx6AIpUF1zP9cJUFI12gvRIUwkER8BMrN9Oo=;
        b=VixuQmXUDuHT4TBgEsqXj9VkFeNL+SnjUrluXKjz6CB65x9X80bMCpRufAYtt17miu
         DBYbdMdoPtmjm9Lc+vzG/oX9oeBtryapuUTYcb7kkj35mrppfZ6V9M1RJ4SK04X4G8bU
         eCgbS9rPyTKjvfM70Ck5MTeX0tJ0DbzPZ4GOV8yeTuxkta6DMtP7YIbSgPaDFDHy2ACa
         FIHyEMu3TSFVo9vxSiL4u5rRlMKRXJ17M1SxZI7NaKoGjMpdJVYtXZwTmBZkBnAx15WG
         h1dJliKVcO2al39rf/80n8T/3vA4hUAGIYW+HF20B+O2KHB1JJxIFPxxnuHa1rXL7N9n
         lV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781912626; x=1782517426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obLv7Kagx6AIpUF1zP9cJUFI12gvRIUwkER8BMrN9Oo=;
        b=FVa+S9eQQACuruNgRVYE95YFWJakwmtrnHDRitS9dHfeom76J7ELp1bEdqUWGslX0H
         cKJYobj1y3C2fvsqnYIgP00xld/aCRihw7S6CS8fDf+fZHnEtSdayxWNryXufrGocVGt
         WoWBcR7MXiudoNbV7s13v8h3nuIRSV5e+kJMCCzPMUxhpsLliqGfwpVs0+b8inYBOwvJ
         ZB8uNQgT9AqStq1EdstAtoWWLgDZOPiBOu9V4HduNWjOJNM1moIf64Hhw9wZLVLeuph7
         VuqfAzCcVxKMI2isYbQhY0N3lhNdXjY/EQf1DQfsTb/aGm5DCAQ+cXBM+fo/Awj2njSY
         6bCA==
X-Gm-Message-State: AOJu0Yw0RqKr8AgArQhERIgHN8RUUOBjssIKDx/0gog/47wE28yVfD9g
	a7JnDkvndbjmROiovWlK/ymb5y5hZCvKtpL7y80oPCQ+qa6/LPU5KtNb3DAuLEDphm4bc1HKKE+
	Ag/6Mr/WkO8EXOFUCJ15ua3ya7nbfBYKiH62y+HuOLhqUfyA7pCGO/JYFSNPs/qw=
X-Gm-Gg: AfdE7cmh6wHvpye+rt9iTkrQQEKnqnQ7JR6fh36BanX28vVg4P5e4gyR55sd9dtaHLb
	Ex+GNecJwiRvlDR7qgDW7vrVpNYT32Jh0535KcKf+QLUYoXfklptt5yg6Y+zlQJWHGOUUW26oCl
	j9u1WqrdxdDHTC7yY09QiAGTw1rWNkYz2DDXblxMUt95oehB78P3p+l6OIp2B8Tb05fjZfnZaXa
	JH+4orI6biQyzsqBkLA7iWEnw4LHq+XRStQlPRjUepIiay58zo+mgRincG/I/c5KxFCgoa+7+Ec
	6dAEZqvvz345YaDep1fIZ5/UPKe7zH5eAfYBe20WwQhU95EUKUjX+vG6AyS30BFwJEthvElfz2m
	xcAhFf/9cNt2LOQeYgsdRSqhjVsU/XyxKBztJzMN3Tp2tyDwwHAedoALQsL+cpLVSTqPFiPoFWl
	Mt6b+YqKNLSZeKeCrU5giU/FLc
X-Received: by 2002:a05:620a:4553:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-921d124da40mr295796285a.20.1781912625600;
        Fri, 19 Jun 2026 16:43:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-921d124da40mr295793385a.20.1781912625063;
        Fri, 19 Jun 2026 16:43:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999af9f3b4sm1292371fa.8.2026.06.19.16.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 16:43:42 -0700 (PDT)
Date: Sat, 20 Jun 2026 02:43:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <skatakam@qti.qualcomm.com>,
        Mario Limonciello <superm1@gmail.com>, Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
        Sankar Reddy Poli <psankar@qti.qualcomm.com>
Subject: Re: qcom: Add qdsp6sw firmware for shikra platform
Message-ID: <a7eslfbqnu37ca2mrobjvlkpgbu2qctkiukvrfpjnjp4yngupp@drusp74jyf2p>
References: <CO1PR02MB8569B45CFD8912B922F7F833F9E22@CO1PR02MB8569.namprd02.prod.outlook.com>
 <i5hdfoxkerni33fwe5bfgpgi4h3xvgyt4vqwdntfyyomoyzc6j@qiasphycvz4r>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i5hdfoxkerni33fwe5bfgpgi4h3xvgyt4vqwdntfyyomoyzc6j@qiasphycvz4r>
X-Proofpoint-GUID: Q6ub2EoRoYZJ4FEWxFVA1HOjGmkOT8Tz
X-Proofpoint-ORIG-GUID: Q6ub2EoRoYZJ4FEWxFVA1HOjGmkOT8Tz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDIyOCBTYWx0ZWRfXyEDCsHSH6SdR
 R32JSMi3eCWVZOrzZpUjsrulm40L2Jc4Le2H0fQtZ3G7TnkGTSRnk11xUhp+QrKOmoZCVC7gjUF
 XlBCVS0Pso7ovKji1k0YaO0HCGdfhTiWv+B5FdU8BO78A3iLLe5AGBtEskiqxnK42MrQa74B+sY
 nrEtC36hpdWzZWIPDcjT3yFnTQsEWhho8ovh9/s8k3gwCz3bG+69aEgZ+85mIe3nvvlDvCuAIYT
 AzPzM4Aeg8tzVlhn6SbXVSY7D/1UuH3yJVVSw38fisOzlLyNnXQF8KavqKD2WCwrTMwVgktsx6T
 gVY9+OptaDDhXBHGroszTTyokDRkW30znhNiWIQ2oyWPCZ89YeHhaQlOSXwQXd63rrsiu3QQ9TP
 7fjzLoSdYudXaZOQ3+AQRFWKaWdkXjGK+HXIIGjXrE9Kgk22Z96bc4ZLnoFGoxiXJOxabWBPqzT
 W+TTLeRdwvyc5xKub/Q==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a35d432 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=WNjQ7lqZKne66cI27coA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDIyOCBTYWx0ZWRfXwWsxT5PRdLll
 RAdQU9vR92GegMm9fjfdnTC0SEHfxFAAUv+v4/J7IuMxB2qF8U2z/07yvJpxhBjVO3FDZ2tuF45
 LoPzXAOauAh10k7A06obFOoMzJ88prI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_05,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190228

On Fri, Jun 19, 2026 at 07:11:42PM +0300, Dmitry Baryshkov wrote:
> On Fri, Jun 19, 2026 at 03:30:54PM +0000, Srikanth Katakam wrote:
> > The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
> >  
> >   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 +0000)
> >  
> > are available in the git repository at:
> >  
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git modem-fw-shikra5
> >  
> > for you to fetch changes up to e5851e6ff573e78d5b0a5cceeff076efca8d46a2:
> >  
> >   qcom: Add qdsp6sw firmware for shikra platform (2026-06-19 09:48:10 +0530)
> 
> Josh, Mario, would you have any idea why robot is not picking up this?
> I'll handle it manually later today if it's not picked up automatically,
> but it would be nice to understand, why it is not being handled.

I've merged it, but we need to understand, why it was ignored.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1115

> 
> > ----------------------------------------------------------------
> > Srikanth Katakam (1):
> >       qcom: Add qdsp6sw firmware for shikra platform
> >  
> > WHENCE                      |   2 ++
> > qcom/shikra/cqs/qdsp6sw.mbn | Bin 0 -> 5709176 bytes
> > 2 files changed, 2 insertions(+)
> > create mode 100644 qcom/shikra/cqs/qdsp6sw.mbn
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
