Return-Path: <SRS0=bkY5=GY=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860AFC61DD3
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 13:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50B171F00A3E; Mon, 31 Aug 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788182081;
	b=Fi/das+YyEsOsn/57CK8JrouP9Zf35tlPxzYXSzqUr4J487uRuGmyiwS4EYgpwheH4pM
	 jA4clcRvMi044IX59oSSKtLXOM4byrXmeCpH+x7krpHbPSXclem0JYnE4aNnksb0/8QbR
	 X0pB5OMbgn1DGYuvIiUSJnfq0R0R/rg5CxtY7+ThOt6VYuetNL1bxuwZqGTu/iuPnxngB
	 bLvH2FrNpr9kgN8hJTFzfCjyhzGy9iLXLp815F/524juWpN68aGSxL7FGhrMZtlqGFhzZ
	 XMNuMHIQ6VB3z4ukm1rkKBzhfP7vEXCv0e1oUlDpCNPKTQ3c+61uCiphMLXcEJ/MZkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788182081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AoJFydEGQw/OdpYS7luF432CVpyhJw+nPoEBjE8bYAE=;
	b=iVTOXXMygBo45YuCreHQxDSs/TGZ3VAYiiU1SaWykDOS680nvXE9/n1uwnjboIiaeIkf
	 Fu5xz/Q0VndE/6DaORZBpZ7heNnwluUIKQWXI8C2HCHputWL7Sd862zb9AaZSYQEPmfKL
	 Rpexlic65JZ4XJK6/Lr21l1kkL+DUMsg8DdcQsLiREEliNVyE9NvLSF3wWNCKsxSxSzk0
	 x81VRWizvuJ7Xyr5DtC2cz0p7VtO0jDmMGMT8MYHzI3y7b1I6zaFM0J93CVcK59VEvkgO
	 rD5S3dw6DK5+wHMYFePM4Qb8h3tdafHdELfAcoo3nKjAn0PX+jOfHU+QNYoPsIaPWqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTgs70cq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8cIIYaN;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98EE31F000E9
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 13:14:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTgs70cq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8cIIYaN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 98EE31F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAKZR3600935
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 13:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AoJFydEGQw/OdpYS7luF432C
	VpyhJw+nPoEBjE8bYAE=; b=eTgs70cq4Q5zsp6Rydzw3ruDpxKBvfBH5uF8m5H4
	HtP5JT7KtJBaxocl8Ee3VrrVf9B6krmHl6kBO4uklVNgVtrbVS5zl7LdvLix3+Ig
	wqt/XoF+EZtbt7yWbZV0omvRRTeIcc5lu9xmik55rjzgi/VLkJKHyiFC9IBcdb7u
	GUrZrroVkhla2ioCvhawX7g3UPdBYs74V0y9dPRLj3t7BrJOZraXKah0Km9PbAUI
	rO8b4qWYPk43Gan3QX/ALWajG0jjFkWKLfM8RCZjIQniSQgsHgbRDNGmGSHxUAJ4
	akmvds367/m5r5rHdCmIO+PkbYwUCAtMD013ztG91fsBYg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgh1h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 13:14:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-785b66a7017so949363137.2
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788182079; x=1788786879; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AoJFydEGQw/OdpYS7luF432CVpyhJw+nPoEBjE8bYAE=;
        b=S8cIIYaNgUy9bg6BrYjHvYhsqB3K+/oK6wNmrfCCjuqHUSSX67VTbZ7D7tgFmkNEVn
         RY65rAOYSvFPI7N9Ynl3NIJd9nqA8kowc+KLYzG68ESGr8/kBhXvK3XvVOIhh6/ijkgf
         bSjhhPFK5+QFZCWE/RYbamfAtymJdf9aTOk2fqUvycF1pQqFa8IWjfbeE/+7bioLAnN/
         3vAi+BMlXK9rGkWTOoCbvxPPJMizcqXEstljkYwaqVI0XA9BB0kFDD9tUMhYezvqLegG
         2KHaDg189Pf2uUjAoviBMc1UnMnwKbJj2BxuoajC4RkyjcQ8D1XrNVq2Lp79YpURT7lV
         EmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788182079; x=1788786879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoJFydEGQw/OdpYS7luF432CVpyhJw+nPoEBjE8bYAE=;
        b=rr68Nx+cOhKd/CAzopQxo8x6vWncroKL1TkSjyZJVdvVShMUR5QM6Mqo5f80j3Sx0f
         vQSacE75y1HjqLi9TNSqbJZpczg4/crs/VVJpiZDaA0xgr5kf4TO7JjMSoFjaJfg2uUr
         88zRR69xPu55yjY6Jpq3plsKuMIrfXEFkoa89W5odqG7+hENFkzOJOp9h5VcxQiMWGuR
         MkdprfiASecZEgpPeCQMZSwqtj9WjQoVgKDhm0zBX2T7W+A1SQcMi0QqjUZpP8CztF2o
         4/4DJ4qV0HUovThFiyc/ZN0iVc9kwWD+N/owqcGfHMAL67w38TWUEYiOgCc+ut5vHUIu
         nhwA==
X-Gm-Message-State: AFuF++ktY4JIiYet+MhI8WQfSIftUnBGEmUcxDm90MXBwsIB479QPV+T
	ExZDxL9PWCJqqEn9MPQT9io5Hn33vJQ/zeV3myXDMYNZ0edtGZBMwQ9VA4cp//l7Ibc5LURH+rD
	vRHisMmRFyOOor5aHzSBuQdUAJbI4rKLV40hVTnwKn9HKeOI6k4+Vw0618t92rIM=
X-Gm-Gg: AR+sD10CyPcAG+s1ea1K9ixC9rwUPi9AzRpZw4qm3YxGLawmVwBVr48KhLUTFBqFf1Z
	D+zHG6Bz8tbfrC2+PfOuEiFqBVcjhUViGtcT5cFy8jwEnXywU69hudXkFeFQjV+X0SaVHH9mlva
	ORSxk5FpI6IXtmtef+JhPqcs0s51kpLTvNkfM+2x+DhxQVx7nwRXR8lsnc3sm94rLpDb/wfbrhl
	w7eVoJaXEUG6yCni2889X2f85YP3etWM2VHW9w1tV3WCPqEnOpF3ZlrzdRKae6btvjKlcoVA922
	iRttyATO737uwFkAw+Iem5bTd/3TH4vp+fKTZTY+wk8ZHHcN1tei8wv/rb+QGeLcBypZxKbgDv3
	eU53cDGTiHLlzhkW46ogBqaV9yCmvIglGUyR3FMwfRQMZSv8GIGiKLyOzV0lNziHdZJfiOLTp7v
	TkKOhxO4quTaRg
X-Received: by 2002:a05:6102:14a0:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-7859946ad68mr8218156137.12.1788182078660;
        Mon, 31 Aug 2026 06:14:38 -0700 (PDT)
X-Received: by 2002:a05:6102:14a0:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-7859946ad68mr8218119137.12.1788182078111;
        Mon, 31 Aug 2026 06:14:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3053c1011sm20104861fa.13.2026.08.31.06.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:14:37 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:14:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: add ADSP2 firmware for nord platform
Message-ID: <4mibwidjawb5gc7euccsqmcx35cmkjyiv6sn6c2ypf4oke7zbb@fpzdywqt7pag>
References: <10a44e53-3531-4160-9782-f7d62f7efb6a@oss.qualcomm.com>
 <xtiujal7w3ydojjcloqunfhvei33i7gpnxzv5ae54qms2nvdlq@4dzxi2u2frik>
 <3ad36b00-f9b1-4450-ac63-40b8b7c9d0b5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ad36b00-f9b1-4450-ac63-40b8b7c9d0b5@oss.qualcomm.com>
X-Proofpoint-GUID: EKTWKmQUiDQnW_4fbE9KSIciuxJPIE0O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExNCBTYWx0ZWRfX9Kv0uhzZZCWx
 l437JPn1bMGAQNJkKswL8M+ov7Efqo9gx46kkhApvVH6wu/RkwbMtm62OTOjZpBahGZqm9410qq
 KG73jjh1qqJDt1mkzHzkODF6eiCaxUo=
X-Proofpoint-ORIG-GUID: EKTWKmQUiDQnW_4fbE9KSIciuxJPIE0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExNCBTYWx0ZWRfX7elvQdxAshRM
 soWLE7iQkw2ix0fnnnBpeGEqrC7kCaI3HNunUKePXfguIkHz/gWvlxwBFCyexaeEirBLVtfAsVk
 RPc1QgUFIL28xDoYasY5idPLqOp+2e/q2emhhIjERtEhZ5Dvay+XBe5CQE4EoyawDLabu/PIRa2
 kXTHN9Gv25UTxD5O0LycD/MAXGjG6IkpJCYUegll0EzjMPO/MX5KzexBcjlOLrGaagyMbGZlyNi
 zjcNxD7gnt6uEveHfI2xUwCZlR6IXDjwWTMIzLuejAsnc5g4G5yUxv08KMLdGcuoeBQ4nqrnQNT
 NGSmbTpqxm63UUSxsakTVBpQ0e8fUCSGc66DoEUZGMwMdZF/DIX24wFWuvNBbqv98IqRu8VVdNQ
 CFpZhSgsUM3TOJAN4JqybPwmYYw01/xx/5W8xkKnURSyDMoLvL5Shr59Btsu1q/2WCFqzLz9yl1
 DwuvTcmXlff3bj8ikrw==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a957e3f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=-l8ANbaLA3n2iiZxObUA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310114

On Mon, Aug 31, 2026 at 06:20:06PM +0530, Venkata Kota wrote:
> On 8/31/2026 6:03 PM, Dmitry Baryshkov wrote:
> > On Mon, Aug 31, 2026 at 04:00:15PM +0530, Venkata Kota wrote:
> > > The following changes since commit 458e40fdbb4dad5134ec230a42df21aea1b5baf8:
> > > 
> > >    Merge branch 'amd-staging' into 'main' (2026-08-29 13:09:19 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-nordadsp2
> > > 
> > > for you to fetch changes up to 93681b24b15639f4e56102f82da073f0bf63fcfa:
> > > 
> > >    qcom: add ADSP2 firmware for nord platform (2026-08-31 15:51:54 +0530)
> > 
> > What has changed since the previous submission? It's still a separate
> > firmware image and commit message which explains nothing.
> > 
> > > 
> > > ----------------------------------------------------------------
> > > Saddam Patan (1):
> > >        qcom: add ADSP2 firmware for nord platform
> > 
> > Please take a look at the DCO documentation. You are submitting a patch,
> > created by another developer.
> We were just checking why the Robot was not getting triggered for Saddam.
> Wanted to check if it was an issue with the User or the mail client and i
> pushed the mail.

Would have been nice to have a mention of it in the letter...

ANyway, no, robot didn't pick it up. But it also didn't pick two QCA
submissions today. I can only repeat myself: please start pushing your
changes through the merge requests on gitlab. It would significantly
simplify review cycles.

> We got all the differences between ADSP1 and ADSP2 now. Saddam would push
> the commit message and re-send the mail.

-- 
With best wishes
Dmitry
