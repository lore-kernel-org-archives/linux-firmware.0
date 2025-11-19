Return-Path: <SRS0=qm9z=53=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52258CF31AB
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 11:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCBB8C2BCC6; Wed, 19 Nov 2025 11:25:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2890DC4AF0C
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 11:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2890DC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7aFIp718744
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 11:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yr/a7Wyqmz4UakHlhHTGT4w1wBh/qJiMwm0tRoKO2mo=; b=AiP8M1gZbCRrPLhj
	GKcAbADtN0PWKGfdJph/bWd2GroR9TdUwrNlcPV6mxTMT1F+qofZ9m9zwgBptYJJ
	63m8/+3xzcPWhRrX8z6+xKX4FcKdNtr/qc1xlqPeCNihhnWhAAAwK+xju+WyRv6e
	kbScxoYaLkizwTrkoU2XuILCuCk9KMT8LoOFtPWMq40NyInAnYnGEXuD3HVvIJm7
	m00B6E+FfwCKNRhbkzKDmT3G9rC7W8W5hNgWhrbYYAXsru0AyoQ4KCIpFoWcKdos
	wzAO73mjo6leP7ved1g8nyV1s4BwkA9JNud35tVJ/Vd4H8bnWvJIUTzQUOZLpfAu
	owKjOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0rpgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 11:25:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so3069546085a.2
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 03:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763551516; x=1764156316; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yr/a7Wyqmz4UakHlhHTGT4w1wBh/qJiMwm0tRoKO2mo=;
        b=AbB0VCDZ2T1dnfZDB9JMhV/xnbpD7UYjpTJMU2cWTbcjbJLsLpOVbdlwl9nfoDNy44
         IoCGDRI9dU04806lOyclJpaDY8OqkBpd5CLMFW9E5Yf3nli8MPwhPMGbdy3m52oJeRhO
         af6+Ovo8QbVIQik1PtgOsOAWZJa5rbq8K+ejD7MLLjPvDOWWho5BqZR+v6KYIx9r6rRa
         yZOHoWOcNSyGJBKN7ugpB47OqJxiHJ5Ipms92cczUOcNcDiN8yigwAdauudDLMAhBHKA
         cJEYcPZvZrUOnlDiOQay1RgfAyL7LAVqh1zBYUtH82JKq10yG4HsRGpXuCJxzFIxlg8p
         hD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551516; x=1764156316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr/a7Wyqmz4UakHlhHTGT4w1wBh/qJiMwm0tRoKO2mo=;
        b=dBJx7O25cFW3/kcjFSdhyDZL0Io34N+r7vqQW1+9v6TpxEckbGfHvxglTfOF+q8t1L
         5Hnw1V84pWVPsk1s/b/g2ddq1UW6HX5ihMG4ItXNnKP/LJ868SHvTzzpa9TJW2rj9vJd
         F/UiS/suDOY8CgRY4RVttR0VY8AVpEXpbleI98Qtdm14PHYgv588umFpVr/GF6ZwQGOb
         Chp07ClNeQNQK9FRjejJtQoFHu4rmyJUagmI/VuFlwOwM7xl5Wh4JlAAypUb4WqVqFNm
         mXYDKNnSju3F4R9+Vu+2dAxMOQv/49ZPTcFDx4WE9iDPIEQJNUDiUj49IcZ+9kvV0gSj
         N26g==
X-Gm-Message-State: AOJu0Yx72r5clMiM0GLhDNlt7XwPkjZrkbNfIZsHIilQ6Q99ETQ6NZE3
	rLNyKSEJJd3Y7ByA9m5hNIlj4o1KLDJzW3ShSWHbdfc1rs40wZGY+D8UfnEihoIS5wBvs4yiBPA
	d295tPAJVTcM5hlUXwgZxkF0TQu4tPOCrYua6EBukptnk8eoyVtOQZOaOiWV4470=
X-Gm-Gg: ASbGnctW8PaSxYbAzsjaDv9Uah31Ir8o+Qur2NaAhFM4Jrlz5jA74khPeUvpO1/0fq3
	lJX7Uwa+8ffCjCLP+nP61ukKcU58aUNxJSzXobNeXvJkR2VhUK0x0k+6Z3rAh2pGSsuULz8G61D
	b6gTD7jXtCyLNWrgO6tMWtPqtpf6aETjRTNA61+5GnJrmKQ504X7UZ8YVdPlC+qIA6pzsSD73Ru
	DAVfPE2u6+ceFv25BqR5GEzrsu6jLTueo/EmUKWiP1QyBsN3lLToxMe2IlHkJNGbToVExEvGMby
	JwJm0rTV0ol3MgmK3clmdvTX7Yb3Jh04f0V3x2KX/KmiedOguO9lZ5Nnxu1LAuUXRqdZfMwtlda
	QpRh6P9Q+zQylgJHwTUcjlWvEuZMyG4CgMqsghBZBuXyVBIRJ4gQYyw9Ie6oeaVadShHcFSpMo7
	/FYlApFWV0KGFvxYCZ04qA9PY=
X-Received: by 2002:a05:620a:170a:b0:8b2:f371:55fd with SMTP id af79cd13be357-8b2f3715844mr1118178985a.73.1763551515927;
        Wed, 19 Nov 2025 03:25:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6SSepsM82zO59ucxrz61hcSxV0dtUdE+YyF5D/Lf1mFSjLpzTpgb4yJZP7AZXcfS3GKxHnQ==
X-Received: by 2002:a05:620a:170a:b0:8b2:f371:55fd with SMTP id af79cd13be357-8b2f3715844mr1118176685a.73.1763551515461;
        Wed, 19 Nov 2025 03:25:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040567dsm4599251e87.86.2025.11.19.03.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:25:14 -0800 (PST)
Date: Wed, 19 Nov 2025 13:25:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <renjiang.han@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Subject: Re: update firmware binary for v5.4
Message-ID: <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA5MCBTYWx0ZWRfX76BB8l9vAF2G
 iAaftq44rvKSiR3iMCIoFsmHaeJihUYMqSAFWZdRThQ1hVcmhpO2HzkiRJkpYVHHDay3+di0APE
 C1iS56dQGivIVCqTZ7sfa1xzz7D3n+1B/SXFybVcto2l9nPCuRscOPVAugQpMhY+OgyOlKxWRkw
 enZQGan1ThfS1PMejk9QlOB9s+3a4PFKGHq/I1wj0jRtUogzsDCASSROQ+cskeS13q1U2i4Xp2q
 Pn9WQvaF6qmcx0aE6EXBATYPIxMslkoz+Q5pK1KpDiQ84ldjKWZuMuOCXd3nDUjUB31Gfz8/GFT
 rdi2yCXNx9G10oqrUF0sWCfwrI8U+JHjksvc7GSKY+SmRBJFX2y5JuL5kDSZroU/QM6QmNoVwLd
 32JsAvngRaucaITnhL4ODd5WmOzJtw==
X-Proofpoint-GUID: ukKOay0MR3t-l4nlw3nOZE_A14cosIkA
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691da91d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p5k6FTT1Lh1Z2aGC3xoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ukKOay0MR3t-l4nlw3nOZE_A14cosIkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190090

On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
> Hi
> 
> The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:
> 
>   Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 12:02:02
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> update-video-fw-sm6150
> 
> for you to fetch changes up to 0a6f987b7b07a6fec2d4fd42ac4473c0523d3af6:
> 
>   qcom: venus-5.4: update firmware binary for v5.4 (2025-11-19 15:04:09
> +0530)
> 
> ----------------------------------------------------------------
> Renjiang Han (1):
>       qcom: venus-5.4: update firmware binary for v5.4
> 
>  WHENCE                      |   6 +-----
>  qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes

And this firmware file is also going to work on SC7180, correct?

>  qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes

Vikash, Dikshita, could you please comment, what is going on here?

We have added venus_s6.mbn, then dropped it, saying that a normal
venus.mbn can be used on QCS615. Then Renjiang added venus_s2.mbn
(why?). Mario merged it despite my NAK, but that's a separate topic.
Now we are dropping it again.

The firmware is the ABI between userspace and the kernel. We can't
randomly add and remove files here.

Which file names are / were in use by the upstream kernel? I tried hard,
but I couldn't find any mention of venus_s2.mbn in any of the patches
on the linux-arm-msm mailing list.

>  3 files changed, 1 insertion(+), 5 deletions(-)
>  delete mode 100644 qcom/venus-5.4/venus_s2.mbn

-- 
With best wishes
Dmitry
