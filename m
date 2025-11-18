Return-Path: <SRS0=fUOl=52=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9BECEDDA1
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 15:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBB91C16AAE; Tue, 18 Nov 2025 15:34:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B45DFC4CEF5
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 15:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B45DFC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDfXkF2272088
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 15:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/AREeiEyZBz+NhMfRJaTy9sT
	NsEsDkInuqqsGZdLVJo=; b=KZAhaDrIqf5DQYVXRVjzuq/CmEvIXXK3UnUGoU/d
	v/IF2hpcHLQDHaBk3B3FDALmE4dtqEKLZx5Q6rNKJtr85bYSRBULBcxtGLd9Ayhy
	GfmS6/w96deeeUdo7kpylR4D1hPynT+f5Tsiu9aolXKP5Vi4g1GvrRa+fXbvdIp/
	Y/Ip0kHNTTOc0NfxSsrUp7SGZ6jUQ7WXDou8UstIq902mMPdHzchc72BD5sC0cqw
	IOgbwzr+lyZDZRyDe6BlBKXamBsStmpdJ4+T5Js5eMG2f+P2UGiToN2/aMgH3Es+
	mbcBRJLm7AUknrvfGlTb1DydE2JOlQDK7x+iXYN7zjVZGg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmhg16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 15:34:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0995fa85so61768321cf.1
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763480052; x=1764084852; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/AREeiEyZBz+NhMfRJaTy9sTNsEsDkInuqqsGZdLVJo=;
        b=QsVS+nGj2fZrv5EuVkOoM4RK6neAi5LcJ0HqMm7Gfu9aPJ2s2hAhj1VVnOLm7b0FTm
         faKyI2pTJvR05ukM5u8uyI0D4GoXj/St4rTLqiOnweiK4VLpSlMP9Tv/gvwC7excC8SB
         OegQrPQsNkf49is0RiVxcZba+23yXi+qASDhn5yHx9KnJFnL+QQBpWTvtZroUyUpl7Df
         +viZ8esLwXEHNNGzv/QKqiQBNtPXqDSF6PqPlqf12jE8m04LhkDb92sNvco6ZsVE7SnO
         cYbMay5mIyDiyMxrKlLQk7tmplN1A1jZ59FdltynSoswIxA+DJH6l9CfWOB8lasgST5I
         HagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480052; x=1764084852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AREeiEyZBz+NhMfRJaTy9sTNsEsDkInuqqsGZdLVJo=;
        b=XcxA7A2mK5cX2Lp2UdTFOfOp8ld/nOQ99wCCHj7bp3VbHDHCnD6v1oQ8Jha+eor3TV
         ZNOZmooOHqc5m2Sj1r0XWVgD6W3mobgIdsNnE1/qwu3f/qM+SDRIZRQD3icH3TPeUwCs
         +q2R0hYVOJKuLrOBW/0ZKDS8QIStqeMtWAzWvKB73N8HIBTUGfsaJa4O8a9IWO++CpoR
         LIAG7rucipBGgaBIRifEe63DLG+yyYHfuXs6PrttAN2lKoa9cgIXxI7FcTErH1We6bfG
         zND4urzNapdltlsEAyqqUh+erKluwyYJty//VVpFP0pV30z9gTKQ5fT78BldqKwrUoyV
         9vuQ==
X-Gm-Message-State: AOJu0YzIcaIpDfesjGmJdMmlH4GP368h23/PY8DU5eGzbUFWIbm+HpSA
	NeZh9nPbGQGsQmwoUqOgMGg9U4j5tkZ+Rj0hth2pDBaCfif9RgTFQe7zDXhYPTmRPq/46bcIBVk
	gZISH3iWtfW/Qp/k5sHYzlrP+e1D3vZCjQT+oItyr9+vF5qJMYCyUCdKL/Vt2Oew=
X-Gm-Gg: ASbGnctFcBhcaQSiawcTMbcaQ9D0n1yHTNDKItNZWBd95p30oHyeHX4CFvXg/vJ+gvO
	vgwxKqdftQIjwtyI9Sd1Wz9OSYl4izI9Wra5+dT0ymnnEGSf58HBTAOf2GzGqS33ofy5lu5vZ+q
	6Sr7MXTPWQC7qhB7k7vGpKojwcMV2GewziiYKtot5rMd+co9oQ15eZNuJwwZRKTqGWHWJ/KCBqK
	tmLsexfWaWim01940+LF4BvHJ7tSHgQ+3QZ3RZYvy1XtrIX2GPv2Jb1CLoNPFUQpeA8tQ68k2rw
	E+sNHVkFWomzmaPpG4A+1mWV0ChEcz9B6q4FMLSM8seeqD2lIzU0DbK1t++niEkttxIlxhc4St2
	xnITLQbBSlUhCPlYcNs6fAHw/QXT8gX7IIzh5J4PBFzUlaVF9k5R+W+pgwXvSmtoH+h8KNpf/Q/
	WPWrSYot69uTvQ
X-Received: by 2002:ac8:5a55:0:b0:4ec:f0b5:50d0 with SMTP id d75a77b69052e-4edf2084d5fmr223839171cf.28.1763480052485;
        Tue, 18 Nov 2025 07:34:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpeCIUpk2NBebABbJYvsbLPtEPz1WgjqZx4WHLBiXdYczpcPPWltQx3t4/RZ+7HPSM7dGLeA==
X-Received: by 2002:ac8:5a55:0:b0:4ec:f0b5:50d0 with SMTP id d75a77b69052e-4edf2084d5fmr223838701cf.28.1763480052034;
        Tue, 18 Nov 2025 07:34:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580400458sm4075951e87.63.2025.11.18.07.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:34:10 -0800 (PST)
Date: Tue, 18 Nov 2025 17:34:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
Message-ID: <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
 <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyNSBTYWx0ZWRfX2lBPRbPt4541
 jfNJvjnPR3uNS5ARZVZTpf9NEd1LHyYUl/wsP2a6a5xE9s7ND8mC4AJ9DLTY78iPW9B2rty95df
 SNOOJ9rahf60DvkulP/jPKaetewEExUFAeBRrKAW5ZVUE9VEjo4FZhTtJUEyZDbo3lthtlII12s
 PYAEB7lnNhrwYtrHrME9svbwE1AktI8gsGztwe+HIact/jYSxeCnxNcsYBjOG204bNJVPv+FRy/
 LsaCg23GBdWLy3Bb5eXQTbFf8SqEH4O9LWMzaXWfzvF53ppHMjA3/Q3KG1wfsIMzjcnJZkt4U4A
 EHJGHuhFO7h3HP03YWU8AJnhxPDCtC6nUPsplG0W0B5/PBKeULoc4rlgCSyCMoVLD1l3uPOiSZe
 yKwESMN4DIZF8+Hgctj+2683ibOdgQ==
X-Proofpoint-ORIG-GUID: psfK9-XZasER_iLwO4iBpG1JjhSYdPiu
X-Proofpoint-GUID: psfK9-XZasER_iLwO4iBpG1JjhSYdPiu
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c91f5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=2xmthdgeGaOaki5s7r0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180125

On Tue, Nov 18, 2025 at 08:05:04PM +0530, Venkata Kota wrote:
> 
> 
> On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
> > On Tue, 18 Nov 2025 at 16:21, Venkata Kota
> > <venkata.kota@oss.qualcomm.com> wrote:
> > > 
> > > 
> > > 
> > > On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
> > > > > The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
> > > > > 
> > > > >     Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > dsp-fw-kaanapali
> > > > > 
> > > > > for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
> > > > > 
> > > > >     qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
> > > > > 10:20:00 +0530)
> > > > > 
> > > > > ----------------------------------------------------------------
> > > > > Venkata Kota (1):
> > > > >         qcom: update ADSP, CDSP firmware for kaanapali platform
> > > > > 
> > > > >    WHENCE                      |   4 ++--
> > > > >    qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
> > > > >    qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
> > > > >    qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
> > > > >    qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
> > > > >    5 files changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
> > > The files should be covered under LICENSE.qcom-2 Made the change to the
> > > WHENCE file to reflect the same as below
> > > The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
> > > 
> > >     Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-kaanapali
> > > 
> > > for you to fetch changes up to db069c95dcc16ea84dacb80488464e843ea252cc:
> > 
> > You've silently changed the licence without mentioning anything in the
> > commit message. That's a no-go.
> <Noted> Made the change to the commit message accordingly.>

Could you please add a word about it to the commit subject too? ('update
firmware for kaanapali platform, change the licence')

> > > 
> > >     qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
> > > 19:45:11 +0530)
> > 
> > 
> 

-- 
With best wishes
Dmitry
