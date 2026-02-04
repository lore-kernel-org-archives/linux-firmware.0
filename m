Return-Path: <SRS0=9Qvs=AI=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CADE9D40F
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Feb 2026 17:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99364C19423; Wed,  4 Feb 2026 17:44:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 999CCC116C6
	for <linux-firmware@kernel.org>; Wed,  4 Feb 2026 17:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 999CCC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIZ8i1401964
	for <linux-firmware@kernel.org>; Wed, 4 Feb 2026 17:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aHsrfprZktYuuOp72nS9bgf3
	dwUX3nERmaLiQO3UzGU=; b=iAP3aTjpKyJyVN9ovXSP+zd1s4LSAcOI0bJXnCAJ
	J7mgXhjkuRPJ8gxgYS0NmijXtwu6aNgqSpqmPFsYgJCp+iJQaiL+rxHSP9sR4FQB
	HeJYGBOXR2VTJ7bDrOUPgibrYM5p4e37bMTVS28MMwtz4sc43Fl+sanXPuxZqID/
	xsq5Y5I0HnNOi3W4GDT6doIHjhHmHfKNIX6Nij331p0KyHcPRSsyb+IkJkP9A1cH
	pOUqtmmYDLHc7IgHXaJIfi7FOoaJup+DBCvVjsjVMCGB4zndmqyqg6NJdOmLODeZ
	cLEZ35X46RVhwVGbwtcerG/VYsBBd9CjRGah+g7vo+CfSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh1hph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Feb 2026 17:44:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3e7722f1so95405785a.1
        for <linux-firmware@kernel.org>; Wed, 04 Feb 2026 09:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227082; x=1770831882; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHsrfprZktYuuOp72nS9bgf3dwUX3nERmaLiQO3UzGU=;
        b=EhpIlk5kINBnUBTobKvWXvgXxYbd5vFFGZUMQ+KCjPTjMiJ46HpAIeLki5WYvq9AUx
         YCKDbKmWiEuL4wlNSbPv8IBc5slo4IhIg5fQT+0VH70G//mUZZiI2otMLD5uvk/Ok7xd
         /l0ImafCsiLXarF+rj+uY9AI/61GpNjTd98vsMEDZLgj2ct0mf/54A5AFYKDB2sL2Lob
         qni7R/I8NI8Nx+vF0PqhZSu0ZHuNGc4Msxl1QBH+isGbDDIE10ZQErxXyWo9+tf9ImcX
         H7pLh7sRkfTefgaYqTv1KtfmKg2+72/sIUPYmv3GM+w5aOx1t1MkdO/wPCO6Kn0S6GR5
         hDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227082; x=1770831882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHsrfprZktYuuOp72nS9bgf3dwUX3nERmaLiQO3UzGU=;
        b=cfDhtim+t4E64e/zMb7Q2yY9CmxhHZvKSsyHKNMwkj9lcklg03k00Sf9Lsoa7+/EIs
         vzs2BdZ16xPCDWI8Z2q4d6HJdRghpdMznFr8yEa49HREJYy9wJni29Bfrk0KZ5QkMtqu
         QoyTVw4NQQ1R0UBny9cGQg/VW5wNJ4Hde6VFWsl918xs5BIHwJluXabbG6x84Ox2hJ2O
         hCIadD3loxr+EP6rLQMn6Psufm69XMijY4TgCO7VHLUNIEOnvbLxnfWlFAE/TtTInJUH
         lIXcXTV7ExTEXiwY7V7DrOFNbcefVK3jNJmBw/LKyz0srBhQ9w/eZl82XDJxPpsCdM/8
         ZivA==
X-Gm-Message-State: AOJu0YzT7GJsFkNLPKtZzj/jx4/72kShPIz1sxDJ/YrsTS/DtiV+etVs
	W1oCgsmveobxEMmh4Jn03nLlK8ho8ug5X6JyluC5hSb3RMfvnD7Tqeva+8nTIx1WYEOXoVGDN93
	o3bRhYEuifknepTH9GJ3gpYv2hZvHdj50CEGT4cdByl9JtMiLuOfLvsUTCKaiTRo=
X-Gm-Gg: AZuq6aL6PWW3rDkZ3nTD1Um8w7iiBaWXde27YERS9mXXLu6ldXpYJ2JpDunrejKfWZ7
	VklVLK0xFNNYvUrcJqUkAtOOGDJejSRoqVxX6/TINfzjrDSS0xZn+Af1Tma/yFrS8Ta7dlrw3FY
	+KTi0xdOssn4subDfmdwHSaFN6TlMefQpmEo/sdhJ97G71kvcD4RnjYb+uY9IGlUHg20mCc3D2k
	ESyY6MYmpdU1DgysKKwHz+3WUfVIluHcvihhw860OY6mTjUsVRy7v4TeyU8snsPi4RB/rwu0sf7
	HPSCDZ+tVXTy12fqlvymuPFOpSF7TNIjRibSOzm48t5MAnInH7ZrSeDUuiFrIbawEqcIhrwBXEc
	MxovbLwovU2p6jhWacSKPXqXBzzhmkrA/9Oq+bYHdSuUnjwbxH173K4iQFxlZATr0Y+GBcuyDxQ
	Z7HVi0iuxFUdh56COztKJpE5A=
X-Received: by 2002:a05:620a:d8c:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca40c40774mr18077985a.32.1770227082491;
        Wed, 04 Feb 2026 09:44:42 -0800 (PST)
X-Received: by 2002:a05:620a:d8c:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca40c40774mr18073985a.32.1770227081991;
        Wed, 04 Feb 2026 09:44:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3912f079sm671349e87.44.2026.02.04.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:44:40 -0800 (PST)
Date: Wed, 4 Feb 2026 19:44:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260204
Message-ID: <f4smcbpxikew7b3q7jnhuvojlhtvgql5po46xtcz2hfgsgbllr@a47zk2likq3f>
References: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=6983858b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=OQxrAGhQEmtJb-q9RkkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: PFjPEUNjiZiQIhMlb770_FqN6AIJJb75
X-Proofpoint-GUID: PFjPEUNjiZiQIhMlb770_FqN6AIJJb75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX55BmlOrcn/8i
 fCYhfQ5a97GEORZzYZYV0KK51awphFhN4zHiePCElgu/+2eSorKjnSsCnzWpnNa0+yOcF8HOLgL
 rnPkZzCb1hLUCfhlmRDl7Oc5TvPmuKGifqOg6jYA59OOcaedTIvZIY926sXhTGdAhDkjD3pf8VD
 LzxHVyOcfURzhwFdzWhnF58KwtzwBoZBXIyuY081CO4KNjqOkmDKDrDbw7rDVfYP+RUAgXEK7kg
 Rj4vO5YjxOoTUS67YQmLBMBDi0OykL6vDOUdtQ1zbvUEuaPk0bBybP/AKyAQxo2O749SfOqCj3a
 7CCB1LmpOh2qqQN3j2QWBSabteJ0MeYE9ZRi83M/ev/hQLP1eENdMjXafWGOnX/SwlnAK/zDmsK
 KpCBrTJU8i/yeA/An9nxKxGjahce4HxPzvoiv/QUrjxwyQbPiOcskV3ObSr6m/f+YyH3+su2Dni
 /jmGS68sX7nFjqNKuWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135

On Wed, Feb 04, 2026 at 09:18:03AM -0800, Jeff Johnson wrote:
> The following changes since commit aeea3bf80600892be582a61de1551cf431341d9e:
> 
>   Merge branch 'robot/pr-0-1770184708' into 'main' (2026-02-04 09:13:00 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260204
> 
> for you to fetch changes up to 81a99dba039a21fd83d37a67a7de0fb80152e065:
> 
>   ath10k: WCN3990 hw1.0: update board-2.bin (2026-02-04 09:09:43 -0800)
> 
> ----------------------------------------------------------------
> 
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.

That was really quick, thanks!

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/906

> 
> For ath10k update board file for WCN3990/hw1.0 to support:
> bus=snoc,qmi-board-id=41,qmi-chip-id=30214,variant=Qualcomm_sdm845hdk
> bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk
> bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=ECS_QC710
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_blueline
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_crosshatch
> 
> No updates for ath11k and ath12k.
> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> 
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath10k: WCN3990 hw1.0: update board-2.bin
> 
>  ath10k/WCN3990/hw1.0/board-2.bin | Bin 742192 -> 867116 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
