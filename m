Return-Path: <SRS0=8jUd=XJ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE82C369D7
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Apr 2025 13:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EEECC4CEED; Wed, 23 Apr 2025 13:12:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1495DC4CEEB
	for <linux-firmware@kernel.org>; Wed, 23 Apr 2025 13:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1495DC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBHV7v003738
	for <linux-firmware@kernel.org>; Wed, 23 Apr 2025 13:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i6INjz9VlFTAboAQOoGl8pGTR4FxtinNYNI3syDXwMM=; b=hjd5bMBtH5a4jL55
	LjU5GsKSwYkuYzKdAmNKZ3jIzqwwG1z59mY+4MEuDHFMp9+kkAx7Li2AXOPHPk3j
	CYBrSGHCzJRaej8Oc7ngXQvJ6Y48xiKdwsCYhMgfiFHEntXFjShQ1e93PAAUIgXg
	5xGl5BIcU1/9uoTVSshG4vA2YpdYHIN4qb5MNZROXUIG2VjmeQf/biAd17jOFk9g
	ymYdmb4qtTfiwC4YJBsRg10j52tY29H7cxxt7MpA52KTCGLBJpkHK7LIGEALyjnJ
	s5bA7IP4dVgrPjxoW29zLphk4mTWtsnmrCqPHFzs5BO/jXworla3+BLvHCWAv/e1
	oeL/3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy270e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 23 Apr 2025 13:12:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9255d5e8cso962416185a.1
        for <linux-firmware@kernel.org>; Wed, 23 Apr 2025 06:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413954; x=1746018754;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6INjz9VlFTAboAQOoGl8pGTR4FxtinNYNI3syDXwMM=;
        b=C1HYb2jhDCwtN4Wvq4HnrIqLx4h0cxeIeB+U7p+hzRHDqpaV5PHLzU3IIIrH55YHkB
         J1hp89k82QaI41PfEdGZEMqTVoacQkeoJbxA9Il6jiDU07IW5zVcQ6b7TSrsEyUoYin2
         reb4gCCpohrjTkWo4Sl1enz7xib4JHwee8Lf63YX67RpqP3XgnAeI2/SNoKh+zVNYP/4
         Fdrn0HwKSgKWr9H424Kpt2xgwCee/JwEKX1NUK/oO6btat80PEAiPfJXa4S8eh4JKpSM
         0m2Zm6dePtMpCoW7YYdxMBlBYDfwf4p8AWtND9B6Ex/R6bG6ft5vkvRfmuKjdfKy/nDx
         nYxA==
X-Gm-Message-State: AOJu0YxxTrapEnjwxuRzjObxH3v3Z0EGVoxPTMpPYPMfuaq3h/VwX23l
	LhFxt5g3Vrscds7NwJPiST3mshc8VUHBBrxMMXF9CPdHRh4TJ3mM/9WV7bYVIdtNzKKwYzzxkBn
	hvVnS30MkV0+dplmTakh0u2cB90jSKEdWTrSFFw6uhsw45v27hM0SdMuTr3wS+0gHOuc=
X-Gm-Gg: ASbGncvK473ZJdDE+olnrC5t9KKd7+SODP6nWZK/FQAXWkR8ORXL8IGGcBqY1f0HTCH
	VN7bC/TZNvL0yuoCwlI8Y34KmCpnKwA441keS476xNIlmqiCR8uoW4wIULm6vB8auIVs/gqcLv+
	fqVd28lRQclUJVrmGrBnsLDWhX9ux0C4L3oHNzkTFCxMrkSs1pKFHxZmLSdMYBavS9Rxottg6mR
	8kgzUnkX7XGzL9vzpgaMiQxXtqtF16R60R2vYnBiIdjC8TAojRBqQ8Z9NPH5fM5LE1WlXMJelsu
	XyEzzFLflCn7Dx+S0A8IQQJ1P6McCIR5Y4gx9nCwb2t5d9e3lk86SyAFMbHu4hYLPG2ghRP3PDo
	=
X-Received: by 2002:a05:620a:258b:b0:7c5:55f9:4bbf with SMTP id af79cd13be357-7c927f59238mr2985805385a.7.1745413954012;
        Wed, 23 Apr 2025 06:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEClzx7fk2f2uDA8l5iD1CMClXEIOwL2qw0hLU33kH3soo90BARwUQtLNZNuCPuUtCT65mXRw==
X-Received: by 2002:a05:620a:258b:b0:7c5:55f9:4bbf with SMTP id af79cd13be357-7c927f59238mr2985800085a.7.1745413953593;
        Wed, 23 Apr 2025 06:12:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5242a2sm1525213e87.2.2025.04.23.06.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:12:32 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:12:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: Firmware point releases / LTS branches
Message-ID: <pcd74ztxcixlus3nyybkg6mpuz5usb5gdhfrbdqgsuwb3s7wr5@p6t746ujyner>
References: <e4c6c159-7824-4fa9-b7b2-5f36c97ef6c2@oss.qualcomm.com>
 <CA+5PVA5rSmTLL_rWOd7n=0oB5Za8fPeOTOvukR3KfFxve+vkRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA5rSmTLL_rWOd7n=0oB5Za8fPeOTOvukR3KfFxve+vkRQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MiBTYWx0ZWRfX68WXGSGa3gfX 79UiDpcr4dpieaw+EqPwf+Tbmoam80/2jTBQ3NYz8LbvZjq0o2SDhps6zqEYwKeHUfXlNzcWvW8 6vNoUMoOufLKYv3ZHj+6wpWWc9ddanf9W6UPNs5UfYWu90QKbIHpT4m325DZ5Y9OcUYnH5GuJqp
 O0+WE2wxifTrmZF58Pt3eYl944c0jV+RMzchdSYXhuwGZrYz1CLa3kQFCbOoikmQH0R6zGofdiX UJfTYXnV3w00UVqBnEj25vqGuK2fmas/hjEKx3xo4oMgCN5qnfTZDDfsO1SPzMAcBSdjVvTbhln Uy9gdDzrXGeeQnOvCQn7cQ43EPVwogL+ljiXlRW0AEVaVQakjGj8NXLCrYtCCuAv1RIAscnPjmz
 vCEstfZCZNQ1+J87m8Yx9VjHmxNkgijlefo/IWYKPirFERdhOoSlITlOc5bM0OrTAj3KY+lj
X-Proofpoint-GUID: zUnuT_am22J71Z6JQGuzdyd61y9tXnvF
X-Proofpoint-ORIG-GUID: zUnuT_am22J71Z6JQGuzdyd61y9tXnvF
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808e743 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=5WLm3Qisolem7uxo55sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230092

On Tue, Apr 22, 2025 at 09:41:15AM -0400, Josh Boyer wrote:
> On Tue, Apr 22, 2025 at 9:22 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Hello,
> >
> > Up to now we have been having a single stream of linux-firmware
> > releases. One of my colleagues has raised a question of providing
> > bugfixes for the firmware. In other words, what should be our course of
> > actions (and should be our recommendations to the distributions if we
> > want to provide a bugfix or a security fix for the binary that was a
> > part of one of the previous linux-firmware releases?
> 
> That requires firmware vendors to provide more insight into the
> changes being made, as well as discrete changes for fixes vs.
> features/upgrades.  It's more work for them to do this and we have
> little influence there.

Yes, that's why I wanted to trigger the discussion. Sometimes it's
something like https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=919632
Another example might be the LeftoverLocals story, which required GPU
vendors to update the firmware (with explicit 'security fix' notes).

> > Usually we can not recommend e.g. Debian to just bump up to the next
> > release. By requiring them to backport necessary binary patches might be
> > a bit of a burden.
> 
> Why can't we recommend Debian do that?  As far as I know, that's
> exactly what every other distro does.  It's not entirely clear what
> problem we're trying to solve.

Debian was picked up as an example of a distro which tries really hard
not to upgrade package versions in the stable releases. Yocto might be
another example which nowadays tries to be version-stable in the release
branches.

> > Would it make sense to handle a coordinated point branch release at
> > certain point(s) through the year?
> 
> Can you lay out what that workflow would look like considering the
> main concern on the vendor side?  I'm not necessarily opposed to doing
> this, but at first glance it seems rather infeasible to solve
> comprehensively.

Pretty much like the kernel workflow - the maintainers define one of
releases as an 'LTS' one - preferably with some coordination with
distros (if that's possible at all). Then if one of the vendors
identifies an issue in the firmware shipped in that release, they can
provide a backport (or just mark the corresponding trunk patch for
backporting). Once in a while l-f maintainers mark that branch as a
point release.

I can and should probably explain what triggered this question. We are
providing firmware for Qualcomm platforms to linux-firmware and pushing
our users to use that repo instead of various home-baked solutions. One
of the engineers has asked a very valid question: what should be a
workflow to support our users if we identify a bug in the shipped
firmware file?

-- 
With best wishes
Dmitry
