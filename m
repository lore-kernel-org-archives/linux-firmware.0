Return-Path: <SRS0=sZtb=BR=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B6EFF6E80
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Mar 2026 20:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C64C4C2BC9E; Tue, 17 Mar 2026 20:58:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4840EC4CEF7
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 20:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4840EC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIK6mS162310
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 20:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=13JEGb7aTnX7IY7HCWv/idnN
	4TiZVfefOdq8xjCIpRA=; b=PbX4K2Bqg4rwv9YhBy6BCIkis1123gnDwv1ZUynk
	avZ4xOdADkyRER5OZ6i4XUeUqV+BvuIyEchK9dODrt50fnytLyRlmcEV6Ku22Tka
	QWu7KKQJH0hd+CnHIoMSSPRfBBQBSUNni4UK+WcU77OT+gb7vV8s30S+ZzpGuSAP
	R9IDtHPsRJwHDGT7ZvVtQgXOqDPlR9RkjVrU3KQupUBuDOKFeqbKJnR/EEZZetJ4
	jENqq3vrgpgdTCfDTsmhYoiyJd8GlJi+G5KU+YaUuDL0wkOEjdEw6hF3CcYbogq/
	+8/M2tQPoOEDoEnGclSKd5CXB+zk4SaG7Jn5wL7GnX2R7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxk0fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 20:58:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso179060085a.3
        for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773781089; x=1774385889; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=;
        b=eXlRq49YM+giR3dMVarStN22vzYVER4A692Ap3+17bMrhNDDpXExnex0BjTf4jrbL0
         8G8G62YajcxcgNcTEDK4vQZRwBEFjVd62QwwQK0hYdxwfffgBc1pBI97zsWvN5gbaEbM
         pcD0kZxs9KiOzJIQZ3vJC9GkOgqAm9VFH8BOwPVH4SOePgSec4oTQIqT4fmIfGPMnQg+
         71YrBdaWbKamw28LmnWbpITf48GfwfTl8pIbEPbKNnxCfri5m0YfS4WIjjl2Jds1vnH5
         eehUQNWSegUm1AFuGRxi+HI3OIkgQjAL7zvB0OeaQQFGTykPAlIVB/EjxR/xKYwUpbA5
         2qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773781089; x=1774385889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=;
        b=b5GJvK6xB8gMcZzRBaO5OaWKtPgxZvWq67vE6OJ7pvDbx4BdA0siFyb8YKhwtZneTe
         DlIqezg1mXFBd2mvIxSSzowi2PRfpaDq/5kRZi9NTZNlHL4rTN0FE7DLpXkaTkuyuMpk
         dSW8epJxQUVBo4YZbEl09DnYM17ADixETLLO0sCGkmBGiPzy0/oIgSsSCE54948Q3Ldx
         P3BrtS41DGd62tYyW9HvrBmM8/K1gDxzcxQPW2SoX8YA6fG4amgXeuUUmNdynn4KOfOZ
         r7YDFe5sYXsCqjaKAPNgyEWOisTMPaHBl/tyNtYlW0n0sStOLb4ENW+eOmtEPr2W5KLy
         2Y7Q==
X-Gm-Message-State: AOJu0YxTRpnSAJCOjbUbe/wdsR5nJs5/jo+eMIXS1L+OCYli69MSb74M
	qQX+ILUoazoTC5drsvI17+vNelZuWuDcqxViXI20ZkJItrL4xUsMt90E4UrFTu+fdWWgHDQpLmE
	QY/EIGA9HP/Ag3Yfb8qSnjmZL5CUBxQ8keEq8ej1ErxRhRCDgiksvJ1oUuT3U0JlXAA0a7R8=
X-Gm-Gg: ATEYQzxjQewGvRL+UIRGCV2lCqP6aP8D8KySu/1I7adAwE6NlCGwLUuqYnSf7BdG5gl
	voEA6aYnGgpCoOXTLKcvhkbtxE7xJ0X54Yp+AZEWl57YX6rvHF+HYtA9dUeSK16u9bgcClKK5+X
	+jcjxxat8OrxQXKewnB6Yitjfg5miRx4areM15KVZanxKFHPbZIQiQ4h2SagcRbJM2PBVxCGywW
	8aijb2GjIb59aEot6Zl3/e8bPGbKjxe/M7sDmF8kD6UxEvp0YGrEc+PqW5q1JUUHPqSUrwcyvaz
	LmL6d7sSkW3zJKJuvHhdwnlBd6rU4pnhfpk2KtdQe4RGAOKHQDO3GkGoTf343WJ2dhB2xePwhcS
	MT1BYg+iz4Pn0GeaQ+thz3MfGYIHYTVCKebhyvoKcpf+MYxwXUx5RFgp2NOsTCIAcciwAjsmlEH
	MGkvwBx1ctxO53LUwTKDWwDGfWC2+PmWPfqyc=
X-Received: by 2002:a05:620a:7016:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cfad24abb6mr161538885a.21.1773781089338;
        Tue, 17 Mar 2026 13:58:09 -0700 (PDT)
X-Received: by 2002:a05:620a:7016:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cfad24abb6mr161534685a.21.1773781088780;
        Tue, 17 Mar 2026 13:58:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7c77fsm101863e87.81.2026.03.17.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:58:06 -0700 (PDT)
Date: Tue, 17 Mar 2026 22:58:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260317
Message-ID: <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
References: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
X-Proofpoint-GUID: 8e3NIlEOMUc8MZTlgSLV3I37gzOQp-Mm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NCBTYWx0ZWRfXxOYwx22skQZB
 U6nn5KCVvA11owcJtmuU9yJAXtPBqOBNygIsu4MFuiDIfBxKx4cphv78zIQ1KJEgjNjIVBFIVVl
 QS6eggoxYTcl9xwkRMki3qfGOHdjPyslqhJF/CpPAN6tfZD/ix2B7lbdjhnjTt1je0mTENMTLoY
 oI56kXVedUV1FwMQnU94tcU0i0xM4PWxrkFnwiE0AMJol87NEscDLhptvoqsIINQ4sPtb8pcRwS
 kyNMYgiIDtNmLfUxhbEJF5AVsksP4V+hnrctHRkZUtBKa6H39p9HcNIcTSGXTktC2d1fj2BDnsF
 x7mZMwI1Yw/lDSIFhfH6iLo6QqAXM3T0nKa5wlsnZ6te8fFCYnAPS3t90jSs9X00Y5rJ9k/AZz+
 TIgznng5nj7kuKKoe6AIEnbzGkksBhBuoZj/bf/AiFRFlMRj9tN1EeHpCRJnl8kgQx55AkK2O9I
 UpTb5dY6gBKJmxWsk7g==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b9c062 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=5Y3Z_7dTJYxM88ERm3YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8e3NIlEOMUc8MZTlgSLV3I37gzOQp-Mm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170184

On Tue, Mar 17, 2026 at 01:18:59PM -0700, Jeff Johnson wrote:
> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
> 
>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317
> 
> for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:
> 
>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)
> 
> ----------------------------------------------------------------
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath11k
> 
> For ath12k:
> Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
> and Automotive.

Thanks, updated and pushed out.
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/962

In future, could you please include similar information into the commit
message too?

> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> 
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
>  WHENCE                        |   2 +-
>  ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6090816 bytes
>  ath12k/WCN7850/hw2.0/m3.bin   | Bin 299660 -> 299660 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
