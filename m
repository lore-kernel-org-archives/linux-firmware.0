Return-Path: <SRS0=bvj6=AR=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705E4EEA860
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Feb 2026 17:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49D8FC19421; Fri, 13 Feb 2026 17:21:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51672C116C6
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 17:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51672C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DEHii03046919
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 17:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCSKZRM2zL6ie7QhxXTSiFxDqFL76bYZjqMfZ4rvKxU=; b=UoeG66boj+M3lsEz
	G5vUg2eBKA7ttglPRia7aRQClrnR/Nls+JSZP3mSAdUuOrDb1JnLNnYTwvEH8dSJ
	5B1t4XP2bQTTqxoj83wU7RGB4SruWpZ2FTJz+yL2Vmmd8I/ujuuHx9WW/sRq3Y5a
	cieIu0EChOFp9sUypD1KT2oa3+sbzj6/uw1ztVpKISH3i7MogXBwvfN6ks7VB9qe
	vPOXLQTRjO7v0Qs8iG3cyJ4ZrjMWzV+AXep34i4gMd6iZ04fROHN5dOWOxlu4jd8
	SLQNzP3LbUVJKuFWTL51ynGK8mKqwpgOsiV3aRHEaNZo9TSlkxORZjZKd/CD3VV9
	tyn9pQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2uwp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 17:20:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so439034285a.2
        for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 09:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771003257; x=1771608057; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wCSKZRM2zL6ie7QhxXTSiFxDqFL76bYZjqMfZ4rvKxU=;
        b=kBDH/z1dL5vQ+o0zWvpjLpr6iMRgSCx6m2vdB3QccozyYPKY/rtmt0A5R5jZtWsjL5
         MJaBTQw4BHiS+zPY8C9b9d9vSRU2rNtZn93HCiWcQ9PsS49UfQ928D9BICNwQN8UDxkI
         ENAwowU6efoHVfG4PZT5/0TPyKx0K2whZ3Km0b08vfA9zShxnSUn0xxBM6+fTGmr1Hkv
         lL5JAkU5gi/FtTeh5//5em99az6xfN21q0QoCJtmxSD0CDIyqQwzpNJQFRWxH4Fo6WVz
         Fn4WM1It4MTq4II3YXniHYmV1MXCHEE8wWzV2fIbEuoBNAcGT4c7ZCGM+J7cjLh9IARn
         FpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771003257; x=1771608057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wCSKZRM2zL6ie7QhxXTSiFxDqFL76bYZjqMfZ4rvKxU=;
        b=icb9w3JCyWeKpD3CCj/dQFKrEN6xFTKuOK2n8cdBK4Bk2AS2s5kOfnpLYTPmQ90+T3
         a5MojOmCMTdxdHSp6/4zI+W+RrEREmE5VIi1tE/QrO14jqXuNqgV2sSWRfoV74vaGUXr
         bICVPYn/taZY3EyyskcQQsxzfbwUYR2DgyLKtoIosAP0YR7NDBmcWxOOA5uxIMmhVnyI
         PsB3s2gTRzz2gu53Ad8WhyokpbOb8aLLUq44TKAc4SpKI6V998gQxdlzUCmfxqeQFXhh
         mesf+JTlOoXXuyrwhdmJDpsYW4vLL7o6FKzKCIHOh+cv1TLcuZkFeKSQveN1lUcifsSj
         Zfyg==
X-Gm-Message-State: AOJu0YyU2XSR1oviqntmiTxI36ZESzwFQ/YDixiCo9gk0WqHucbRzeYS
	h3FYrs+Bc5TdVGHpM4X11oQGChnB0XSx7NrKfQ7doadDhBrSkzcaQ70txZO/abjxRwpLO+X29HR
	u0Cmdh+ukAlK6GeiRh0k8vsaSXbilO23kOZeturhWSPN1kvNmiNjKsWy5D/y6ums=
X-Gm-Gg: AZuq6aIZHPFZ+HYFfoF+YwoPO9jBnRfHBptgNPnd49804RMMnJrpLZdzj4YD/qQ+/AQ
	4GnJMA+tAQYh9665A1v901oFCFUI1Ni6EiQCMi2lQ1uebWu8cv335Z1DzCrUke2GkB30ybomCn7
	1ZwMu6AjCV6ntm/yL1yTiu1PhHa/pECJoSHFLnL3R3DzJLc/782eID2M6MAlNj67eKOKIEPMYVS
	+f7JqYdYZ9KEe6p923fhcNkMqrgmgFUOEadLtfPXEQx2TTf/eItY3WR+rxvNHZRbdpjEtQwspJ8
	9g9wf2hZmd09mZEDruclo+saFBU7Nh8PJdwEJi1PXm6Kf2rS2x73DYNPt1vtgrJxxR5DfTlx4qV
	v54n0fvCdrM6AYt0PLzahhDCxKSskIJO0ul5tMRFLqxRqhgFbFIaT5wRo1bBGZUJbQMLG6A71qJ
	nQtFnWInj+yHDbOxlYNasfTJWipwU1OUZjGoo=
X-Received: by 2002:a05:620a:1725:b0:8cb:38f2:6a5c with SMTP id af79cd13be357-8cb4229ee6bmr331779985a.32.1771003257243;
        Fri, 13 Feb 2026 09:20:57 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:8cb:38f2:6a5c with SMTP id af79cd13be357-8cb4229ee6bmr331776785a.32.1771003256742;
        Fri, 13 Feb 2026 09:20:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5850sm13490171fa.26.2026.02.13.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:20:56 -0800 (PST)
Date: Fri, 13 Feb 2026 19:20:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] Add firmware for ASUS Zenbook laptop
 using CS35L41
Message-ID: <csrynd74as57znhoho6vpyp3yxsmlatfdewza4tjgd7u6oted5@itycikyfz2bk>
References: <7cd27e9f-49ba-4493-acb1-d25aa9d186f4@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cd27e9f-49ba-4493-acb1-d25aa9d186f4@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: kJ0apsuX7uq8em1G7WT2FOutf2LkiSfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMyBTYWx0ZWRfX6F9s3TkcDQfg
 xJooRenU22cIr2th3+n+da3CtOISbjRuy87soEtNiip+9e37ybbdD4VowgY60B9ujS5U0ja8ypZ
 zMWQEP93kIlARZ+6jWl4dHRGK/CtJqzV5+mGzrl9cZx0wqWZBFNPX+5nEhXTFL+ZE4nf5OG3WsC
 eVLu3Csmt6lSxMWtOo5rFe2r8cbpG9DkT0XoPk6ZaBacUpTac+RjB9g2670cP7X7NOpsm18YjPz
 CbRRMeWWyDBmIY8cP3OS7neHId83OHybIIQ6RLJpUWT2lPP3iNHS8CddsXS1X/WQOiaqIuQemxe
 fQe7REtfkbB9Wn8mn4UHNcTzegAuFbfl4b1iXjHEsu3M3ehgHg1ugsP7DtRJrnuh0IadD0EF6FT
 OTx+Js4NuOORlE5T0LL5C0XqXTzwXL156O7cv9p4ErdKrfDHGY3iiOW6o+XWmArPpGhj/mScJOY
 l+ZeDSZeVm5SE11QRQw==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698f5d7a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=p0WdMEafAAAA:8 a=A0jPmyEn67S3Fe9tcagA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kJ0apsuX7uq8em1G7WT2FOutf2LkiSfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130133

On Fri, Feb 13, 2026 at 05:07:00PM +0000, Stefan Binding wrote:
> We would like to add and update firmware files for Cirrus Logic Smart Amp CS35L41 for ASUS Zenbook UM3406GA.
> 
> Thanks,
> 
> Stefan Binding
> 
> The following changes since commit e6786848c80e773b742b04fba81ef237a4328df7:
> 
>   Merge branch 'robot/pr-0-1770957462' into 'main' (2026-02-13 09:57:23 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20260213
> 
> for you to fetch changes up to 39f04545b26fcb3581c3542d3b069453fbf72960:
> 
>   cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA (2026-02-13 17:02:34 +0000)
> 
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA
> 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/920

-- 
With best wishes
Dmitry
