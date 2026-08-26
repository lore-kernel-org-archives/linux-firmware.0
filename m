Return-Path: <SRS0=n1+7=GT=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4E8C5DF97
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Aug 2026 15:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95A2E1F00A3D; Wed, 26 Aug 2026 15:30:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787758234;
	b=T9es2fQy8uw99OkF9Q/NhPHwHs51vzkPoh+nt9o+YgnL6ETQgcg0QYcDDV+ZzdwSbefV
	 54m4t8yyhiG6uvgurQO37YamYYoA3m5ClU3L9JqRNivCzI5d+3qpts2JQq1ZSmRv9ZFt4
	 wUoozBi1WucfLvVB1IsGMDFtq3qqLOnpIy1QWDQkikMN5cJ4nAZQ2AA5DnjNWJgFMZkgF
	 bz95UaWsXT4F+Ao/LV4sFDf6eYSA3CHfOIyaKHXzJkjX0zV10K1PsKGwa/pNJLipvLw+x
	 vg6dv/iZ1YeC07LRquu6jYFf1ThQQ7KtAsZ2/gzeH3GMhNPNJk0ikdodHgt64/lK6zw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787758234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2pDh3ALx/o2DAD2Qw4HdlKwn8QYW/GnVThQcoVEkMqo=;
	b=ttoaT1uX9FQeduMkqwCdLdJso+o8LCNJF0UM5BOWiCKWBn7YV4dFkZ5+AbhEBUiDMsU6
	 4uHRcFw1X0bCWI9Bwnh0zbALrmSUy/2Jb3Osk93y/CBV6/rexNHLcQE7rUVpsgpPi9b+y
	 hl0yL1YwvuektZo0lMuDudTX68GT6BgAH6pXRVXQ37ygZWt1uHuookQ01OP9N5wNO71o3
	 kGuO9eHjbuNoAo7dR5i/b27wudFV0kjdBfDJyeFFuzDWDMdgJDRpXBI0sJ4I5klsxYC5m
	 WNTkbmDfoY2gSkcNHIX4CEWBQGoQaKtazHRihYdW3mAruFJS4AGwqGA+P9ipTRgKp8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPGfVMO1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGWv1RLB;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA71A1F000E9
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 15:30:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPGfVMO1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGWv1RLB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EA71A1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDukvP1120044
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 15:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2pDh3ALx/o2DAD2Qw4HdlKwn
	8QYW/GnVThQcoVEkMqo=; b=VPGfVMO1ArqJXjv5jOSAg6ZmIINBWzES2C1ySSd3
	U+5EZhBPYoW+5m28xTS/JufALVmTxcxgvnl3R+ThyMy9m+NNVrbmUJ+Tyk+jKI4Z
	xdg4mC2mIH9vft4EsYESIP6ziiaNbTRHkkzau9ASeesNmuksX5gPbG+z8JizTHv1
	AEgTZAEgo7YuHCT9dMOq94DUpKW0jrFSgOYWrGcrLjLQXHue/wlkW8MkRO/hyGS+
	3K4AkteG3nGTNW/aTEnskM19Sp9tJCMpKI2TP2ORMlE/QlvKNcQhQcFStiZduQ4b
	+5sO1XhedvL0mhQiwcq6b8wHDNepTPXZHNyn+5eQH27gJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k2u8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 15:30:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso8011391cf.2
        for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787758232; x=1788363032; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2pDh3ALx/o2DAD2Qw4HdlKwn8QYW/GnVThQcoVEkMqo=;
        b=IGWv1RLBpVy4X50Cz9LHJrFD7as/JPhfXTYESCTIgmNwF7vdEvmDqtyieYoq5cpnGJ
         OMUZyKwW6GZWMBPqgM4nhdtbnxEfofTiiuBqVGLIxlGDDc3XjJxM42nl5WY0GPaHM94N
         jNeHHH1Fx3kWZRqJnHPXlRf9Na0+m/HBH7lJHLPT2wwldTEA/dci5MZJw2Z6y7Kqk4Wz
         tVrihurfJq33PYl/9IkGV9+1TYbXxh97Uz4iEbN7d0Ij3PhW5FPj5cXAlfxAamEpjret
         Ahe9pFKRja9XsqvutG0LaTxoPvUGy+IjVgGBpgpi9wubUvvARfKbby8XvfDCK5VzpLf2
         Tx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787758232; x=1788363032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pDh3ALx/o2DAD2Qw4HdlKwn8QYW/GnVThQcoVEkMqo=;
        b=e+36FCx01qn/QUOjBtWgf1NNmUbly502FzqyotpTDhQhj71vTX+P7e0GsYkGj2p298
         iepZUaruP/AXMD57SRl5e7iWFk10ZEvq4cE1wYAx/7VjZeCzL/XxeHp2mwem46wytcGz
         ygbvCaIXPLuQHSG0FL0SwCoPWru6YfVSsTWylqc5KvAG0VucD8Lj76s9Jjr45ZrCIcW7
         u1F/0RnOVmScDhdJGNWYmR/rUT+SobuMTBb52VHCZSO04DJudhXdv2D62eKjQAwita4G
         9rv1OZ0K60bhKhs43GItTol8eUcAVPywrUP2OL5frF95jkdqY7ltzdXhRAc4cWM4Xcx7
         Gw+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6JRmAKdw4c2CcWEIHWXkNpyhSBxuUFTs/OKVIMXzIjqz/R8nzz3+7KGniYo1vEkVszQJnjkj5kp+HeojN5g==@kernel.org
X-Gm-Message-State: AFuF++lRmeR23hv8+ECV+T4/ImLVyRl8CFDg7WQhe9B98kSyuVedP5t/
	/RI3tIWeivCACgvU20LBqWQi64aCID6+YEi4L4Ku3wC9BwBR/1mC0HMgDPdkBFpTNHbJhUk+pu6
	T/IcpEDGwqEG3CzDY/mJZV7PxZtgGL6jR9+15bT29CX2SNY4oh+IeU0FFwg+DdrU=
X-Gm-Gg: AR+sD10TRO7sSsP8FaJORO2YprJmdxU2x+XrkFHV5IFwsoxjyJ3TWz56tmD/tqq3vN5
	GmykW6lxpVZi6lwMk/B2XSUnEhi8ZAfdcOuZYrf68SKsvnatj2NwQxkVCb5Zd/zO8HvhAPl4yz2
	fOzJeiQgzeX7w+u0bbW60qMRSAUZW31fgoGsSysdLfGik8Jg/GcTobgpuWOiZNsdnaF4pKEB/Pg
	ROYqrKCXWN85FddndbaCqLv/Qa3KdHpN7mJISItsw0uNWPmSBO30WeLA2oXwne0pL9TcLXrONqM
	lxzho9se5Pn8m1mgz+hxA4kE1qntS2ttsJMBgl2fNWZZOjRyaNlbyBqykDeUlK0FkVDRsdH1qT/
	N+fC7xCdPklTD9S0IihJN97grcsjIx2zXySe7FwMUbsdTQxZj1YNCSolwlIxASnHIvNeStYx+7B
	cTcFGaQJ1fcruv
X-Received: by 2002:a05:622a:38b:b0:52d:7be4:da98 with SMTP id d75a77b69052e-52e423aaff6mr75176111cf.35.1787758230023;
        Wed, 26 Aug 2026 08:30:30 -0700 (PDT)
X-Received: by 2002:a05:622a:38b:b0:52d:7be4:da98 with SMTP id d75a77b69052e-52e423aaff6mr75171681cf.35.1787758227962;
        Wed, 26 Aug 2026 08:30:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a2068b3ba3sm3902151fa.28.2026.08.26.08.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:30:26 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:30:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, linux-firmware@kernel.org
Subject: Re: qcom: add HPASS firmware for nord platform
Message-ID: <wtwyj7badkcgi4bkxgdqtknj5mvhsdawglnktflxbdfxxinr2h@rhfylwng3pcf>
References: <9198246c-7518-4c3a-b163-8b3ecc6292c2@oss.qualcomm.com>
 <t433xct7ravyod3y3cynlt4s7qkjha54732yvsguia3a3j4ncn@jgpyp3smfwmp>
 <18b58b9a-2fdf-40f4-96e0-fa732c5fbe4c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18b58b9a-2fdf-40f4-96e0-fa732c5fbe4c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8f0699 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=Bdkg2pvlyzmAbu1r4ywA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyOSBTYWx0ZWRfX8kewZNb4rMMj
 VqjhOmvfTVBaVIO/gaFMpmIHGtzz3mZw6SXKN51JuoYumX/jdQuDYNNr9U4gMC6zAkniZonQ1Pt
 TtCqDKiA+56/fWV0euNvNiNkWC+0/zY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyOSBTYWx0ZWRfX9i8dpS4fPmzG
 2e0qmblJ0bAgAkXpPqMjiFrLwtTCBTfzNP9Ut6GUPjaC+fy+GzgkdDINBftpAtECm6brahbGC7m
 VEsxhFr/4D1xBEIFD9bL+xQZ//pyRHiqm9XuBLeOTGXtkllXznH7KGcmRPw87Hv9opxNZpqdpOL
 iFLITORZjDir0gjq6RL3dy9v/1yRQ078NWxaWLB2XHnSRt5RVWOMNyclCjL0agTeCOJ3brim03x
 k8sHFkwa/PTtqkJ/6YXjj5W28efcR+NxJnwlAxkCSL4ewUmQ8vJZZ38bOTPbCbpmoAfPieilLHF
 sSxFAJyuNQMl8o3VG8yemc6HVvUpDSP4njrrvY6Gf9vWupqyPdthSnYXP4oN3PcQNXEZp1Yzbge
 nlDo0kp5cbRkT9CS3XicTnHqOel4kvAGmoJurRt1QRVgsB4Qz8+FFgqjZTxgeL4tUcN4I6KWfT3
 ryHqoWNg4G1HG6Jr4MQ==
X-Proofpoint-ORIG-GUID: yuqq1Nt_souGr6RRB8BemwGxcOgEpk4_
X-Proofpoint-GUID: yuqq1Nt_souGr6RRB8BemwGxcOgEpk4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260129

On Wed, Aug 26, 2026 at 07:15:54PM +0530, Venkata Kota wrote:
> 
> 
> On 8/26/2026 6:17 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 26, 2026 at 12:26:38PM +0530, Saddam Patan wrote:
> > > The following changes since commit 01205307636157a12c29e6a774bf83b218732050:
> > > 
> > >    Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-nordhpass1
> > 
> > What is the difference between ADSP1 and ADSP2? Do they need to have
> > different binary content?
> They are different binaries as they are not bit exact. There are few
> register configurations that were programmed different from the coretech
> side. Not sure what the history is with that. We are just pushing initial fw
> based on a CS sample of NORD Auto code. There is no new change planned on
> the same for now unless there are functional fixes needed.

We already have the DTB, describing the DSP (see adspN_dtb.mbn). How
difficult would it be to move all the differences to be DTB-determined?

Consider having a single image for two logically same units to be a
requested functional fix.

> > 
> > > for you to fetch changes up to fba487041d4194d30fb599b04285ad9cd766f281:
> > > 
> > >    qcom: add HPASS firmware for nord platform (2026-08-26 12:19:47 +0530)
> > 
> 

-- 
With best wishes
Dmitry
