Return-Path: <SRS0=1Q+e=H7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05060CA6012
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 08:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAE921F000FF; Fri,  9 Oct 2026 08:20:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791534038;
	b=exhRT2nNYBtQirlsy8zS2NErWLui2CTfu8+X9fv2P9DAxb6nzReDl3qzcfBZzqQg8JHs
	 bc16hpBeyg5aDCQJNyi2N+LlxNC3bnR1DU+eI7D3f672ihL+W17h93nMq7YS2oKrOllNI
	 WmT5cElUZZz8sOWq9mYxwGUHc2BjZR5B91jDPTwbhYZmvR9Fc4wmd4FLz5zRQgOxpPq2D
	 ywZ3qawysxyyAXzgqbduCjQZzjizjQggD5kYxdxQlROnOP4+7XRp7+atcEmAze3/rH4In
	 yZ0Ai7r5a1RKs/sXlekYznDdP5V11x7dL/rISMatywo4hceYn8NwmvdITQHEPS0S4tw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791534038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5OpqVOH/JLtKkRJeEK8Sqg/MT+eBZvuaNAQdpCLpTW8=;
	b=UkpNgw7o5f4A6ecK9gWBunxs1zcTGi/jx0jcNonjVgpKNvLhGnbn6y+CclZhPH4vDOpo
	 hX47YeXjBM8Tqn3Xu/HD8KnO3Fa807yimTmjrdjhBM3b17ReJe3H6M6tPAPkATcp5+KDN
	 VnmJjZjStsYilXEyGzYbtAcon+0JV1Isir18ewQa4ZGbYXj5FhRY0Ry6vM/spVBnC8DB8
	 P9HuTpFQ2O/h8sEvH8K+60Fsvt6jQfRyLtLT4BBy6hNlaA5oMuJ4o3sFqARdlzsARWS4o
	 DWTdo3X4Tv+hkFIqMWBgBieF/G6cPQaiRx2XUm/vKmhhMDICyrzVMvCSxA/jb8E/uow==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DHuE1oba;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dr9worfv;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 305571F00893
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 08:20:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DHuE1oba;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dr9worfv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 305571F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KOxb3977832
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 08:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5OpqVOH/JLtKkRJeEK8Sqg/M
	T+eBZvuaNAQdpCLpTW8=; b=DHuE1obaRn2Soqk3ESQV81+Q/f6QAklkLUsUXuep
	J3xLZdhj5QvhZU/2WB/ibRUP95ZURfH+xaerXV/Mv8t5FOBq4kwfyvVF2ulv9OVb
	H9s4Y+RJ39HnF68wn1dscz7Ik4I54cxGLaLN1nJQ8tI9az8MJqdGWT3VZTTNSklT
	c8w9H30mfTGEW3qCv4QWfqELMRGI7ZoTk7OU8DSMuFtyNCAeuljy+v88jOS+rN72
	qiLoQpco4Q1QpZT5e+laD1j1pbE5g3CftccxVQT231XnTeeUav3MxyCLc28etcI8
	kqwI0I6gUwxVHuXJhtrNaUeV0+4kfetSNzwo2QISfn/UrQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5awsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 08:20:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338cfe567eso138365011cf.2
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 01:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534036; x=1792138836; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5OpqVOH/JLtKkRJeEK8Sqg/MT+eBZvuaNAQdpCLpTW8=;
        b=dr9worfvr8EJ4h4Cn28+qS99iCnYdlSgMcM35buiyrjIEK9mtmqGe4ywCCdOu03yYe
         AvnIlhNEPD4XmO0tNd7UBlf/zhRn8KLkgt5v6D4NTBxRNyobgfdHPPWnNRGfDkbdBi7C
         YRXmMOV/+Ejd66TonRpoEJA3JqXq8PwBRhJ6PI9+1BsnjrRQacPRiBrAvy43PbgsrVX3
         PjBI5uEeE4LmSDWglYVw2DfEtmSGho/09akTsA9ZdZhnrastZAEjHNGvQ3UFTOXSCC/L
         og8mVY75+Kbon4vtIClVF+BOLU+SVdyvB/I+yz7XMMJsHNTM1+u1FHmXRhpcpfH2kX+H
         W/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534036; x=1792138836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OpqVOH/JLtKkRJeEK8Sqg/MT+eBZvuaNAQdpCLpTW8=;
        b=w0JX/5bqR6L2xxYiom4IOj1A8X/ELWFm87BgazPf5gOGKAWhO0RMvt85SnoRLmJxAP
         qDK9LhUPklvezpJduBY7wtibGve1efV7VoWGHvt8O3dlKop052E8jwZlb2+mj//ctEUA
         qct41MnXIhbPC/ncdq3av7ZJFsNeMvDa9dx05OsWkXwOWkdNyNUiC3ksiGmp6qilmIir
         gfotjbKXRTFVnbAOG/vWEn9yPkrvCXxbadQfsZSM+j/FH9BZZGQfqd/KSnlIwiiGLD5J
         gwVr+Z+TsQtV7NTqm/Nz27FTKYnvq6NP2O7tMd0a++smNfpRWpi8AalPYbBVmlQyq5mY
         0foQ==
X-Gm-Message-State: AFuF++n/mfSF8Gxk+wwk6v0nCmqUc8//w6kyzV5V99O5PJr3eZPOuFm5
	AkOMWCOo0Qgw8OBlna/BOfuhZliOQ9M4MzY8nCmWQthF8az2rHk8YM2meYaFCbLJ6KcpgsX1HuA
	uREdQDkrN1Ez0Px5YjolQOGc0xMJhlqwi+Zsf0vZQI5yk9Z+6bnoh18Uskc6LJCM=
X-Gm-Gg: AYBFou3z7e7BYNZtyzsfNCQN1/n9rTsHyuNw74MsHwdVk4x1urSeVLRHu19WUwZT35Q
	FpB1jM1aAaFwBk0NLCtA3rJWBsMrwATnxLkip5B6kHg+SZZqSyNvD6WdNcFHKErw16Acn+DjQ7H
	Vc/E0q8h+tvsoNY4514ZKfOaYDWgiaKXmEPkaw2oC2mAoEARQx+bLK/sBhGtJ0gZwguvK/r7Rk/
	ctAOxLFv4Y8gY00yrlu1EbrbcsWQr60sNnw+MPjB6bJG/BsDVp9KND2onCFoHODmxBA1LoMBIYx
	SInZjdb5WhdGHxCiDRVur1Ii2SjLIxzgw77gE9P99dKMefOHP7YkTEn/CKj/4vIGockW4aW1YaV
	myfupeUNXr5Oeql/XYcK/aGpJ2CyyMvNwlB72oa8lvh0W/NGLJ2pjPsfyOSdh4paYd3jQQxnNqz
	euRpIW8xIG0rMP
X-Received: by 2002:a05:620a:3194:b0:93c:7d49:7b69 with SMTP id af79cd13be357-93ebd2963bcmr143813185a.60.1791534036231;
        Fri, 09 Oct 2026 01:20:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3194:b0:93c:7d49:7b69 with SMTP id af79cd13be357-93ebd2963bcmr143811285a.60.1791534035451;
        Fri, 09 Oct 2026 01:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36004sm436926e87.8.2026.10.09.01.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:20:34 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:20:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update HPASS firmware for nord platform
Message-ID: <7u6phgc53nweamav3bhjea52yndb4ai3voeethawdyyptc647g@p3lh4f6b5hpm>
References: <c67f14a6-502c-408b-8f5a-14bd703d078d@oss.qualcomm.com>
 <bogjreespb7ntadbtdl5yhbhqkfbmi7edd267pr22r3depgbjq@tth5ymlascdr>
 <d281437d-96a8-415d-95e5-ffe837cd4a0c@oss.qualcomm.com>
 <oqbhmu2snqvlqqqve27blva55hqgc4fs5g7vtu2ktutudomo3m@2ug4kvnniuwn>
 <313a4e19-3f6b-4ff5-8d0b-eaacde53c138@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <313a4e19-3f6b-4ff5-8d0b-eaacde53c138@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXwoOs/WMD+unu
 loHmVEnwrQZ/q13QdfeNS7kAE1tJuP5Qnp/gsdfI2H+lG1roJtvnP61Wr8W7/WSBSZVaFXspvGT
 sOiMmYG0iA5AdCwMyuzTKRAyMPKSzkc=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8a3d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=3ViGLjuQtlMP3cAodB8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: bbMdn-s-L4AQsqMNujdo1h1WMPZ9gWIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX/equlU7IvTfo
 +JsbKXpraew6eQZcimDue5ravbAcracmyf+O78oG57ObWoQVUbO/mwwYmTv/Y5tllSXjO4Pu3Yt
 9H+H4GcAd4vTJBfqPq4ndezd02ur9pyjZ83bajQLAUORgYfiKIxbACxpympgQ4HJuKF1fYCvNso
 Nyn4MKTl7C4HcYNpHMw4LrBCkeK6KxbBKdn8vysLhg/5i8MCoGSk3Mw62bAKlPxVIAVBim/Uhha
 KmvTRNhtn4im1S0DfBMZjP7Dnlfv7kandy1YXKOS0ZgHkzVo4d/R+5YeQmqK7QjbptbkrVTTjwv
 57M717cwOk6lk3joveUiX8NJkFZmba9m4yygLscMRmDCnAyPC0w+ttUFUKUXivHwdJLSl9mFC2d
 NAu5Qk3+SElSfdJ2i+mrCGKi7ULFi4e+j6CYNw2dQ8ZmEW4v2Pv5s8WRuGegH0t2VmA9STYPlwi
 05dKKlhjcs2T1+N2t/w==
X-Proofpoint-ORIG-GUID: bbMdn-s-L4AQsqMNujdo1h1WMPZ9gWIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032

On Fri, Oct 09, 2026 at 01:33:20PM +0530, Saddam Patan wrote:
> 
> 
> On 10/9/2026 1:10 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 09, 2026 at 11:19:31AM +0530, Saddam Patan wrote:
> > > 
> > > 
> > > On 10/9/2026 3:27 AM, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 08, 2026 at 07:50:36PM +0530, Saddam Patan wrote:
> > > > > The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
> > > > > 
> > > > >     Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > dsp-fw-hpasslatest
> > > > 
> > > > fatal: couldn't find remote ref dsp-fw-hpasslat
> > > 
> > > dsp-fw-hpasslatest is the remote ref name
> > 
> > Please don't edit the quoted text. That's not what you've sent. From
> > your email:
> > 
> >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >    dsp-fw-hpasslat
> >    est
> > 
> > No, robot can't guess you've inserted extra newline in the middle of the
> > branch name.
> > 
> 
> It appears the branch name was split across two lines in the generated
> request-pull email.
> Can this commit still be picked for review, or should I resend the
> request-pull email?

Please resend.


-- 
With best wishes
Dmitry
