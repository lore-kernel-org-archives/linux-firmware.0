Return-Path: <SRS0=F1LP=BF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0679F47CAC
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Mar 2026 18:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD739C19425; Thu,  5 Mar 2026 18:19:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3E3AC116C6
	for <linux-firmware@kernel.org>; Thu,  5 Mar 2026 18:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3E3AC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AVdiL2400586
	for <linux-firmware@kernel.org>; Thu, 5 Mar 2026 18:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=huFG8+uuJT7zznoSVri9HZt9
	dtLn84XnF8dq0ASerU4=; b=efztgbdLxsH4UPLB/7cHLawh7kmRGEkFiLTw1GnY
	Tr82wMuYtcQXnQzGM0HP7fUaxxxQ6dDkk/DwzdSnQljFn7sm3+lSTthYr+pqNUcm
	mNJOEHcvKzsyHYHrY7+G9UH8B/dLgW7xiwAhuDX2RG2K/6J/dvEnVmoSJsKUEHKK
	RK3CxhjTPOaynMpAr1yeymSKxHMFmTY8wvH1ntTKlc9IPGhMiJjC/7xeJYl7zgb2
	Y+C8eg+bwfnIEdNg0a4u7/Cw5AO1qlcdgIGmYXbqcVW0qH9JAgatQk+kSpC9pM74
	j3uSTRBHn6GsD0k8BCSPUwhxTbtYemVBbfS+Pv3m4IiNmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dhh16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 18:19:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c882774f0dso4871282185a.2
        for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 10:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772734780; x=1773339580; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=huFG8+uuJT7zznoSVri9HZt9dtLn84XnF8dq0ASerU4=;
        b=XruFJEgFy+SV7bYKhhQLgQo8c/CWPp0CCwf44lTjL/Y3La5tgHgad3SKq5/GakeYP8
         d71yjEVrOJNBDo+qC1PcB5NSFWdbl7rmtqRdss50p4tG73LJDb6T1cYAyTpHK3YUr4mm
         rhHVP9bpO3BuEfzpGDTif56qZT2NJ4b/gz1gb5rY3yrVxJHh3H+s3P9izTcA6njamRCS
         mJ9foLhkydvpBaXPQ0cRasLfUi8z561sWsn6P1nQaAnjJxtXcpYoOjBu4sQJO5cuX4wG
         8SOy7vbV7OPOflD26e5XJg4n6mCJ9Xr10cFcNoBzoKO0vkJpyS+fkIemx1Zx2QvOlF7p
         tiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772734780; x=1773339580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huFG8+uuJT7zznoSVri9HZt9dtLn84XnF8dq0ASerU4=;
        b=JtjAezgI935SuvK+r0WU3JxJRg4RRDaQYcuD7u2FjKRjdRIkxPu5fQW12cvjvK3onC
         Ome0tHuPPpuLQupCycUdGdna8eT/5QUZs5961UJDpECXEGHqZfbmeTp8CGbwAtIPiW3M
         EFZntRaeBMIr+Pp1zT7jwdQ+aeqlOQU0vEB7sf1uLwcZc71hkIkhSvB63nB0HTDdPnRj
         Ux1xjKHPvefD3nSP8J+r3I6uVQPMrLECcW0PcrmMTCS5IRYqecCX8LvacanetsH+tbOH
         H66/bAcqwSjjAC1S7V9/rJwhxhOrgIli0aTXCQqm8Qy/VF5yPD+NHst6G4ujFaVfIcJL
         PVWg==
X-Gm-Message-State: AOJu0Yy6M0kdss9N7w0uWJK9o0Y6bNSG4bP/FeZe3psvGo3k06Uyec7g
	/0ATzwmYYLN5G69dZOEyOhCT9/yIG4jSTJCNImT3U3kxjEJQT40NSk+1n2S7/1RYmjjSS0LtWFY
	sZi7wn05Rbjs1OnE63AvVv4zV321UXoFTR1G9AlUd3yNwuf0PSfi4ixVvnzi4WHUTH8fsiHA=
X-Gm-Gg: ATEYQzzuc+d7rhTixzD99j8rORAbU+sneeJZ/gasaq6HyoyFUlbF5EgRt2pSx9nQuXs
	U6bHvDiShGm/RsMD1GoBQmuEBYO5AjGS/DpI1Sv66UqC505mP1dodRb2QZkbGh8sMD6Ve9Plxyy
	gCQX8zi6eZOryKcJGIjKGXhj9C7Qop1J/ZpeSATEl4DRKYuESailJNBm4TrRucju6LorzR5O9DC
	HtfLoga5TpL9lnhVu3m8twGrZN9aHPTt3cMzP2VA9iP1bk9uxyo2gbXwBo4iRskk8olvWuFWe/g
	BLxWESAYsog2eBczdUEKKwvm6AIwbENi9NfVDlbsN+Ir4gkurwEYF62YFnasjXeWXnz7pH/d6GM
	5Ot9JxKo0/vy2Lz/SRgtRw7HqFUAqsTAZOryzco8L8gxQr64m4dpr65pUc0c0jv2lvj08QEdEXr
	medsbQTotX2C8J1VfZPXxdLznwLqeEH1cZ6B0=
X-Received: by 2002:a05:620a:4003:b0:8ca:1e09:48d9 with SMTP id af79cd13be357-8cd5af1329emr872506985a.35.1772734780265;
        Thu, 05 Mar 2026 10:19:40 -0800 (PST)
X-Received: by 2002:a05:620a:4003:b0:8ca:1e09:48d9 with SMTP id af79cd13be357-8cd5af1329emr872500885a.35.1772734779694;
        Thu, 05 Mar 2026 10:19:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a135678d22sm336973e87.15.2026.03.05.10.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:19:38 -0800 (PST)
Date: Thu, 5 Mar 2026 20:19:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>,
        kssb@qti.qualcomm.com
Subject: Re: qcom: Update CDSP firmware for QCM6490 platform
Message-ID: <5qcr3p3uhiklqiy2rqdocphouycgynjfue2zefgybpvmylcdwg@utyftpv2neb5>
References: <e643e0d8-4f3d-445a-991c-a95d564d96ae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e643e0d8-4f3d-445a-991c-a95d564d96ae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0tlU1CAMjZKnVryOEcphYolfkoHFvfzL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE1MSBTYWx0ZWRfX+n+A3MvwPgyt
 E3G7Dhz6bV8U1uoN3+foGaxqqaAiYWtVFMXbf4EOQaSD42tP6EgEwlkqXhZkeQeFp69QzZkjcCa
 2yZSOL0spsYOZ05b1GMwWU3DHFwGTbOesleZVJNn6uyyjChrSdHkFawzUWCXJixRwSZ0Ndo6NRL
 s+C5YLhTKiiuAnCZx8LjNK0FteiyVOud/2CM+BpBFSE/yNlT2GNva6AKj7HuJDN7pb2F91M6bkx
 rHph7+8QaffNg4PDZ6+tk9Oon4U/+gVJNGiAsG19V9j79C7tmYvAA4m492i1I9ooMwLc32sSrPJ
 ML0UGq78HzlpbgLcYZgT68M/tY9dgNsheAjXooP9w9Pzn2c4QitXYyHSEbLM7tcrHfeYcfKQTvN
 zrX20V8dtlc44mwVmuog1XJKCfD/uGSRJX7k8Q5Uix5KcGJbqtbrO56MTaGG2udQN2RuF6B1fad
 Kct6Yjcv31bK7C4MWVA==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a9c93f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=ikl_Qxa23ifpeN5s7fMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 0tlU1CAMjZKnVryOEcphYolfkoHFvfzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050151

On Thu, Mar 05, 2026 at 09:31:20PM +0530, Venkata Kota wrote:
> The following changes since commit 4d2b2774ad4415bdb0a987802ea4324c160c1d14:
> 
>   Merge branch 'robot/patch-0-1771956864' into 'main' (2026-03-05 10:25:09
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspbins-kodiak
> 
> for you to fetch changes up to f58642691280c62d91d8612f547c1fbe99533271:
> 
>   qcom: Update CDSP firmware for QCM6490 platform (2026-03-05 21:24:43
> +0530)


Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/945

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update CDSP firmware for QCM6490 platform
> 
>  WHENCE                |   2 +-
>  qcom/qcm6490/cdsp.mbn | Bin 3641344 -> 3641344 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
