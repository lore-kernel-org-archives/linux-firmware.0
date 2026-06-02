Return-Path: <SRS0=WpwH=D6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890DCC5DF71
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jun 2026 07:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FEB61F00898; Tue,  2 Jun 2026 07:24:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780385068;
	b=OBuLsOIatS/Q+GNAPlOtw1NCAN4uZvX0w9aPoYAxOH9pk4qHd/j9Mb8kBuEWT2bWc/gB
	 91cyeysAyIt27/LIDxnWFS6VVCuIJa1hRsn5/crcxDAyOzxwonw2YOA52N8JsKO2eY/08
	 scITHC/QtVcV5xyZmh+XAJW2NuA3lPq1p5WBCtwp4xLaYfL6wWspQEvkO3X64VFQPgf80
	 K0pnUSuh7VbU1ittzI0fYum5zEV4YjPZLO3qzxJIxcjqXohclIT9UrWNui34BIl9uRNIk
	 11KslWcBAYaBXNTUXBxNIkMIunPlmLzMj0oaQC3fnf7rnn1JR9hYzp/cJYGQBLx5ibQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780385068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gDdEl1Abea0QWlW/v8HB2YsnIaEu+j/qHVdrQPwrawg=;
	b=HM2INkGh9TOPGfnEaVrtYNJjsa6gRjrCHctusDp8Ntp/ZV94ew3wcukMv9DeVHmv5FbO
	 WCI5o9z2+2ynh04QlUYf0JB6pbQdWeOnpr6fTb6MN7D2O/ESzshHlEKZyG7htK4+L3V/I
	 UceWS5TjcUCdu+WHZIUnRC2ApHJQoH1AmNSUa2vIb+JOUjwzJhsIXsF83IPUxqQfXXGak
	 qIXsYuD2Ne2B5gOgwkqjTwqxdsoMLfYxOcndY9kUaxU0Gp8xJ8iNCjtydmLL/7pMd7hV2
	 aqte5JUweEcy9boVuRfxYtO14z67cFKrCeRrRcZ1eGM5vQ80IYO3csxwicRqiWTHL5w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfIYYcWA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VBK1nZj3;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC4461F00893
	for <linux-firmware@kernel.org>; Tue,  2 Jun 2026 07:24:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfIYYcWA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VBK1nZj3
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AC4461F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524570h1937691
	for <linux-firmware@kernel.org>; Tue, 2 Jun 2026 07:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gDdEl1Abea0QWlW/v8HB2Ysn
	IaEu+j/qHVdrQPwrawg=; b=KfIYYcWAJ5bLTTSLFocl8r3jmF1llOGSAHzmrfT0
	g69K6KQ01qZSGnrD2n2RMFBc1/HXM2G3cP7PWtsSKgAvupbtLbHSZPiR3FAbcNnU
	JXAJUiNEg5KsHgAZK0c4hv55NK+HdP4ZhyQN8NkcH6QxDKQwGUqgxGJ6cQ7C+gGB
	YyYKJxOfNedNtJXl9Dq2mulHQZQQrm1y/WtcUQluQ+WWpe5Mmc9vrt1BzPBDb/f8
	5XrbqYkK4PB4lPwvxDeYb/SZXPWukyAh+lzowvBTAERfjzNUsZixqRiHZSqUj0ww
	kMc49zQ7PZyjmu8JFuEK84hcwsp0SvzDFpqthWsj6qHujw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqubgqh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Jun 2026 07:24:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso4406611137.3
        for <linux-firmware@kernel.org>; Tue, 02 Jun 2026 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385066; x=1780989866; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDdEl1Abea0QWlW/v8HB2YsnIaEu+j/qHVdrQPwrawg=;
        b=VBK1nZj3Djj21r8eCr+CIbZj0/wQeRVxREgx1H2pmnNvj52CXr/5jV63luo53peNBr
         a2Y94bMpRYNWkDzp97AdNsEcv+pLW0mVtO5s4vkDG+36szNyNzY08GQbhVzIFx+ofRFW
         slbYgOhWmpCIgJPy2+f63xx67WkVl2bBTgkB2Bs1iaoAXBo4KirfC/Elr2OL5VnUjoYp
         h9K9+lbiNRsHQUbZgPqMMIxiyrJXIGbCaxPXrgkCJRN2hMGFonnd3a/nQ3P2RgV+Ejie
         n9MQxqxzioW75JcjjFbETFWiOQoR3g68CdoXXOoNmJmEMJWf947yxOASpnoPYMslniFO
         OSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385066; x=1780989866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDdEl1Abea0QWlW/v8HB2YsnIaEu+j/qHVdrQPwrawg=;
        b=A6KIBhJ1OG2nUdcKNbgwhzsqMtlFdbzNWthedaZxGhg7V+yoV37K0YaJ5Egb+KwVIk
         Iin+puDK+gADEhr1EeQYHDkPpNE+85QOGqqPZKOhHUCbMohc5qIaptVBHBQwqfNoVQ8I
         9qMlvAoYckCtxVgvEuE4tMf9wOScaS7Um5/a585RhsZBMRg3+paFquDMliR4Loq27jPP
         Sva5kMSo+dyuOZcAzC1k/4mQO7gZOqi9SdoaOjL02NlSPScHR8wCCa9PxlkXrj3nQ4ml
         iZUwxk2LJXMJ5qGHHcsma3ZN/F0OjkU2i8zTIfZlDr85P13zjeNjCs2UQpbCBKJ4FX97
         e0qA==
X-Gm-Message-State: AOJu0YzHTAoKdSs5B56kmsYtJZOAzLliZKuq2wzyFt5C5iq9NGny5B4F
	5znPnl1KjUApkgWkY0JIOJYd/evnK35fm+7Fn1IheseVPyALSCBVXBwE6GVccRR2ph6H4YtTd1X
	yo9A4KGzDmzJKkzSVoUe1PXC8u3GecHIJD/NnFKs7ZcEdh2iCkpIiRRzEINFcA2M=
X-Gm-Gg: Acq92OHw5zn2xF90CE+grLwQDJGn5gmSevy2QfuzrZ5DlbtUHAyy374cZsnTlCGnFwh
	HWohblENDJ0B3L3hLH8Rxy+4mr9jGAsJB4JiMEaMWhdQI8pcqZpB5h2jduXkWTkxAI2jCL2GKqG
	egox8VqUdnYQXrmPXZLq5BvckVi2SMitqWwR29t3kXkf+eD7GJWD93Y1joMmHqrkFy918CQrVYQ
	Y8aiu8ciesVv40XL33K7ZPLHlZbV1r9RHZOiD7jC/Apo7Sjqw8AuLPz39neUMx+YBmCfjnicH1F
	GlSnVGSHPaLYgmicNruExOs4SgnzjOwltfEj0YgsfZtUEAI8qU5QB/LO+7OHpY4f0Zq9InxpOaD
	dIpyCfR6PKHVYK0p7tSDmFWAW9NxdgChxjyCG46YWCpPeADAOrjjPZNUcuQ7eDKcvv8yBE64ep9
	foTvFxqrp3IpGRCFpda4ds9t3YpRWYgRpCmAsf7R9em1DWEA==
X-Received: by 2002:a05:6102:2c11:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-6c69b075494mr5759896137.19.1780385065871;
        Tue, 02 Jun 2026 00:24:25 -0700 (PDT)
X-Received: by 2002:a05:6102:2c11:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-6c69b075494mr5759883137.19.1780385065329;
        Tue, 02 Jun 2026 00:24:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07c2e0sm2511401e87.32.2026.06.02.00.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:24:24 -0700 (PDT)
Date: Tue, 2 Jun 2026 10:24:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [pull] amdgpu firmware
Message-ID: <uksngobpsfaxsuc635v2i4ogwhiu2guv7ayuk6jzmhkhhp5fkh@pqlwa7ttwrz7>
References: <20260601184330.3325262-1-alexander.deucher@amd.com>
 <cux4kauuuv4wpullm7bpu5h25wmq3pwckady6x4xn5wkcnusk5@tobsihffwbrh>
 <BL1PR12MB5144C8AEC3F2196AAC92C85EF7152@BL1PR12MB5144.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5144C8AEC3F2196AAC92C85EF7152@BL1PR12MB5144.namprd12.prod.outlook.com>
X-Proofpoint-ORIG-GUID: fwuDREArWROl_IEOUlBoYlk1hf3tRR5R
X-Proofpoint-GUID: fwuDREArWROl_IEOUlBoYlk1hf3tRR5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NyBTYWx0ZWRfX5krUOL+4edhc
 Tg3ZT8GbO2jIiXe0ptQ5WNtAIAcjGcx18H8xzuZM2ktJemk2tX6FTG+RdAnOldOBnH8E/8REn5p
 PRH3qPbZjiIniy/dpJ1g5FDm+XbvnxSezCUhYfMhKTcTTVwF9mKopOY79YDd0J1dvyc7SRsBdZv
 zMdbeo9sG/DrA2OwCEoD5TkCli77jEUQuBTAgwiA5oZvk0TguWRq0jGAHHFf/oja184brXDljLJ
 LSkiXdfMRf0DXNlnAFhsUv8//ke0GtZRhlGxAgrN+4Gv+VBBA0rvpljVJfW2tgbP5pFr3PueT8+
 7xGs6KSmcvma7LdpPO51uMmMd0FK7e7fAF4CesfGLfvijV+cntMWyj9hFwbGujRtaBSWv7va4dm
 BiI+YLvHU2yPKChOJOC3rr0bsnz610in/OFfTAHWDNuR1Njt//IiiOCiG+B4ZHP4j3tB5NjUTvU
 m0Y0OU/TNKV02z9xHAg==
X-Authority-Analysis: v=2.4 cv=FcoHAp+6 c=1 sm=1 tr=0 ts=6a1e852a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=VwQbUJbxAAAA:8 a=fOwvIJXDDyEdL4xNIUgA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020067

On Mon, Jun 01, 2026 at 08:11:15PM +0000, Deucher, Alexander wrote:
> Public
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Monday, June 1, 2026 3:29 PM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>
> > Cc: linux-firmware@kernel.org; Limonciello, Mario
> > <Mario.Limonciello@amd.com>
> > Subject: Re: [pull] amdgpu firmware
> >
> > On Mon, Jun 01, 2026 at 02:43:30PM -0400, Alex Deucher wrote:
> > > Hi,
> > >
> > > amdgpu firmware update.  Revert some recent VCN firwmares to fix a
> > regression.
> > >
> > > The following changes since commit
> > c8c796dcdd3b8d1ec71de2c7a71d3d7b1c8f7a68:
> > >
> > >   amdgpu: DMCUB updates for various ASICs (2026-05-29 07:50:47 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/kernel-firmware/drm-firmware.git
> > > tags/amd-2026-06-01
> > >
> > > for you to fetch changes up to
> > 475f6f6d19ba253c5e03b8b51adf78bb704cddd8:
> > >
> > >   amdgpu: revert yellow carp VCN firmware (2026-06-01 14:29:02 -0400)
> > >
> > > ----------------------------------------------------------------
> > > amd-2026-06-01:
> > >
> > > Revert certain VCN firmwares due to regressions.
> >
> > None of the commit messages mentions a regression. Could we please help
> > distribution by pointing to the bug report?
> 
> It came from an internal ticket.  I don't think I've seen a public report regarding this yet.

Would you please mention that in the commit message? Otherwise the
commit messages just mention the revert, but there is no mentioning why.


-- 
With best wishes
Dmitry
