Return-Path: <SRS0=XaTs=CW=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7522FF9935C
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Apr 2026 09:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F24DC2BCB2; Thu, 23 Apr 2026 09:29:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A901C2BCAF
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A901C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8to4j179237
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xACOtnN5cYL5ciNpTnitvBJP
	1yEG/W2/KWGkkipBZ+M=; b=ZdSC+/HfH2WuKMbFAnhAWOTJqSep4Zsiz6m6I0Fc
	KhTOnReOwG7dbkOmLWN3tS3d0+2BvF5Fudm3sj85SbBHWfaMjjOhO8ozEDR+78YT
	Odt7LFYMMWLR30/M9Z2k/vphSxDDyF4DhL3Ovil3N3hoKxH+abl957/KmcC6mYXp
	oK3KC57Q4fuDVsQqHWwxRAxI+Bg7exAWEpAcwm3mY6tBOaXbVM8/fLcZto6uHoPr
	39HLdA0bSrR2Y00E+F2o3uFCD9a0FVi/7x9N7ks69F5p+sNABWgFu+ElQWhFTuaD
	9Tby4XsbarC4Ruzg+7qQnOgbeE88E2pn51fHj0teFv3qMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62gq2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:29:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24308165dso74209525ad.1
        for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 02:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776936591; cv=none;
        d=google.com; s=arc-20240605;
        b=cWBor0G+qB3ZRkFpf8niG5TtNsmUqL3kn9ZZD1AKEBetCkr8tHUW0FjIW8I1QnvmBu
         VXzf/glUUR1Y26uwTCeICmO7LbN3/irWazaOjaV2qt3kNLpTwO/9aVNUSBBg1R8zzCTV
         k0jFi79XSiNcchIUvMI2mxlWWfyRUVLIs2RTnAkDd/3MHlPLQtj4yvsPYKgKxHOMR9IQ
         1N9epCho3UZbdINqMwTkRvTSZ4Ubb+Tniybxjn8dV2BuhQkR1NAPMiRMjGf6JkkAK6Kk
         DLZ1YnpUOBx6ddANXmrI670JrmfK7m6mjF/z+h7iyBlB1lUU6w94KacR+xRrY6MZVrQ+
         dbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xACOtnN5cYL5ciNpTnitvBJP1yEG/W2/KWGkkipBZ+M=;
        fh=62tZUuFD8zmC58yWj84f/RiwrEkU9WJ4Vdk6NLs/W/0=;
        b=a7Zi91EugTMXgssfXJk3gB8a5nsomNtPsG8NKrQEsXm3UGnERhobLjsmzjxvfryCqw
         6I6DmsGg7iXymbduj6X/9SiuiTCWEySwmcS3rqVdHY3Os7aCkHAFE2Hdrt4i3eUYtOBP
         Dt5v3j6Q/uGPGPs+RdawT/6GqKcM3pLb0ffO5vE7OORZggqyyGZIxVsqIbb6O2H5jM4C
         DtBlTPWJEFqCmWcYscDAZJR0NRgAWgg46+1vtH2JcXXCBABpb0Js+kZE4rti6dtsaV3M
         zmVM0uJ/R0CteFI/9wgeK7+37zX8Oi3tclz6DYJcTiJuq8PZ8UBuS+Rq1JfoS6unjRvc
         4xJA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936591; x=1777541391; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xACOtnN5cYL5ciNpTnitvBJP1yEG/W2/KWGkkipBZ+M=;
        b=kJ7vOL2PGFA59oMfh1WqEPZLkAk410f1Lzfd8rEjuGvu7YNifKBlw+qRm+v0PDaqyi
         sxYwIRRJkNjDYhVgCIzFEhbsGRQ9fHn+ZZjj+OyhXWydIDiwoiVHNaKFNJ15brAjYiRo
         2NeD5MfrQUeSahe1wXhtMzUS8kYPhupW1+9eMpMtj+jOu1lTno5e59CXu3GIXUm/5s5L
         jpUn2wXoQJSRgyWrbjot8o+gy23iqK6OfbfoWHlwsC5dwqh5N3oBFoJZqjiR9EqGJ1tf
         NECto1GTLKU1aLTPAI3Xv8YcyUJoht9jNtdAujS+xTyYhnwFRlesJd7nXKKd043DLIrm
         fOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936591; x=1777541391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xACOtnN5cYL5ciNpTnitvBJP1yEG/W2/KWGkkipBZ+M=;
        b=F7I0l1iCZQVjppfZLTq29FqXmvy/VTgv1TPYK2468GM9RPS9GlRdgvGwmFjMzvKV7A
         EvFUt0VFwhwg6AFI3KQAdYGp5K53JYHFNE6vqflP0idoABxsVEYIE1gvTREOSeeMPk+I
         hIBTbpuE8mihYBMnkPXloSlgnO6ZgNosNuSHGk7p4jY3+i60cXs4g7gCYBQGbHc9sr+/
         TXgKAbWZ9e3QSXFanuwgmO6ZI8Tnm6MZxgVhvCYPTYYwTrDuxXhVn0MaLZlyvaN6TOLg
         t2pPkdnb1tdfTe0HnbtKktQCjoRKAUHM2D/LNYXpXVpmRSs6SLbSXM8fZigOO7Z0MwMB
         nhKA==
X-Gm-Message-State: AOJu0Yyk/QdELoM8le87h9DcYK7P/+4XSU8GtRCH+5ebuzuWLPZ5Qit0
	HpGTQel/rGv+Cc0GgvRpknV0rxwzjJGsHI+aHNywMhB6jiK1fYABZTAV12GeQlS+wMIqtW55uYM
	nk6RXPSeeLALCpWOk80JLij9Cy+aoemQ4N5WEYFVA056gAnJi4z9QMkzi9YCZqgSUx7XOTLvcNo
	0AjRjwu/kYFpMoAAIFW+t7FmQrk7NYlXBEl64CUg==
X-Gm-Gg: AeBDiet2qTXwy784LQnbUM/WhNQZKkuYD1wQkQylYS64/y34sOFmYL0aUT9EdBlw4kV
	Bi8Cfm50sRmq/YgByhYO3aFMBEgUUf4x22qObOQYR6D8+Rln/eYU7cTyYxjdSSPbgTsIR5TZYbz
	/0rR0Qrq6oAaPRBjnMUhGzoWOQhaW9wWMRLxvvz6V6ovmVN3TtymK3tFk5yvJMgVhM5ay3DEybz
	Qly1JrGpt3a19uX5Q==
X-Received: by 2002:a17:902:e8d5:b0:2b2:58c7:2cd2 with SMTP id d9443c01a7336-2b5f9f7a4c3mr205491655ad.36.1776936590889;
        Thu, 23 Apr 2026 02:29:50 -0700 (PDT)
X-Received: by 2002:a17:902:e8d5:b0:2b2:58c7:2cd2 with SMTP id
 d9443c01a7336-2b5f9f7a4c3mr205491475ad.36.1776936590408; Thu, 23 Apr 2026
 02:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <a53ffa62-1501-4225-b864-cdb1788beb67@oss.qualcomm.com>
 <CAO9ioeV_uqq2dKafV+XZAEgjV5sN_jk_r3s6aR=SMju1rpmQdw@mail.gmail.com> <90e0e8ba-7d68-444d-9a0f-c3bcf9fda212@oss.qualcomm.com>
In-Reply-To: <90e0e8ba-7d68-444d-9a0f-c3bcf9fda212@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:29:38 +0300
X-Gm-Features: AQROBzBGrVWPbErx-QlUmlET3f2gtGrFD6Av_0dy627iygSpMaWTnzDXEOQ73Ag
Message-ID: <CAO9ioeX-4Brq12T_EMNxjntGPrBY0957aE1e6LTD=NFFQHQchw@mail.gmail.com>
Subject: Re: qcom: Update ADSP firmware for Glymur platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: cyK0CTKsAnusMe2FgWAEeVlTqfovtKC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MSBTYWx0ZWRfX997Pg4aVNMmr
 U0BTNzl2bvGRH0Vjit+aOqSCugEdHRQYOukMBjytX650w3DpxHYpgez02heJvDjQgW4ymBGfcqx
 ymBYGVY+phQYskKGaw3xVlNI1BccDh0yTuMw1P8Ffpo9W9OpSMPfLO/F/cdDeoYvLdU9KX+8SnZ
 Cp6BxKH/WQsVXBNjHtPV+SkmKLza4JXMA3ypzW2P43Hr6Hws8tFcKHFayZUz536DF0iyXefBa8K
 BmtyEaaniWAVOEb2gH0DcZu+wHTkdIurt15QVQcMZcY/KE2bCrAvykJUGzBUSGVUoMbA4Cf/fe8
 HFYK+fxwg7wJXX24HxgeQ/0lhWNX7EKKlp9puUcLGq4I1DWFHQYRV26LqtgjA1qm+co7+oSRMBh
 JJYsbFtVxIOXHHR0plNGw7/hfL7sPXU6teJvIYP8H9YRb95DTwrVG+qtwkr34J/NT+tDkvZUUzN
 /MaXhUOMWqKMrubjaUA==
X-Proofpoint-ORIG-GUID: cyK0CTKsAnusMe2FgWAEeVlTqfovtKC9
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69e9e68f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=VKCThMSj6ikf7QzWX0cA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230091

On Thu, 23 Apr 2026 at 12:22, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
>
>
> On 4/23/2026 2:38 PM, Dmitry Baryshkov wrote:
> > On Thu, 23 Apr 2026 at 09:51, Venkata Kota
> > <venkata.kota@oss.qualcomm.com> wrote:
> >>
> >> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
> >>
> >>     Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> dspfw-qli-glymur
> >>
> >> for you to fetch changes up to 4a74616a3522816f6f33297219f9f27cfa4e3268:
> >>
> >>     qcom: Update ADSP firmware for Glymur platform (2026-04-23 12:18:50
> >> +0530)
> >
> > You forgot to push the tree to the repo
> <ACK> Thank you for pointing out. Done now Please check

This won't trigger the robot. Please send a pull request.

> >
> >>
> >> ----------------------------------------------------------------
> >> Venkata Kota (1):
> >>         qcom: Update ADSP firmware for Glymur platform
> >>
> >>    WHENCE                   |   2 +-
> >>    qcom/glymur/adsp.mbn     | Bin 18622472 -> 17049560 bytes
> >>    qcom/glymur/adsp_dtb.mbn | Bin 233272 -> 225080 bytes
> >>    3 files changed, 1 insertion(+), 1 deletion(-)
> >
> >
> >
>


-- 
With best wishes
Dmitry
