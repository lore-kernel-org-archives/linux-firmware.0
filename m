Return-Path: <SRS0=C38d=54=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FEECFA446
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Nov 2025 22:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D7D1C116B1; Thu, 20 Nov 2025 22:24:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 554E0C4CEF1
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 22:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 554E0C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKKBKIW1830845
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 22:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jiAqUTYOeRftQnNZgEvkvFMz
	lMjLPoyokOsTsjWWdnM=; b=Fkq2Z14DONumNLzHAxE/y6bp64w0qsdyEQQMtxFV
	Ih2RUklgMZBAehCEfJqHtyZrCPsRNoaqSkszjAXfJOdyyuAfGxL8SaepA0bbq1Jt
	OWPVyIjajJCKgzIKkdQC70hIe9Fq6sn6bb8YC33XERHRtTX2JUA29dxkW7c/xMJP
	pH5Qjz5nssdvuNkCgCPpN+s6CCjminJTspoZW22mqMPFmQg+VM3SXZiedYJlQFVf
	50dnh1L/sOzyj9NhiR2CgmztZSJRX/NvWi2id4BM3yA/mKeZVBENlwatUI4nQ+rG
	XJRPeq7xUV3SRET8oVUCxL2Ag4tnxlgdv8APBeRpzne3Wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj0kw29ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 22:24:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so47373691cf.2
        for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 14:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763677487; x=1764282287; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiAqUTYOeRftQnNZgEvkvFMzlMjLPoyokOsTsjWWdnM=;
        b=FpMyET/k+f6i1tvzUJaeEw2jnAjmc2wB1tLIfGvKNcxJBFQdECMVkMCkpwZ9kN3BUo
         z1RiEvWpJZFPS7xf6xczDxha96oeC2IeMVfaposJwItulgAfGfPIgehGYtYFSZPJ4ckr
         v6CPW20tGQmq6CDpfCx/9lOsFGdZ/OoyZgYL6d+AppLRq3OhREKHNd9VFCKJc2VE2aRf
         dk/SD/0MT66bMLaK0CCRaiiS+nBhe3daYiVAN196AvGAeol9nPPNg5n3zTgRX21j1MQa
         HE9VDaeBkq690Fro2Jqz9s4uLHT1AGTVStMF9xhM6RY1hPTNj0b0M0svVMAeTIvtyeFv
         VTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763677487; x=1764282287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiAqUTYOeRftQnNZgEvkvFMzlMjLPoyokOsTsjWWdnM=;
        b=nzRUI4yM3TwASQZW4vj+FACfYy+NCqNrAqcJNZ9vFFcRUyZ3rzaXYUoM2AXdv4+tdC
         X2+iFytUpK6uxGrFgDK5hTy9IUGLvfpH/Jmvtig55wLYEeOXj/wx4lDqC22KaMmv1Y3V
         C53XHgY4A0X1rvMuG5N8L/T7HTcQHSTBBnTsnfmrGmkldmpanH/nhS/nm3NdXfHsjwMc
         xnx06xSS5Dp6p1255mPWmtZT2ij01hpqBaFYO5GGwp1ACI1RN87wUVtwwps1DYYWiC2V
         q9hVmt8SlP+tyr7PEKOXwLFwMbgMIx07/qg7u1mDm0U2w2LOUcIQB/saXzMXw0zNY+k4
         zaww==
X-Forwarded-Encrypted: i=1; AJvYcCVdquvKCwogvjWoJ8UqDWk9uvsYVK0b3StO19i37U8pvU/zrUcS6rm/+b4Aey5czJTN9Lqk31SaAvrlGQRM6w==@kernel.org
X-Gm-Message-State: AOJu0YwBggUhn5dDLeF897M51E5OvFO02Z4mqK4kiTkE1cC8fvj0R45L
	WGKOKkQs2ahZ8xEdSlIwP4Q1FexIDYwGfvxeb1XW7wUsH4fhwG7PzCPHeS3oSpI9gXtF4xRHjHm
	VRpsI46XbspKYgvBlm8LADnO5+EU/S7Xofygmslhxk1u4NmzS29hNkddWM2pfHOs=
X-Gm-Gg: ASbGncsLxM94UMKzEwEgNbXSFSKdNeg+NMuCB3s6FqIG5BeApIXGJKbcQ7ycfit3NLW
	QsiDikvfhsUG781xwhnNnOJP5r+lHX5qnKm7jFPVCMt5M8epD6aXqm/IH8FMUIsHnS87HY5udjB
	CPNV9gZu41TAtg66En7SUckaGIbFb9cCXSSQdqTsqY0F2BhOjBC4uofHjJRGBWYXDlkqzkQGoDa
	gyyC84axmFbl0UR5Pc8GwU/4iyKYGhPs3HJJFdMaSfUtfperC/v4wF3V2gr/MiacixlCBAJanVF
	RmGI6FZbHdBWeeOyEYXfJCG8niQArLqujGJuM3ash+QXoebQ97KGzXMaAmh/hMbW96N4lpanA7s
	XVQbsFgdmDhrGD8CK3lGjFVe/6ZKu3ATzxMFvEYUPEDy1nxi9VCz6xuzpO3GlZlP7jo3gErMbUq
	z2Oz0Ur6EDOWdNpef9zohn/LI=
X-Received: by 2002:a05:622a:14cf:b0:4ee:2154:8032 with SMTP id d75a77b69052e-4ee58a850abmr2315591cf.6.1763677487315;
        Thu, 20 Nov 2025 14:24:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq+xLhkAYy6YGVKDeHswSQe1/kG3bCnkgbkilTQZvV28LEfD5IPE0FBnMGxQgYL8mMO44ZkQ==
X-Received: by 2002:a05:622a:14cf:b0:4ee:2154:8032 with SMTP id d75a77b69052e-4ee58a850abmr2315181cf.6.1763677486771;
        Thu, 20 Nov 2025 14:24:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbed31sm1042742e87.51.2025.11.20.14.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:24:44 -0800 (PST)
Date: Fri, 21 Nov 2025 00:24:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-firmware@kernel.org,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
Subject: Re: update firmware binary for v5.4
Message-ID: <vh7nnjywovzr7oeaou3uphfhzc7sxry3n3vg3miuj7ydtelu5t@hvylaofyuhbc>
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
 <iznnjuldjlzscbasoxxwgemtd37pemtpo37dw2q7fj3pfct5y3@iepxxugydewz>
 <1db4c5a7-74f8-44e3-bb56-cf075e4391bc@oss.qualcomm.com>
 <lp6zqc63rznqakiyixdjnzwlaesvoelcmbgrxosq76ijufuj5f@gtwleb2fz6hh>
 <0befd966-1db0-4b47-a8fe-a40a400a7103@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0befd966-1db0-4b47-a8fe-a40a400a7103@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WeUBqkhX c=1 sm=1 tr=0 ts=691f9530 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=k_mR4zDn4L-KDjP7PNEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: g8J6Zd7J0aCCFtSxG1NG2mu_z7BZYkoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDE1NyBTYWx0ZWRfX6TgxbsBcHPaY
 aZVBg5tV2YPDYM38AGSRhOQGyexJ4CJZxUS4ZXLOEONv3tKWGiXoDqMK6/q+hsbWIkISqLEZFqw
 zd6JTeXFo1/9NHdhjaLCVh2prh/npWlXS3pC/a3qEzh0zGaKveH5JQgOPm03YDH8OfzMn1vosDb
 8n46DpHVHVl+1gl4SJOw+1hDw/D+qM280ceHoPL3x2Vdk5+RKkfXdeNxOp7iHzPMjIjQBphWU41
 O75SJiFzdfAwakdEnVsxWhJoJ042VbA/UXzp0bNRO3rmKtx31qMt3R6lKuFS1yzf/J6Adl5LUDZ
 zrERE5/n/WqCaLrFGT+I303jF9sLumE5sWSsKqkQztmyU8++ICNHFnJt7+358e1r+F1RTBWlc9A
 ZC1HLAmlSQU3PEdW5DO5MM7yLUoxog==
X-Proofpoint-ORIG-GUID: g8J6Zd7J0aCCFtSxG1NG2mu_z7BZYkoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_09,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200157

On Thu, Nov 20, 2025 at 03:45:03PM +0530, Vikash Garodia wrote:
> 
> On 11/20/2025 6:33 AM, Dmitry Baryshkov wrote:
> > On Wed, Nov 19, 2025 at 10:43:14PM +0530, Vikash Garodia wrote:
> > > 
> > > On 11/19/2025 10:10 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Nov 19, 2025 at 09:49:17PM +0530, Vikash Garodia wrote:
> > > > > 
> > > > > On 11/19/2025 8:22 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
> > > > > > > Hello Dmitry,
> > > > > > > 
> > > > > > > On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
> > > > > > > qcs615 while venus.mbn would continue on sc7280, but then we wanted to use
> > > > > > > same bins for sc7180 and qcs615.
> > > > > > 
> > > > > > What is the status of the current venus-5.4/venus.mbn file? Does it work
> > > > > > AS IS on Talos EVK that is being in process of upstreaming and on QCS615
> > > > > > ADP AIR aka RIDE boards?
> > > > > 
> > > > > @Renjiang ?
> > > > > 
> > > > > > 
> > > > > > > S2 variant can be produced now by re-signing this venus.mbn itself. To
> > > > > > > achieve this part, there were some elf alignment fixes, which is done with
> > > > > > > this bin to make it re-signable with any vendor specific #.
> > > > > > 
> > > > > > I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
> > > > > > is the difference between it and the new one?
> > > > > > 
> > > > > 
> > > > > VIDEO.VE.5.4-00060-PROD-1 had ELF 4k alignment issue [1].
> > > > 
> > > > Commit 891a8d4fdfef ("qcom: venus-5.4: update firmware binary for sc7180
> > > > and qcs615") left me in assumption that at that point the
> > > > qcom/venus-5.4/venus.mbn has been working on QCS615. Is my assumption
> > > > incorrect?
> > > 
> > > Both #60 and #62 works on QCS615, while if any OEM tries to resign #60 with
> > > a different signature, they would not be able to do that with #60, while
> > > they can do that now with #62 with the ELF alignment fixed.
> > 
> > The commit that I mentioned had 0059, not 0060. Also, if the ODMs can't
> > resign the binary, how could you sign it?
> 
> ODMs can re-sign it, if they are also using sec tools v1 based signing. If
> they need to use sec tool v2, and tries to use this binary to sign it, they
> would face the ELF alignment issue.
> So, it would be like
> - For  sec tool v1 - existing binary would work, no ODM have any impact with
> fused firmware.
> - For sec tool v2 - *same binary* can be resigned with v2 security profile
> and can be used.
> 
> > 
> > Is the following correct:
> > - 0058 works only on SC7180 (does it work with the SM6150/Android?)\
> 
> No, for SM6150/Android. There is separate bin for SC7180 and SM6150, and
> hence venus_s6 was raised earlier, but later converged to use same bin for
> both SOCs.
> 
> > - 0058's venus_s6.mbn was signed with MBN v6 to work on QCS615
> 
> > - 0059 was updated to work on both SC7180 and QCS615
> 
> Precisely, at this point, both the SOCs were made to work on same SOC.
> 
> > - 0060 was uploaded as 'yet another binary to get it working on QCS615'
> 
> This was raised to make it work with sec tool v2 _only_ for QCS615, but
> later we could find a better way to use the sec tool v1 binary alone and if
> any ODM wants to resign it with sec tool v2, they can do it at their own.
> 
> > - 0062 now it's another binary, which works on QCS615 and can be
> >    resigned by ODMs
> > 
> > Is that correct?
> 
> Thank you for putting it up nicely, and i completely agree to have this in
> commit to keep up for future reference.

Hmm, maybe I'm now misunderstanding your comment. I'm not asking to
capture this history in the commit message. I'm asking to write better
commit messages in furure, making it more obvious, what is _actually_
going on. E.g. 0060 is a definite mistake.

> 
> > If not, then your colleagues need to start writing
> > better commit messages and being less shy about explaining things:
> > I basically wrote the summary of the commits chaning qcom/venus-5.4.
> > 
> > And if it is correct, what was wrong with 0059?
> 
> From 59 to 62, ELF standard alignment issue is fixed. ODM cannot use 59 to
> sign with their own signature if they need with sec tool v2. There is
> nothing needed at ODM end if they are using sec tool v1 and having boards
> fused with either 59 or 62.
> 
> > 
> > > > > 0x34 % 0x1000 is not equal to 0x0 % 0x1000. This part is fixed in #62.
> > > > > 
> > > > > [1]RuntimeError: Program Header's Offset, 0x00000034, and Virtual Address,
> > > > > 0x00000000, are not congruent modulo the Alignment, 0x00001000. (Offset %
> > > > > Alignment) must equal (Virtual Address % Alignment).

Which ProgramHeader is it? I don't see any alignment issues with the
0059 firmware.

$ strings /lib/firmware/qcom/venus-5.4/venus.mbn | grep QC_IMAGE_VERSION
QC_IMAGE_VERSION_STRING=VIDEO.VE.5.4-00059-PROD-1

$ readelf -l /lib/firmware/qcom/venus-5.4/venus.mbn

Elf file type is EXEC (Executable file)
Entry point 0xf500000
There are 5 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  NULL           0x000000 0x00000000 0x00000000 0x000d4 0x00000     0
  NULL           0x001000 0x0fa00000 0x0fa00000 0x01a98 0x02000     0x1000
  LOAD           0x003000 0x00000000 0x0f500000 0xd5de0 0xd5de0 R E 0x100000
  LOAD           0x0d8de0 0x00100000 0x0f600000 0x08468 0x3f4000 RW  0x100000
  LOAD           0x0e1248 0x004ff000 0x0f9ff000 0x00020 0x00020 RW  0x4

-- 
With best wishes
Dmitry
