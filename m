Return-Path: <SRS0=F0kQ=BC=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40953D58E6F
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Mar 2026 07:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 178FAC2BC87; Mon,  2 Mar 2026 07:08:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1858C19423
	for <linux-firmware@kernel.org>; Mon,  2 Mar 2026 07:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1858C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Lk2e02167498
	for <linux-firmware@kernel.org>; Mon, 2 Mar 2026 07:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lnT3Bopem4mRbe+wGH0Bvyp4
	NDqGTXzflEKh8IbMupY=; b=hxSKg1Hvj+20BMPS3AZMoK2FUjfIlMIT0RUgd+ci
	JgcpHV/Xak6pOSAd3CVKKZfD0CIm06nSvITuQd9LsfvmTOOP0Rn2yOo+8dZtA4Fd
	8At9048nZQQshq/yVFc56e3tRY5U9we72AVD9XqDo24jTsBR4xqUc5gCiXFUfvFf
	3e2Y3rqVQd6wHXtykzQYtfkK1Kv2DkHNH2ou1vzCPzZGtJXLnt5aT9mhmiqhCVL2
	FO0uJgHUJnf5ZtpPiXR2nyi+12rwr0fXvTSjs/3LKFVGkGlbxWvqPAXKkF21uKHT
	oO1M+O1b6tAnxbYA+bWMNVUB4KPblP+VpP+bcxUaPNqdhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg74c33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 02 Mar 2026 07:08:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5069ba5af5bso317393011cf.2
        for <linux-firmware@kernel.org>; Sun, 01 Mar 2026 23:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772435293; x=1773040093; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lnT3Bopem4mRbe+wGH0Bvyp4NDqGTXzflEKh8IbMupY=;
        b=BNgmGRvYouO06jWToU4uuUNHK6mx5LSvvYdQ/D4aUNP7gj3W1nErFognYcNtORUEEi
         UUJCuSCH32oE40lvA0GFwlumQxZzAcobpX0blR/fMHL0awliSBFA6ePfc3UgoBhQqKsY
         3EoDzEMSU9bK1ZWcuIa4RMl0tA+2b/65Pxy9BwmhwgHVybaqDChg8TtAWvJdeuCERjHj
         4AXvl20m3kgs0sDHcjEsfYKc+8L+55jT9z7TCbknqeA72GWzwKNDau8YocOJdqhvN4BI
         s2Yq31jaa+xfS6n0rLbVZV5+AbcKyTGp63HpQLMmClCcPrPvK44xgAYpzQCR8liDv+YR
         bOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772435293; x=1773040093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnT3Bopem4mRbe+wGH0Bvyp4NDqGTXzflEKh8IbMupY=;
        b=L3qQQ0nGf0wxGaWWSIBtyjdu2sLZlnDeVbTfGUdM9hAUQJXPSHlj7S1kQjgEXtC1ld
         s4o8AwVbgrHYtzy5C9oM/FYX6NyOHV90w7jMo5pAtY5QXJIq0sQ0PFoIs4+zgHBektsD
         cfIhlhR2ALmbzlPd0Re2Pow/3HD+bLHq4QSZnjTpLspZeLLxZkcUT1W0AzA/d9UX8qVf
         Bkfp5OY+6YrjYmnIrodUhx11k2whhZXovbDT2TI5OhGUnifbwABXjdjoMAaK2eyUQcH9
         czTrLYfmUEanHsraPd6kry/kKClh7931JkAC2POYo+tPSS8zYPND13Gtk0Uth+9B0j1J
         HjRw==
X-Gm-Message-State: AOJu0Yz0mdJraw2vHCZaNJjk9ZBhIftwPe3igRcjTcc/MVkbXeYtlCAA
	i+DenIdmh4vAWucwp/GAefOUZ/PXZFcE900gdjgTu5O2cRSiHmwqiQCQgRid8HlK29zd9sY/tfZ
	IC7uy3JjOEA08brZLE2idguYJIEyuB+f3O46kT4n8FI+tFePWeLMCuVJVXicQPMRHC7unyr8=
X-Gm-Gg: ATEYQzzY1xtSH3XnB3xruk55BpMjNl7lEMPtp9p6GDoig5hZBEiJDuGMABtbfv87Dyq
	QHP6CoUNDhgCAuKrHl59cMi+wkyW+io/itONIe62cD0IooQiyTeJHMaDxtcamGmnNg/3fpDhpTM
	IvJSA0ywil36DI8Ygz8rEQ0DOiuV6c06xZkT8zYazEYq82D/F4LfxSoDQxE74wf3wXO4IlVX09L
	7U+GVlH4AGMudJxFvGbeGSlEZ9/cO3yS2OwrHaIHKZlSlKBrwDOzkwC7VX5uMRnek63WvMo486o
	mqXh9gCh50RpHwnwNaAX8VU2lssFmAYwiR3fc1YPZf6MIsxOxp4D/OC4XyiSqJprCWMeJHYkooH
	VgR3twgC7cFnU5no7PV7uTgqMwiMrMpu2hjZwtlCIA29SCN404RPOXaOa3X6FxjnlzHFArx/IGo
	zUPocrKE02nwEHG7Ikwh1rX222rYqkNNn6Oms=
X-Received: by 2002:a05:620a:414a:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cbc8d73469mr1444253685a.7.1772435292853;
        Sun, 01 Mar 2026 23:08:12 -0800 (PST)
X-Received: by 2002:a05:620a:414a:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cbc8d73469mr1444250885a.7.1772435292335;
        Sun, 01 Mar 2026 23:08:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3021403sm25318691fa.40.2026.03.01.23.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:08:11 -0800 (PST)
Date: Mon, 2 Mar 2026 09:08:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP firmware for glymur platform
Message-ID: <kewyupqb3z6sh3jnuqzecigjx3is4mt26uc5wil5cybd7dzrtj@yaopwhgqdaoy>
References: <3b89cf7c-2e22-4951-8811-ea646c00be53@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b89cf7c-2e22-4951-8811-ea646c00be53@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8tqU2go2oJteNa0yK9TmJhZAq1xJxvTm
X-Proofpoint-GUID: 8tqU2go2oJteNa0yK9TmJhZAq1xJxvTm
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a5375d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=PUIcEVCv2fKjz7QtGy4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA2MSBTYWx0ZWRfXzuZwRhxhJ5M3
 H7sXDVkMtgfBSgoqIZLUb6hUULdqPtUGOgbRthx9xLm7PL76LSeM1kHEf4S1F/qWgJYlAnBcXcs
 dQljJDgnVNz8MAKbjPjiwmypXn9kvsa3lE87yVtaH4GHzQd6dsNad9X28YA4KW9qfTuct4d1DfF
 Mm13M8sThJAXowC+YP/8wP/lP7jmqVgyPUv7cL9RkAG5F9DJq0KJC6OZ1sG5iCff5VTnV3vBdlx
 6toGa0IlsrW6dul6kjsuwTR8iCZj068JrbFH5Lp/bGhhxIb/9xc5JUkBY367/ae4oet4LviWPvQ
 syaD7/+lQrZL6tCJBZvutJlQmuxe725MBaMVhq2dLfQGkIfk6JfkDmTKrEI1CS85jRm92zzQRpO
 tU5gno+xAl8jmHJ3imfoknEXFNsTKRWoRnEPPXrFQqGyjtLAk2huvrX3lTbkmMaFFdW+QdrISPS
 dAHvkpEix2KSR26Nk0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020061

On Mon, Mar 02, 2026 at 12:07:53PM +0530, Saddam Patan wrote:
> The following changes since commit d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:
> 
>   Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-glymur_adsp
> 
> for you to fetch changes up to 6a7534ae86f1932a0367f332741c06337e550eef:
> 
>   qcom: update ADSP firmware for glymur platform (2026-03-02 12:04:15 +0530)

Missing commit message. Please explain, what is going on, why you are
updating only the dtb.mbn file.

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP firmware for glymur platform
> 
>  qcom/glymur/adsp_dtb.mbn | Bin 7253 -> 233272 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
